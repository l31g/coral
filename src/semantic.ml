open Ast

(* make the symbol table *)
type symbol_table = {
	parent : symbol_table option;
	variables : var_decl list;
	functions : func_def list;
	tables : table_label list;
	in_loop : bool;
}

(* check types *)

(* check operators *)

(* check functions *)

(* check variables *)
let rec check_variable v env =
	try
		List.find (fun var_decl.(_, vname, _) -> vname = v) env.variables
	with Not_found ->
		match env.parent with
			Some(parent) -> check_variable v parent
			| _ -> raise (Failure ("Declare your variable bro"))

(* check tables *)

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


let rec check_program program =
        (check_conn_block program.conn)
