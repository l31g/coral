open Ast
open Printf

let tab lvl =
  String.make lvl '\t'

let rec str_of_type t =
    match t with
    | IntType -> "Integer"
    | StringType -> "String"
    | VoidType -> "Void"
    | TableType -> "Table"

let rec str_of_asgn a =
    match a with
    | Eql -> "="
    | Ple -> "+="
    | Mie -> "-="
    | Mue -> "*="
    | Dve -> "/="

let rec str_of_op o =
    match o with
    | Add -> "+"
    | Sub -> "-"
    | Mult -> "*"
    | Div -> "/"
    | Mod -> "%"
    | Exp -> "**"
    | Equal -> "=="
    | Neq -> "!="
    | Less -> "<"
    | Leq -> "<="
    | Greater -> ">"
    | Geq -> ">="
    | Or -> "or"
    | And -> "and"

let rec str_of_uop u =
    match u with
    | Incr -> "+1"
    | Decr -> "-1"

let rec str_of_conn_label co =
    match co with
    | ServerConn -> "setServer"
    | PortConn -> "setPort"
    | UserConn -> "setUser"
    | PassConn -> "setPass"
    | TypeConn -> "setConnType"
    | DBConn -> "setDBName"

let rec str_of_conn_attr ca =
    match ca with
    | ConnAttr(cl, a) -> (str_of_conn_label cl) ^ "(" ^ a ^ ")"

let rec str_of_conn_block cb =
    match cb with
    | ConnBlock(a1, a2, a3, a4, a5, a6) -> (str_of_conn_attr a1) ^
        "\n" ^ (str_of_conn_attr a2) ^ "\n" ^ (str_of_conn_attr a3)
        ^ "\n" ^ (str_of_conn_attr a4) ^ "\n" ^ (str_of_conn_attr a5)
        ^ "\n" ^ (str_of_conn_attr a6) ^ "\n"

let rec str_of_attr_label al =
    match al with
    | AttrLabel(l) -> l

let rec str_of_attr a =
    match a with
    | Attr(a, t) -> (str_of_attr_label a) ^ " = Column(" ^ (str_of_type t) ^ ")"

let rec str_of_attr_group ag lvl =
    (let l = "\n" ^ (tab (lvl+1)) in
        (String.concat l (List.map str_of_attr ag)))

let rec str_of_key k =
    match k with
    | PrimaryKey(al) -> "PrimaryKeyConstraint('" ^ (str_of_attr_label al) ^ "')"
    | ForeignKey(al) -> "ForeignKey('" ^ (str_of_attr_label al) ^ "')"


let rec str_of_expr exp =
    match exp with
    | IntLiteral(l) -> string_of_int(l)
    | StringLiteral(l) -> l
    | Id(s) -> s
    | Call(f, e) -> f ^ "(" ^ (String.concat "," (List.map str_of_expr e)) ^ ")"
    | TableCall(f1, f2, e) -> f1 ^ "." ^ f2 ^ "(" ^ (String.concat "," (List.map str_of_expr e)) ^ ")"  
    | Print(e) -> "print " ^ (String.concat "," (List.map str_of_expr e))
    | Binop(a, op, b) -> (str_of_expr a) ^ (str_of_op op) ^ (str_of_expr b)
    | Unop(a, uop) -> a ^ "=" ^ a ^ (str_of_uop uop)
    | Notop(e) -> "not " ^ (str_of_expr e)
    | Assign(l, asgn, r) -> l ^ (str_of_asgn asgn) ^ (str_of_expr r)
    | Noexpr -> ""

let rec str_of_var_decl v lvl =
    match v with
    | VarDecl(t, v, e) -> (tab lvl) ^ (str_of_expr (Assign(v, Eql, e)))

let rec str_of_formal f =
    match f with
    | Formal(t, n) -> "" ^ n

let rec str_of_stmt s lvl =
    match s with
    | Block(stmts) -> (let l = "\n" ^ (tab lvl) in
                        (String.concat l (List.map (fun x-> str_of_stmt x (lvl+1)) (stmts))))
    | Expr(expr) -> str_of_expr expr
    | Return(expr) -> "return " ^ (str_of_expr expr)
    | If(e, s, Nostmt) -> "if " ^ str_of_expr e ^ ":\n" ^ (tab (lvl+2)) ^ str_of_stmt s (lvl+2)
    | If(e, s1, s2) -> "if (" ^ str_of_expr e ^ "):\n" ^ (tab (lvl+2)) ^ str_of_stmt s1 (lvl+2) 
                    ^ "\n" ^ (tab (lvl+1)) ^ "else:\n" ^ (tab (lvl+2)) ^ str_of_stmt s2 (lvl+2)

    | While(expr, stmts) -> (let l = "\n" ^ (tab (lvl+2)) in
                        "while " ^ (str_of_expr expr) ^ ":" ^
                        l ^ (str_of_stmt stmts (lvl+3)) )
    | For(expr1, expr2, expr3, stmts) -> (let l = "\n" ^ (tab (lvl+2)) in
                        (str_of_expr expr1) ^ "\n" ^ (tab (lvl+1)) ^ "while " ^ (str_of_expr expr2) ^ ":" ^
                        l ^ (str_of_stmt stmts (lvl+2)) ^
                        "\n" ^ (tab (lvl+2)) ^ (str_of_expr expr3))
    | Nostmt -> ""

let rec str_of_table_label tl =
    match tl with
    | TableLabel(l) -> "" ^ l
    | TableLabelRel(l,r) -> "" ^ l ^ " : " ^ r

let str_of_fdef fdef lvl =
    (tab lvl) ^ "def " ^ fdef.fname ^ "(" ^
            (String.concat "," (List.map str_of_formal fdef.formals)) ^ "):\n"

    ^ (tab (lvl+1)) ^ (let l = "\n" ^ (tab (lvl+1)) in
                            (String.concat l (List.map (fun x-> str_of_var_decl x (lvl)) fdef.locals)))
                    ^ "\n"
    ^ (tab (lvl+1)) ^ (let l = "\n" ^ (tab (lvl+1)) in
                            (String.concat l (List.map (fun x-> str_of_stmt x (lvl)) fdef.body)))

let rec str_of_table_body tbb lvl =
    match tbb with
    | TableBody(ag, kd, fd) -> (tab (lvl)) ^ (str_of_attr_group ag (lvl+1)) ^ "\n" ^ (tab lvl) ^ "__table_args__= (" ^(String.concat ("\n"^(tab lvl)) (List.map str_of_key kd)) ^ ", {})\n" ^ (String.concat "\n" (List.map (fun x-> str_of_fdef x (lvl)) fd))

let rec str_of_table tb =
    "class " ^ (str_of_table_label tb.tbname) ^ "(Base):\n" ^
            (* cleanup these 1's later *)
    (tab 1) ^
                "__tablename__ = '" ^ "" ^ (str_of_table_label tb.tbname)^ "'" ^ "\n" ^
                (str_of_table_body tb.tbbody 1 ) ^
                (*Add this method for every object for easing adding into DB*)
                (tab 1) ^ "def add(self):\n" ^ (tab 2) ^ "session.add(self)"

let str_of_program program =
        "#!/usr/bin/env python\n" ^
        "import sys\nsys.path.append(\"../backend\")\n" ^
        "import controller, cor_global\nfrom controller import *\nfrom cor_global import *\n\n" ^
        (str_of_conn_block program.conn) ^ "\n\n" ^
        (String.concat "\n" (List.map str_of_table program.tables)) ^ "\n\n" ^
        (let l = "\n" in
        (String.concat l (List.map (fun x-> str_of_fdef x 0) program.funcs)) ^ "\n\nif __name__ == '__main__':\n\tmain()")

