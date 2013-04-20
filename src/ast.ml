(* Borrowed from Prof. Edwards' website *)

type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater
type dtype = VoidType

type expr =
    IntLiteral of int
    | StringLiteral of string
	| Id of string	(* Expressions *)
	| Call of string * expr list
    | Math of expr * expr
    | Print of expr

type formal =
    Formal of dtype * string

type stmt =
    Block of stmt list
	| Expr of expr


type func_def = {
        return_type : dtype;
		fname	: string;
		formals	: formal list;
		locals	: string list;
		body	: stmt list;
}

type program = func_def list