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
			| _ -> raise (Failure ("Declare your function bro"))

(* check variables
let rec find_variable vname env =
	try
		List.find (fun var_decl -> vname = v) env.variables
	with Not_found ->
		match env.parent with
			Some(parent) -> find_variable v parent
			| _ -> raise (Failure ("Declare your variable bro"))
*)

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


let rec check_expr exp =
    match exp with
    | IntLiteral(l) -> IntType
    | StringLiteral(l) -> StringType
    | Binop(a, op, b) -> (let t1 = (check_expr a) in
                         (let t2 = (check_expr b) in
                            (check_type t1 t2)
                         ))

    | Assign(l, asgn, r) -> (check_expr r)


let rec check_var_decl v =
    match v with
    | VarDecl(t, v, e) ->   let t2 = (check_expr e) in
                                (check_type t t2)


let rec check_formal f =
    match f with
    | Formal(t, n) ->
                        (* Need the symbol table for this *)
                        if (not (t = IntType)) then
                            raise(Error("Formal Error"))
                        else
                            t

let rec check_stmt s =
    match s with
    | Block(stmts) -> let l = (List.map check_stmt stmts) in NoType
    | Expr(expr) -> (check_expr expr)
    | Nostmt -> NoType

let rec check_fdef fdef =
	(List.map check_formal fdef.formals), 
	(List.map check_var_decl fdef.locals), 
	(List.map check_stmt fdef.body)

let rec sys_check_fdef fdef env =
	let f_name = fdef.fname in

	if (function_exists f_name env) then
		raise (Error ("you already declared function " ^ f_name ^ " bro"))
	(* check rest of function def *)
	else 
		let _ = (check_fdef fdef) in
		(* no error thrown, add function to symbol table *)
		(env.functions <- fdef::env.functions)

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
