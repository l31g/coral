open Ast

(* make the symbol table *)
type symbol_table = {
	parent : symbol_table option;
	variables : var_decl list;
	functions : func_def list;
	table_list : table list;
	in_loop : bool;
}

(* check types *)
exception Error of string

let check_type t1 t2 =
    if (not(t1 = t2)) then
        raise(Error("Type Mismatch Exception"))
    else t1

(* check operators *)

(* check functions *)

(* check variables
let rec check_variable v env =
	try
		List.find (fun var_decl.VarDecl[1] -> vname = v) env.variables
	with Not_found ->
		match env.parent with
			Some(parent) -> check_variable v parent
			| _ -> raise (Failure ("Declare your variable bro"))
*)

(* check tables *)
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
        (check_conn_attr a1), (check_conn_attr a2), (check_conn_attr a3), (check_conn_attr a4), (check_conn_attr a5), (check_conn_attr a6)

let rec check_expr exp =
    match exp with
    | IntLiteral(l) -> IntType
    | StringLiteral(l) -> StringType
    | FPLiteral(l) -> FloatType
    | Binop(a, op, b) -> (let t1 = (check_expr a) in
                         (let t2 = (check_expr b) in
                            (check_type t1 t2)
                         ))

    | Assign(l, asgn, r) -> (check_expr r)


let rec check_var_decl v =
    match v with
    | VarDecl(t, v, e) ->   if(not (t=FloatType)) then
    							(let t2 = (check_expr e) in
                                	(check_type t t2))
    						else
    							if(IntType = (check_expr e)) then
    								t
    							else 
    								(check_type t (check_expr e))


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
        (List.map check_formal fdef.formals) , (List.map check_var_decl fdef.locals), (List.map check_stmt fdef.body)
(*
let rec check_program (p:program) =

	let global_env = {
		parent = None;
		variables = [];
		functions = [];
		table_list = [];
		in_loop = false;
	} in

    let _ = check_conn_block p.conn in
    	true
*)
let rec check_program program =
        (check_conn_block program.conn), (List.map check_fdef program.funcs)
