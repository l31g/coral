(* Borrowed from Prof. Edwards' webiste *)

type expr =
	Id of string	(* Expressions *)
	| Call of string * expr list

type stmt =
	Expr of expr

type func_def = {
		fname	: string;
		formals	: string list;
		locals	: string list;
		body	: stmt list;
}

type program = string list * funct_def list