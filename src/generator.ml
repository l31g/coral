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
    | FloatType -> "Float"
    | FileType -> "File" (* should never come up in SQL query *)
    | NoType -> "" (* should never actually happen *)
    | UserType -> ""

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
    | NoConnBlock -> ""

let rec str_of_attr_label al =
    match al with
    | AttrLabel(l) -> l

let rec str_of_attr a =
    match a with
    | Attr(a, t) -> (str_of_attr_label a) ^ " = Column(" ^ (str_of_type t) ^ ")"

let rec str_of_attr_group ag lvl =
    (let l = "\n" ^ (tab (lvl)) in
        (String.concat l (List.map str_of_attr ag)))

let rec str_of_key k =
    match k with
    | PrimaryKey(al) -> "PrimaryKeyConstraint('" ^ (str_of_attr_label al) ^ "')"
    | ForeignKey(al) -> "ForeignKey('" ^ (str_of_attr_label al) ^ "')"

let rec str_of_query_filter q =
    match q with
    (* Get rid of quotes in a string *)
    | StringLiteral(l) -> let len = (String.length l) in
                            (String.sub l 1 (len-2) )
    | IntLiteral(l) -> string_of_int(l)
    | FPLiteral(l) -> string_of_float(l)
    | Id(s) -> s
    | Binop(a, op, b) -> (str_of_query_filter a) ^ (str_of_op op) ^ ":" ^ (str_of_query_filter a)
    | Assign(l, asgn, r) -> l ^ "=" ^ ":" ^ l

    | Call(s, expr) -> "" (* should not ever be called in this context *)
    | Unop(s, uop) -> s ^ "=" ^ s ^ (str_of_uop uop)
    | Neg(expr) -> "-" ^ (str_of_query_filter expr)
    | Pos(expr) -> "+" ^ (str_of_query_filter expr)
    | Notop(expr) -> "" (* the following few will never happen for the context of query filter*)
    | Print(expr) -> ""  (* and just need definitions to eliminate compiler warnings *)
    | FPrint(s, expr) -> ""
    | FRead(s) -> ""
    | Open(s, p) -> ""
    | Close(s) -> ""
    | AddTableCall(s) -> ""
    | GetTableCall(s, expr) -> ""
    | TableCall(s, p, expr) -> ""
    | TableAttr(s, p) -> ""
    | Parens(expr) -> ""
    | Array(s, expr) -> ""
    | SizeOf(e) -> ""
    | Noexpr -> ""

let rec str_of_query_params q =
    match q with
    | StringLiteral(l) -> l
    | IntLiteral(l) -> string_of_int(l)
    | FPLiteral(l) -> string_of_float(l)
    | Id(s) -> s
    | Binop(a, op, b) -> (str_of_query_params a) ^ "=" ^ (str_of_query_params b)

    | Assign(l, asgn, r) -> l ^ "=" ^ (str_of_query_params r)
    | Call(s, expr) -> "" (* should not ever be called in this context *)
    | Unop(s, uop) -> s ^ "=" ^ s ^ (str_of_uop uop)
    | Neg(expr) -> "-" ^ (str_of_query_params expr)
    | Pos(expr) -> "+" ^ (str_of_query_params expr)
    | Notop(expr) -> "" (* the following few will never happen for the context of query filter*)
    | Print(expr) -> ""  (* and just need definitions to eliminate compiler warnings *)
    | FPrint(s, expr) -> ""
    | FRead(s) -> ""
    | Open(s, p) -> ""
    | Close(s) -> ""
    | SizeOf(e) -> ""
    | AddTableCall(s) -> ""
    | GetTableCall(s, expr) -> ""
    | TableCall(s, p, expr) -> ""
    | TableAttr(s, p) -> ""
    | Parens(expr) -> ""
    | Array(s, expr) -> ""
    | Noexpr -> ""

let rec str_of_expr exp =
    match exp with
    | IntLiteral(l) -> string_of_int(l)
    | StringLiteral(l) -> l
    | FPLiteral(l) -> string_of_float(l)
    | Id(s) -> s
    | Call(f, e) -> f ^ "(" ^ (String.concat "," (List.map str_of_expr e)) ^ ")"
    | TableAttr(t, a) -> t ^ "." ^ a
    | Open(fp, rw) -> "open(" ^ fp ^ ", " ^ rw ^ ")"
    | Close(e) -> e ^ ".close()"
    | FPrint(fp, e) -> fp ^ ".write(" ^ (String.concat "," (List.map str_of_expr e)) ^ ")"
    | FRead(fp) -> fp ^ ".readline()"
    | SizeOf(e) -> "sizeof("^ (str_of_expr e) ^ ")"
    | AddTableCall(f1) -> "controller.session.add(" ^ f1 ^ ")"
    | GetTableCall(f1, e) -> "controller.session.query(" ^ f1 ^ ").filter(\"" ^ (String.concat " and " (List.map str_of_query_filter e)) ^ "\").params(" ^ (String.concat " , " (List.map str_of_query_params e)) ^ ")"
    | TableCall(f1, f2, e) -> f1 ^ "." ^ f2 ^ "(" ^ (String.concat "," (List.map str_of_expr e)) ^ ")"
    | Print(e) -> "print(" ^ (String.concat "," (List.map str_of_expr e)) ^ ", end='')"
    | Binop(a, op, b) -> (str_of_expr a) ^ (str_of_op op) ^ (str_of_expr b)
    | Unop(a, uop) -> a ^ "=" ^ a ^ (str_of_uop uop)
    | Notop(e) -> "not " ^ (str_of_expr e)
    | Neg(e) -> "-" ^ (str_of_expr e)
    | Pos(e) -> "+" ^ (str_of_expr e)
    | Assign(l, asgn, r) -> l ^ (str_of_asgn asgn) ^ (str_of_expr r)
    | Parens(p) -> "(" ^ (str_of_expr p) ^ ")"
    | Array(id, e) -> id ^ "[" ^ (str_of_expr e) ^ "]"
    | Noexpr -> ""

let rec str_of_var_decl vdec lvl =
    match vdec with
    | VarDecl(t, v, Noexpr) -> (tab lvl) ^ v ^ "= None"
    | VarDecl(t, v, e) -> (tab lvl) ^ (str_of_expr (Assign(v, Eql, e)))
    | UDecl(ut, tn, v, Noexpr) -> (tab lvl) ^ v ^ "= None"
    | UDecl(ut, tn, v, e) -> (tab lvl) ^ (str_of_expr (Assign(v, Eql, e)))

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
                        l ^ (str_of_stmt stmts (lvl+2)) )
    | For(expr1, expr2, expr3, stmts) -> (let l = "\n" ^ (tab (lvl+2)) in
                        (str_of_expr expr1) ^ "\n" ^ (tab (lvl+1)) ^ "while " ^ (str_of_expr expr2) ^ ":" ^
                        l ^ (str_of_stmt stmts (lvl+2)) ^
                        "\n" ^ (tab (lvl+2)) ^ (str_of_expr expr3))
    | ConnectDB -> "controller.Base.metadata.create_all(controller.engine)"
    | CloseDB -> "controller.session.commit()"
    | Nostmt -> ""

let rec str_of_table_label tl =
    match tl with
    | TableLabel(l) -> "" ^ l

let str_of_fdef fdef globals lvl =
    (tab lvl) ^ "def " ^ fdef.fname ^ "(" ^
            (String.concat "," (List.map str_of_formal fdef.formals)) ^ "):\n"

    ^ (tab (lvl+1)) ^ (let l = "\n" ^ (tab (lvl+1)) in
                    (String.concat l
                        (List.map
                            (fun x-> "global " ^ (str_of_var_decl x (lvl)))
                        globals)))
                    ^ "\n"

    ^ (tab (lvl+1)) ^ (let l = "\n" ^ (tab (lvl+1)) in
                            (String.concat l (List.map (fun x-> str_of_var_decl x (lvl)) fdef.locals)))
                    ^ "\n"

    ^ (tab (lvl+1)) ^ (let l = "\n" ^ (tab (lvl+1)) in
                            (let ll = (String.concat l (List.map (fun x-> str_of_stmt x (lvl)) fdef.body)) in
                                match ll with
                                | "" -> "return"
                                | _ -> ll))

let rec str_of_table_body tbb lvl =
    match tbb with
    | TableBody(ag, kd, fd) -> (str_of_attr_group ag (lvl)) ^ "\n" ^ (tab lvl) ^ "__table_args__= ("
            ^(String.concat ("\n"^(tab lvl)) (List.map str_of_key kd)) ^ ", {})\n"
            ^ (String.concat "\n" (List.map (fun x-> str_of_fdef x [] (lvl)) fd))

let rec str_of_table tb =
    "class " ^ (str_of_table_label tb.tbname) ^ "(Base):\n" ^
            (* cleanup these 1's later *)
    (tab 1) ^
                "__tablename__ = '" ^ "" ^ (str_of_table_label tb.tbname)^ "'" ^ "\n" ^ (tab 1) ^
                (str_of_table_body tb.tbbody 1 )

let rec str_of_table_block tb =
    match tb with
    | TableBlock(tables) -> (String.concat "\n" (List.map str_of_table tables))
    | NoTableBlock -> ""

let str_of_program program =
        "#!/usr/bin/env python\n" ^
        "from __future__ import print_function\n" ^
        "import coral_backend\n" ^
        "from coral_backend import *\n" ^
        "from coral_backend.controller import *" ^
        "\n\n" ^
        (let l = (str_of_conn_block program.conn) in
        match l with
        | "" -> "conn_block = False\n\n"
        | _ -> l ^ "conn_block = True\n\n" )
        ^ "\n\n" ^
         (str_of_table_block program.tables) ^ "\n\n"

         ^ (let l = "\n" in
        (String.concat l (List.map (fun x-> str_of_var_decl x 0) program.globals)) ^ "\n")

        ^ (let l = "\n" in
                (String.concat l
                    (List.map (fun x-> str_of_fdef x program.globals 0) program.funcs))
                    ^ "\n\nif __name__ == '__main__':\n\tif (conn_block):\n\t\tconnectDB()\n\tmain()"
            )

