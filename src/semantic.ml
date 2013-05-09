open Ast

(* make the symbol table *)


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
