open Ast
open Printf

let tab lvl =
  String.make lvl '\t'

let rec str_of_expr = function
    | Literal(l) -> string_of_int(l)
    | Id(s) -> s
    | Call(f, e) -> f ^ "(" ^ (String.concat ", " (List.map str_of_expr e)) ^ ")"


let rec str_of_stmt s =
    match s with
    | Block(stmts) -> (let l = "\n" ^ "\t" in
                        (String.concat l (List.map str_of_stmt (List.rev(stmts)))))
    | Expr(expr) -> str_of_expr expr

let str_of_fdef fdef =
    "def " ^ fdef.fname ^ "():\n"
    ^ "\t" ^ (String.concat "\t" (List.map str_of_stmt fdef.body))

let str_of_program program = (String.concat "\n" (List.map str_of_fdef program))
