%{ open Ast %}

%token PLUS MINUS TIMES MOD DIVIDE LPAREN RPAREN SEMI COLON ASSIGN
%token LBRACKET RBRACKET CARAT DOT COMMA GT LT GEQ LEQ NEQ OR AND
%token EQ ELSE WHILE INT IF FOR RETURN PRINT VOID BREAK CONTINUE SIZEOF
%token <int> INTLITERAL
%token <string> STRINGLITERAL
%token <string> ID
%token EOF

/*CORaL*/
%token CORDB, ENDDB, TABLE, SERVER, PORT, USER, PASS, TYPE, DBNAME
%token CORDBCONN, ENDDBCONN, FOREIGNKEY, PRIMARYKEY

%nonassoc ELSE
%right EQUAL
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE
%left ASSIGN

%start	program
%type <Ast.program> program

%%

program:
	CORDBCONN conn_block ENDDBCONN CORDB tables_list ENDDB fdef_list 	{ {
							conn = $2;
                            tables = List.rev $5;
							funcs = List.rev $7
		} }

fdef_list:
					 { [] }
	| fdef_list fdef { $2 :: $1 }


fdef:
	dtype ID LPAREN formals_opt RPAREN LBRACKET var_decl_list stmt_list RBRACKET
										{ {
											return_type = $1;
											fname	= $2;
											formals = $4;
											locals = List.rev $7 ;
											body	= List.rev $8	} }

stmt_list:
	/* Nothing */						{ [] }
	| stmt_list stmt 					{ $2 :: $1 }


stmt:
	expr SEMI							{ Expr ($1) }
	| LBRACKET stmt_list RBRACKET		{ Block(List.rev $2) }
	| IF LPAREN expr RPAREN stmt 		{ If($3, $5)}
	| FOR LPAREN expr_opt SEMI expr_opt SEMI expr_opt RPAREN stmt
										{ For($3, $5, $7, $9)}
	| WHILE LPAREN expr RPAREN			{ While($3, $5)}
	| RETURN expr 						{ Return($2)}

expr:
	  INTLITERAL					{ IntLiteral($1) }
	| STRINGLITERAL					{ StringLiteral($1) }
	| ID ASSIGN expr 				{ Assign($1, $3) }
	| expr PLUS expr 				{ Binop($1, Add, $3) }
	| expr MINUS expr 				{ Binop($1, Sub, $3) }
	| expr TIMES expr 				{ Binop($1, Mult, $3) }
	| expr DIVIDE expr 				{ Binop($1, Div, $3) }
	| expr MOD expr 				{ Binop($1, Mod, $3) }
	| expr EQ expr 					{ Binop($1, Equal, $3) }
	| expr NEQ expr 				{ Binop($1, Neq, $3) }
	| expr LT expr 					{ Binop($1, Less, $3) }
	| expr LEQ expr 				{ Binop($1, Leq, $3) }
	| expr GT expr 					{ Binop($1, Greater, $3) }
	| expr GEQ expr 				{ Binop($1, Geq, $3) }
	| expr OR expr 					{ Binop($1, Or, $3)}
	| expr AND expr 				{ Binop($1, And, $3)}
	| ID							{ Id($1) }
	| PRINT LPAREN expr RPAREN		{ Print($3) }
	| ID LPAREN actuals_opt RPAREN	{ Call ($1, $3) }

formals_opt:
					{ [] }
	| formal_list	{ List.rev $1 }

formal_list:
	 formal				{ [$1] }
	| formal_list COMMA formal { $3 :: $1 }

formal:
	dtype ID { Formal ($1, $2) }

actuals_opt:
					{ [] }
	| actuals_list 	{ List.rev $1 }

actuals_list:
	expr 			{ [] }
	| actuals_list COMMA expr { $3 :: $1 }

var_decl_list:
							 { [] }
	| var_decl_list var_decl { $2 :: $1 }

var_decl:
	dtype ID ASSIGN expr SEMI		{ VarDecl($1, $2, $4) }

dtype:
    VOID   { VoidType }
    | INT  { IntType }

/* CoRAL segment of grammar */

conn_label:
    SERVER      { ServerConn }
    | PORT      { PortConn }
    | USER      { UserConn }
    | PASS      { PassConn }
    | TYPE      { TypeConn }
    | DBNAME    { DBConn }

conn_attribute:
    conn_label ASSIGN STRINGLITERAL SEMI { ConnAttr($1, $3) }

conn_block:
    conn_attribute conn_attribute
    conn_attribute conn_attribute
    conn_attribute conn_attribute { ConnBlock($1, $2, $3, $4, $5, $6) }

attribute_label:
    ID      { AttrLabel($1) }

attribute:
    attribute_label COLON dtype SEMI { Attr($1, $3) }

attribute_group:
     attribute               { [$1] }
    | attribute_group COMMA attribute { $3 :: $1 }

key_decls_list:
								{ [] }
	| key_decls_list key_decls    { $2 :: $1 }

key_decls:
    PRIMARYKEY LPAREN attribute_label RPAREN SEMI { PrimaryKey($3) }
    | FOREIGNKEY LPAREN attribute_label RPAREN SEMI { ForeignKey($3) }

table_label:
	ID 		{ TableLabel($1) }
	| ID COLON ID { TableLabelRel($1, $3) }

table_label_list:
	table_label 	{ [$1] }
	| table_label_list COLON table_label { $3 :: $1 }

table_body:
    attribute_group key_decls_list fdef_list { TableBody($1,$2,$3) }

table:
	TABLE table_label_list LBRACKET table_body RBRACKET	SEMI { {
						tbname = $2;
						tbbody = $4
	} }

tables_list:
							  { [] }
	| tables_list table { $2 :: $1 }


