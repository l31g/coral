open Ast

(* make the symbol table *)
type symbol_table = {
	parent : symbol_table option;
	mutable variables : var_decl list;
	mutable functions : func_def list;
	mutable table_list : table list;
	in_loop : bool;
}

(* check types *)
exception Error of string

let check_type t1 t2 =
    if (not(t1 = t2)) then
        raise(Error("Type Mismatch Exception"))
    else t1

(* find functions in symbol table *)
let rec function_exists fname env =
	try
		let _ = List.find (fun func_def -> func_def.fname = fname) env.functions in true
	with Not_found ->
		match env.parent with
			Some(parent) -> function_exists fname parent
			| _ -> false

let rec find_function fname env =
	try
		List.find (fun func_def -> func_def.fname = fname) env.functions
	with Not_found ->
		match env.parent with
			Some(parent) -> find_function fname parent
			| _ -> raise (Failure ("Function " ^ fname ^ " not declared bro"))

(* find variables in symbol table *)
let rec variable_exists vname env =
	try
		let _ = List.find (fun v_decl ->
					match v_decl with
					| VarDecl(t, v, e) -> v = vname) env.variables in true
	with Not_found ->
		match env.parent with
			Some(parent) -> variable_exists vname parent
			| _ -> false

let rec find_variable vname env =
	try
		List.find (fun v_decl -> 
				match v_decl with
				| VarDecl(t, v, e) -> v = vname) env.variables
	with Not_found ->
		match env.parent with
			Some(parent) -> find_variable vname parent
			| _ -> raise (Failure ("Variable " ^ vname ^ " not declared bro"))

let rec variable_type vdec env =
	match vdec with
	| VarDecl(t, v, e) -> t

(* find tables in symbol table *)
let rec table_exists tname env =
	try
		let _ = List.find (fun table -> table.tbname = tname) env.table_list in true
	with Not_found ->
		match env.parent with
			Some(parent) -> table_exists tname parent
			| _ -> false

let rec find_table tname env =
	try
		List.find (fun table -> table.tbname = tname) env.table_list
	with Not_found ->
		match env.parent with
			Some(parent) -> find_table tname parent
			| _ -> raise (Failure ("Declare your table bro"))

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
        (check_conn_attr a1), (check_conn_attr a2), (check_conn_attr a3),
        (check_conn_attr a4), (check_conn_attr a5), (check_conn_attr a6)

(* check table declarations *)

let rec check_expr exp env =
    match exp with
    | IntLiteral(l) -> IntType
    | StringLiteral(l) -> StringType
    | FPLiteral(l) -> FloatType
	| Id(v) -> (variable_type (find_variable v env) env)
	| Call(f, e) -> if (function_exists f env) then
    					let f1 = (find_function f env) in
    					let fmls = f1.formals in
    					let _ = (List.map2 (fun x y -> check_actual x y env) fmls e) in
    						IntType
    				else
    					let err = (find_function f env) in
    						IntType
	(* TODO TablCall() *)
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
    | Unop(a, uop) -> let t = (variable_type (find_variable a env) env) in
    					if (t = IntType || t = FloatType) then
    						t
    					else
    						raise (Error ("improper operator used on variable " ^ a))
	| Notop(e) -> (check_expr e env)
	| Neg(e) -> (check_expr e env)
    | Assign(l, asgn, r) -> (let t1 = (variable_type (find_variable l env) env) in
    						 let t2 = (check_expr r env) in
    						 	(check_type t1 t2))
    | Parens(p) -> (check_expr p env)
    | Noexpr -> NoType

and check_actual formal actual env =
	match formal with
	| Formal(t, n) -> (check_type t (check_expr actual env))

let rec check_var_decl vdec env =
    match vdec with
    | VarDecl(t, v, Noexpr) -> t
    | VarDecl(t, v, e) -> (check_type t (check_expr e env))

let rec sys_check_var_decl vdec env =
	match vdec with
	| VarDecl(t, v, e) -> if (variable_exists v env) then
							raise (Error ("variable " ^ v ^ " already declared"))
						  else
						  	let _ = (env.variables <- vdec::env.variables) in
						  	(* no error so add to symbol table *)
						  		(check_var_decl vdec env)

let rec check_formal f env =
    match f with
    | Formal(t, n) ->	
                        (* Need the symbol table for this *)
                        if (not (t = IntType)) then
                            raise(Error("Formal Error"))
                        else
                            t

let rec check_stmt s env =
    match s with
    | Block(stmts) -> let l = (List.map (fun x -> check_stmt x env) stmts) in NoType
    | Expr(expr) -> (check_expr expr env)
    | Return(expr) -> (check_expr expr env)
    | If(e, s, Nostmt) -> NoType
    | If(e, s1, s2) -> NoType
    | While(expr, stmts) -> NoType
    | For(expr1, expr2, expr3, stmts) -> NoType
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
			raise (Error ("function " ^ fdef.fname ^ " does not return type of correct value"))
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

	if (function_exists f_name env) then
		raise (Error ("you already declared function " ^ f_name ^ " bro"))
	(* check rest of function def *)
	else 
		let _ = (check_fdef fdef env) in
		(* no error thrown, add function to symbol table *)
			env.functions <- fdef::env.functions

let rec check_program (p:program) =

	let global_env = {
		parent = None;
		variables = [];
		functions = [];
		table_list = [];
		in_loop = false;
	} in

    let _ = (check_conn_block p.conn) in
    	let _ = (List.map (fun x -> sys_check_fdef x (global_env)) p.funcs) in
    		true
