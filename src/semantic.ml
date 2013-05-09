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

let rec check_conn_attr ca  =
    match ca with
    | ConnAttr(cl, a) -> try
                            (check_conn_label cl)
                        with _ ->
                            raise (Failure ("You crazy bro"))

let rec check_conn_block cb =
    match cb with
    | ConnBlock(a1, a2, a3, a4, a5, a6) -> (check_conn_attr a1)


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
