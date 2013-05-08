open Ast
open Printf

let tab lvl =
  String.make lvl '\t'

let rec str_of_op o =
    match o with
    | Add -> "+"
    | Sub -> "-"
    | Mult -> "*"
    | Div -> "/"
    | Mod -> "%"
    | Equal -> "=="
    | Neq -> "!="
    | Less -> "<"
    | Leq -> "<="
    | Greater -> ">"
    | Geq -> ">="




let rec str_of_expr = function
    | IntLiteral(l) -> string_of_int(l)
    | StringLiteral(l) -> l
    | Id(s) -> s
    | Call(f, e) -> f ^ "(" ^ (String.concat "," (List.map str_of_expr e)) ^ ")"
    | Print(e) -> "print " ^ (str_of_expr e)
    | Binop(a, op, b) -> (str_of_expr a) ^ (str_of_op op) ^ (str_of_expr b)
    | Assign(l, r) -> l ^ " = " ^ (str_of_expr r)

let rec str_of_var_decl v lvl =
    match v with
    | VarDecl(t, v, e) -> (tab lvl) ^ (str_of_expr (Assign(v, e)))

let rec str_of_formal f =
    match f with
    | Formal(t, n) -> "" ^ n

let rec str_of_stmt s lvl =
    match s with
    | Block(stmts) -> (let l = "\n" ^ (tab lvl) in
                        (String.concat l (List.map (fun x-> str_of_stmt x (lvl+1)) (List.rev(stmts)))))
    | Expr(expr) -> str_of_expr expr

let rec str_of_table_label tl =
    match tl with
    | TableLabel(l) -> "" ^ l

let rec str_of_table tb =
    "class " ^ (String.concat " : " (List.map str_of_table_label tb.tbname)) ^ "(Base):\n" ^
            (* cleanup these 1's later *)
    (tab 1) ^   (let l = "\n" ^ (tab 1) in
                (String.concat l (List.map (fun x-> str_of_stmt x (1)) (List.rev(tb.tbbody)))))

let str_of_fdef fdef lvl =
    (tab lvl) ^ "def " ^ fdef.fname ^ "(" ^
            (String.concat "," (List.map str_of_formal fdef.formals)) ^ "):\n"

    ^ (tab (lvl+1)) ^ (let l = "\n" ^ (tab (lvl+1)) in
                            (String.concat l (List.map (fun x-> str_of_var_decl x (lvl)) fdef.locals)))
                    ^ "\n"
    ^ (tab (lvl+1)) ^ (let l = "\n" ^ (tab (lvl+1)) in
                            (String.concat l (List.map (fun x-> str_of_stmt x (lvl)) fdef.body)))

let str_of_program program =
        "#!/usr/bin/env python\n" ^
        (*"import backend\n\n" ^ 
        commenting out for now until we have actual import backend functionality *)

        (String.concat "\n" (List.map str_of_table program.tables)) ^ "\n\n" ^
        (let l = "\n" in
        (String.concat l (List.map (fun x-> str_of_fdef x 0) program.funcs)) ^ "\n\nif __name__ == '__main__':\n\tmain()")

