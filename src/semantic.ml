open Ast

(* make the symbol table *)
type symbol_table = {
	parent : symbol_table option;
	mutable variables : var_decl list;
	mutable functions : func_def list;
	mutable table_list : table list;
	mutable table_attrs : (dtype * string) list;
}

type trans_environment = {
	scope : symbol_table;
	ret_type : dtype;
	in_loop : bool;
}

let rec string_of_coral_type t =
	match t with
    VoidType -> "void"
    | IntType -> "int"
    | StringType -> "string"
    | TableType -> "Table"
    | NoType -> ""
    | FloatType -> "float"
    | FileType -> "File"

let rec string_of_coral_op o =
	match o with
    Add -> "+"
    | Sub -> "-"
    | Mult -> "*"
    | Div -> "/"
    | Mod -> "%"
    | Equal -> "=="
    | Neq -> "!="
    | Less -> "<"
    | Leq -> "<="
    | Greater -> ">="
    | Geq -> ">"
    | And -> "&&"
    | Or -> "||"
    | Exp -> "**"

(* check types *)
exception Error of string

let check_type t1 t2 =
    if (not(t1 = t2)) then
        raise(Error("type mismatch between " ^ (string_of_coral_type t1) ^
         " and " ^ (string_of_coral_type t2)))
    else t1

(* find functions in symbol table *)
let rec function_exists fname scope =
	try
		let _ = List.find (fun func_def -> func_def.fname = fname) scope.functions in true
	with Not_found ->
		match scope.parent with
			Some(parent) -> function_exists fname parent
			| _ -> false

let rec find_function fname scope =
	try
		List.find (fun func_def -> func_def.fname = fname) scope.functions
	with Not_found ->
		match scope.parent with
			Some(parent) -> find_function fname parent
			| _ -> raise (Failure ("function " ^ fname ^ " not declared bro"))

(* find variables in symbol table *)
let rec variable_exists vname scope =
	try
		let _ = List.find (fun v_decl ->
					match v_decl with
					| VarDecl(t, v, e) -> v = vname) scope.variables in true
	with Not_found ->
		match scope.parent with
			Some(parent) -> variable_exists vname parent
			| _ -> false

let rec find_variable vname scope =
	try
		List.find (fun v_decl ->
				match v_decl with
				| VarDecl(t, v, e) -> v = vname) scope.variables
	with Not_found ->
		match scope.parent with
			Some(parent) -> find_variable vname parent
			| _ -> raise (Failure ("variable " ^ vname ^ " not declared bro"))

let rec variable_type vdec =
	match vdec with
	| VarDecl(t, v, e) -> t

(* find attributes in symbol table *)
let rec attr_exists aname scope =
	try
		let _ = List.find (fun a_decl ->
					match a_decl with
					| (t, n) -> n = aname) scope.table_attrs in true
	with Not_found ->
		match scope.parent with
		Some(parent) -> attr_exists aname parent
		| _ -> false

let rec find_attr aname scope =
	try
		List.find (fun a_decl ->
				match a_decl with
				| (t, n) -> n = aname) scope.table_attrs
	with Not_found ->
		match scope.parent with
		Some(parent) -> find_attr aname parent
		| _ -> raise (Error ("attribute " ^ aname ^ " not declared bro"))

(* find tables in symbol table *)
let rec get_table_name table =
	let t_label = table.tbname in
		match t_label with
		| TableLabel(l) -> l

let rec table_exists tname scope =
	try
		let _ = List.find (fun table -> (get_table_name table) = tname) scope.table_list in true
	with Not_found ->
		match scope.parent with
			Some(parent) -> table_exists tname parent
			| _ -> false

let rec find_table tname scope =
	try
		List.find (fun table -> (get_table_name table) = tname) scope.table_list
	with Not_found ->
		match scope.parent with
			Some(parent) -> find_table tname parent
			| _ -> raise (Failure ("table " ^ tname ^ " not declared bro"))

(* check db connection section *)
let rec check_conn_label co =
    match co with
    | ServerConn -> co
    | PortConn -> co
    | UserConn -> co
    | PassConn -> co
    | TypeConn -> co
    | DBConn -> co

let rec check_conn_attr ca  =
    match ca with
    | ConnAttr(cl, a) -> try
                            (check_conn_label cl)
                        with _ ->
                            raise(Error("ConnLabel Error"))

let rec check_conn_block cb =
    match cb with
    | ConnBlock(a1, a2, a3, a4, a5, a6) ->
        let _ = (check_conn_attr a1) in
        let _ = (check_conn_attr a2) in
        let _ = (check_conn_attr a3) in
        let _ = (check_conn_attr a4) in
        let _ = (check_conn_attr a5) in
        let _ = (check_conn_attr a6) in
        NoType
    | NoConnBlock -> NoType

let rec check_expr exp env =
    match exp with
    | IntLiteral(l) -> IntType
    | StringLiteral(l) -> StringType
    | FPLiteral(l) -> FloatType
	| Id(v) -> (variable_type (find_variable v env.scope))
	| Call(f, e) -> if (function_exists f env.scope) then
    					let f1 = (find_function f env.scope) in
    					let fmls = f1.formals in
    					if ((List.length fmls) != (List.length e)) then
    						raise (Error ("improper number of arguments to function " ^ f1.fname))
    					else
    						let _ = (List.map2 (fun x y -> check_actual x y env) fmls e) in
    							IntType
    				else
    					let _ = (find_function f env.scope) in
    						IntType
	(* TODO TableAttr(t, a) *)
	| Open(fp, rw) -> 	if (not (rw = "r" || rw = "w" || rw = "rw")) then
								raise (Error ("second argument to open must be \"r\", \"w\", or \"rw\""))
						else
							FileType
	| Close(e) ->	if ((variable_type (find_variable e env.scope)) == FileType) then
						NoType
					else
						raise (Error ("argument of fclose() must have type File"))
	| FPrint(fp, e) -> 	if ((variable_type (find_variable fp env.scope)) == FileType) then
							NoType
						else
							raise (Error ("first argument of fprintf() must have type File"))
	| FRead(fp) ->	if ((variable_type (find_variable fp env.scope)) == FileType) then
						StringType
					else
						raise (Error ("argument of fread() must have type File"))
	(*| AddTableCall(f1) ->	if ((variable_type (find_variable f1 env)))*)
	(* TODO GetTableCall(f1, e) *)
	(* TODO TablCall(f1, f2, e) *)
    | Print(e) -> NoType
    | Binop(a, op, b) -> (let t1 = (check_expr a env) in
                         (let t2 = (check_expr b env) in
                            if(t1=FloatType && t2=IntType) then
                            	t1
                            else
                            	if(t1=IntType && t2=FloatType) then
                            		t2
                            	else
                            		(check_type t1 t2)
                         ))
    | Unop(a, uop) -> let t = (variable_type (find_variable a env.scope)) in
    					if (t = IntType || t = FloatType) then
    						t
    					else
    						raise (Error ("improper operator used on variable " ^ a))
	| Notop(e) -> (check_expr e env)
	| Neg(e) -> (check_expr e env)
    | Assign(l, asgn, r) -> (let t1 = (variable_type (find_variable l env.scope)) in
    						 let t2 = (check_expr r env) in
    						 	if (t1 == FloatType && t2 == IntType) then
    						 		t1
    						 	else
    						 		(check_type t1 t2))
    | Parens(p) -> (check_expr p env)
    (* TODO Array(id, e) *)
    | Noexpr -> NoType

and check_actual formal actual env =
	match formal with
	| Formal(t, n) -> (check_type t (check_expr actual env))

let rec check_var_decl vdec env =
    match vdec with
    | VarDecl(t, v, Noexpr) -> t
    | VarDecl(t, v, e) -> 	let t2 = (check_expr e env) in
    						if (t == FloatType && t2 == IntType) then
    							t
    						else 
    							(check_type t (check_expr e env))

let rec sys_check_var_decl vdec env =
	match vdec with
	| VarDecl(t, v, e) -> if (variable_exists v env.scope) then
							raise (Error ("variable " ^ v ^ " already declared"))
						  else
						  	let _ = env.scope.variables <- vdec::env.scope.variables in
						  	(* no error so add to symbol table *)
						  	(check_var_decl vdec env)

let rec check_formal f env =
    match f with
    | Formal(t, n) ->	IntType
    (* Need the symbol table for this *)

let rec is_assign expr =
	match expr with
	| Assign(l, asgn, r) -> raise (Error ("cannot have assignment in loop condition"))
	| _ -> false

let rec check_stmt s env =
    match s with
    | Block(stmts) -> 	let _ = (List.map (fun x -> check_stmt x env) stmts) in NoType
    | Expr(expr) -> 	(check_expr expr env)
    | Return(expr) -> 	if (check_expr expr env) == env.ret_type then
    						env.ret_type
    					else
    						raise (Error ("invalid return type"))
    | If(e, s, Nostmt) -> 	if (not (is_assign e)) then
    							NoType
    						else
    							NoType
    | If(e, s1, s2) -> 	if (not (is_assign e)) then
    						NoType
    					else
    						NoType
    | While(expr, stmts) ->	if (not (is_assign expr)) then
    							NoType
    						else
    							NoType
    | For(expr1, expr2, expr3, stmts) -> 	if (not (is_assign expr2)) then
    											NoType
    										else
    											NoType
    | ConnectDB -> NoType
    | CloseDB -> NoType
    | Nostmt -> NoType

let rec get_return fdef stmts env =
	let r_type = fdef.return_type in
	if r_type != VoidType then
		try
			List.find (fun s ->
							match s with
							| Return(expr) -> ((check_expr expr env) = r_type)
							| _ -> false ) stmts
		with Not_found ->
			raise (Error ("function " ^ fdef.fname ^ " declared with return type of " ^
			(string_of_coral_type r_type) ^ " but has no return statement"))
	else
		try
			List.find (fun s ->
							match s with
							| Return(expr) -> raise (Error ("function " ^ fdef.fname ^ " should not have return statement"))
							| _ -> false) stmts
		with Not_found -> Nostmt

let rec check_fdef fdef env =
	let _ = (List.map (fun x -> check_formal x env) fdef.formals) in
		let _ = (List.map (fun x -> sys_check_var_decl x env) fdef.locals) in
			let _ = (List.map (fun x -> check_stmt x env) fdef.body) in
				let _ = (get_return fdef fdef.body env) in
					true

let rec sys_check_fdef fdef env =
	let f_name = fdef.fname in

	if (function_exists f_name env.scope) then
		raise (Error ("you already declared function " ^ f_name ^ " bro"))
	else
		let scope' = { parent = Some(env.scope);
					   variables = [];
					   functions = [];
					   table_list = [];
					   table_attrs = [] } in

		let env' = { env with scope = scope';
					 ret_type = fdef.return_type } in
		
		let _ = (check_fdef fdef env') in
		(* no error thrown, add function to symbol table *)
		let _ = env.scope.functions <- fdef::env.scope.functions in
			true

let rec attr_name a =
	match a with
	| AttrLabel(s) -> s

let rec check_attr attr env = 
	match attr with
	| Attr(l, t) -> let name = (attr_name l) in
					if (attr_exists name env.scope) then
						raise (Error ("redeclaration of attribute " ^ name))
					else
						let _ = env.scope.table_attrs <- (t, name)::env.scope.table_attrs in
							true

let rec check_key k_dec env =
	match k_dec with
	| PrimaryKey(label) -> 	let name = (attr_name label) in
							if (attr_exists name env.scope) then
								true
							else
								raise (Error ("primary key declared for non-existent attribute " ^ name))

let rec check_table_body tbody env =
	match tbody with
	| TableBody(ag, kd, fd) -> 	let _ = (List.map (fun x -> check_attr x env) ag) in
									let _ = (List.map (fun x -> check_key x env) kd) in
										true

let rec check_table table env =
	let t_name = (get_table_name table) in

	if (table_exists t_name env.scope) then
		raise (Error ("you already declared table " ^ t_name ^ " bro"))
	else
		let scope' = { parent = Some(env.scope);
					   variables = [];
					   functions = [];
					   table_list = [];
					   table_attrs = [] } in
		let env' = { env with scope = scope' } in

		let _ = (check_table_body table.tbbody env') in
		(* no error so add table to symbol table *)
		let _ = env.scope.table_list <- table::env.scope.table_list in
			true

let rec check_table_block tblock env =
	match tblock with
	| TableBlock(tables) -> let _ = (List.map (fun x -> check_table x env) tables) in
								true

let rec check_program (p:program) =

	let global_scope = {
		parent = None;
		variables = [];
		functions = [];
		table_list = [];
		table_attrs = []
	} in

	let global_env = {
		scope = global_scope;
		ret_type = NoType;
		in_loop = false
	} in

    let _ = (check_conn_block p.conn) in
    	let _ = check_table_block p.tables global_env in
    		let _ = (List.map (fun x -> sys_check_fdef x global_env) p.funcs) in
    			true
