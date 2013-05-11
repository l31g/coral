type op = (* Binary operators *)
    Add
    | Sub
    | Mult 
    | Div 
    | Mod 
    | Equal 
    | Neq 
    | Less 
    | Leq 
    | Greater 
    | Geq
    | And 
    | Or 
    | Exp

type uop = (* ++ and -- operators *)
    Incr
    | Decr

type asignmt = (* =, +=, -=, *=, /= *)
    Eql
    | Ple
    | Mie
    | Mue
    | Dve

type dtype =
    VoidType
    | IntType
    | StringType
    | TableType
    | NoType
    | FloatType
    | FileType

type conn_label = 
    ServerConn
    | PortConn
    | UserConn
    | PassConn
    | TypeConn
    | DBConn

type conn_attribute =
    ConnAttr of conn_label * string

type conn_block =
    ConnBlock of conn_attribute * conn_attribute * conn_attribute * conn_attribute * conn_attribute * conn_attribute
    | NoConnBlock

type attr_label =
    AttrLabel of string

type attribute =
    Attr of attr_label * dtype

type key_decls =
    PrimaryKey of attr_label
    | ForeignKey of attr_label

type table_label =
    TableLabel of string

type expr =
    IntLiteral of int
    | StringLiteral of string
    | FPLiteral of float
	| Id of string
	| Call of string * expr list
    | Binop of expr * op * expr
    | Unop of string * uop
    | Neg of expr
    | Notop of expr
    | Print of expr list
    | FPrint of string * expr list
    | FRead of string
    | Assign of string * asignmt * expr
    | Open of string * string
    | Close of string
    | AddTableCall of string
    | GetTableCall of string * expr list
    | TableCall of string * string * expr list
    | TableAttr of string * string
    | Parens of expr
    | Array of string * expr
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
    | CloseDB
    | ConnectDB
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

type table_block =
    TableBlock of table list
    | NoTableBlock

type program = {
            conn : conn_block;
            tables : table_block;
            globals : var_decl list;
            funcs  : func_def list;
}



