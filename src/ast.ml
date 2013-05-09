type op = Add | Sub | Mult | Div | Mod | Equal | Neq | Less | Leq | Greater | Geq
        | And | Or | Exp

type uop = Incr | Decr

type asignmt = Eql | Ple | Mie | Mue | Dve

type dtype = VoidType | IntType | StringType | TableType


type conn_label = ServerConn | PortConn | UserConn | PassConn | TypeConn | DBConn

type conn_attribute =
    ConnAttr of conn_label * string

type conn_block =
    ConnBlock of conn_attribute * conn_attribute * conn_attribute * conn_attribute * conn_attribute * conn_attribute

type attr_label =
    AttrLabel of string

type attribute =
    Attr of attr_label * dtype

type key_decls =
    PrimaryKey of attr_label
    | ForeignKey of attr_label

type table_label =
    TableLabel of string
    | TableLabelRel of string * string


type expr =
    IntLiteral of int
    | StringLiteral of string
	| Id of string
	| Call of string * expr list
    | Binop of expr * op * expr
    | Unop of string * uop
    | Notop of expr
    | Print of expr list
    | Assign of string * asignmt * expr
    | Noexpr

type var_decl =
    VarDecl of dtype * string * expr

type formal =
    Formal of dtype * string

type stmt =
    Block of stmt list
	| Expr of expr
    | Return of expr
    | If of expr * stmt * stmt
    | For of expr * expr * expr * stmt
    | While of expr * stmt
    | Nostmt


type func_def = {
        return_type : dtype;
		fname	: string;
		formals	: formal list;
		locals	: var_decl list;
		body	: stmt list;
}


type table_body =
    TableBody of attribute list * key_decls list * func_def list

type table = {
    tbname : table_label;
    tbbody : table_body;
}

type program = {
            conn : conn_block;
            tables : table list;
            funcs  : func_def list;
}



