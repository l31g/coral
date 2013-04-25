(* Borrowed from Prof. Edwards' website *)

type op = Add | Sub | Mult | Div | Mod | Equal | Neq | Less | Leq | Greater | Geq
type dtype = VoidType | IntType | StringType | TableType




type expr =
    IntLiteral of int
    | StringLiteral of string
	| Id of string	(* Expressions *)
	| Call of string * expr list
    | Binop of expr * op * expr
    | Print of expr
    | Assign of string * expr

type var_decl =
    VarDecl of dtype * string * expr

type formal =
    Formal of dtype * string

type stmt =
    Block of stmt list
	| Expr of expr

type table_label =
    TableLabel of string

type table = {
    tbname : table_label list;
    tbbody : stmt list;
}

type func_def = {
        return_type : dtype;
		fname	: string;
		formals	: formal list;
		locals	: var_decl list;
		body	: stmt list;
}



type program = {
            tables : table list;
            funcs  : func_def list;
}



