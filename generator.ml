open Ast
open Printf

let tab lvl =
  String.make lvl '\t'

let rec str_of_expr = function
    | Literal(l) -> string_of_int(l)
    | Id(s) -> s
    | Call(f, e) -> f ^ "(" ^ (String.concat ", " (List.map str_of_expr e)) ^ ")"

let rec str_of_stmt s lvl =
    match s with
    | Block(stmts) -> (let l = "\n"^(tab lvl) in
                        (String.concat l (List.map (fun x-> str_of_stmt x (lvl+1)) (List.rev(stmts)))))
    | Expr(expr) -> str_of_expr expr

let str_of_program prog =
    str_of_stmt prog