(* Borrowed from Prof. Edwards' website *)

type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater
type dtype = VoidType

type expr =
    Literal of int
	| Id of string	(* Expressions *)
	| Call of string * expr list
    | Noexpr

type stmt =
    Block of stmt list
	| Expr of expr
    | Nostmt

type func_def = {
		fname	: string;
		formals	: string list;
		locals	: string list;
		body	: stmt list;
}

type program = func_def list