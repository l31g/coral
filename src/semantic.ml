open Ast

(* make the symbol table *)
type symbol_table = {
	mutable vars : (t * string) list;
	mutable funcs : (t * string * (t list)) list;
	bool_scope : bool
}