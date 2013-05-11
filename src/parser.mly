%{ open Ast %}

%token PLUS MINUS TIMES MOD DIVIDE LPAREN RPAREN SEMI COLON ASSIGN
%token LBRACKET RBRACKET CARAT DOT COMMA GT LT GEQ LEQ NEQ OR AND NOT
%token EXP INCR DECR PLEQ MIEQ MUEQ DVEQ
%token EQ WHILE INT FOR RETURN PRINT VOID BREAK CONTINUE
%token IF ELSE
%token STRING
%token NEWLINE
%token FLOAT ADD GET CONNECT LSQUARE RSQUARE CLOSE
%token <int> INTLITERAL
%token <string> STRINGLITERAL
%token <float> FPLITERAL
%token <string> ID
%token EOF

/*CORaL*/
%token CORDB, ENDDB, TABLE, SERVER, PORT, USER, PASS, TYPE, DBNAME
%token CORDBCONN, ENDDBCONN, FOREIGNKEY, PRIMARYKEY

%nonassoc NOELSE
%nonassoc ELSE
%right EQUAL NOT
%left DOT
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE MOD EXP
%left ASSIGN PLEQ MIEQ MUEQ DVEQ
%left DECR INCR
%left AND OR

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
	| CONNECT SEMI                      { ConnectCall }
    | CLOSE SEMI                        { CloseCall }
    | LBRACKET stmt_list RBRACKET		{ Block(List.rev $2) }
	| RETURN expr SEMI 					{ Return($2) }
	| IF LPAREN expr RPAREN stmt %prec NOELSE		{ If($3, $5, Nostmt)}
	| IF LPAREN expr RPAREN stmt ELSE stmt 			{ If($3, $5, $7) }
	| WHILE LPAREN expr RPAREN stmt 				{ While($3, $5) }
	| FOR LPAREN expr_opt SEMI expr_opt SEMI expr_opt RPAREN stmt
													{ For($3, $5, $7, $9)}

expr:
	  INTLITERAL					{ IntLiteral($1) }
	| STRINGLITERAL					{ StringLiteral($1) }
	| FPLITERAL						{ FPLiteral($1) }
	| ID ASSIGN expr 				{ Assign($1, Eql, $3) }
	| ID PLEQ expr 					{ Assign($1, Ple, $3) }
	| ID MIEQ expr 					{ Assign($1, Mie, $3) }
	| ID MUEQ expr 					{ Assign($1, Mue, $3) }
	| ID DVEQ expr 					{ Assign($1, Dve, $3) }
	| expr PLUS expr 				{ Binop($1, Add, $3) }
	| expr MINUS expr 				{ Binop($1, Sub, $3) }
	| expr TIMES expr 				{ Binop($1, Mult, $3) }
	| expr DIVIDE expr 				{ Binop($1, Div, $3) }
	| expr MOD expr 				{ Binop($1, Mod, $3) }
	| expr EXP expr 				{ Binop($1, Exp, $3) }
	| expr EQ expr 					{ Binop($1, Equal, $3) }
	| expr NEQ expr 				{ Binop($1, Neq, $3) }
	| expr LT expr 					{ Binop($1, Less, $3) }
	| expr LEQ expr 				{ Binop($1, Leq, $3) }
	| expr GT expr 					{ Binop($1, Greater, $3) }
	| expr GEQ expr 				{ Binop($1, Geq, $3) }
	| expr OR expr 					{ Binop($1, Or, $3)}
	| expr AND expr 				{ Binop($1, And, $3)}
	| ID							{ Id($1) }
	| NOT expr 						{ Notop($2) }
	| ID INCR 						{ Unop($1, Incr) }
	| ID DECR 						{ Unop($1, Decr) }
	| MINUS expr 						{ Neg($2)}
	| PRINT LPAREN actuals_opt RPAREN		{ Print($3) }
	| ID LPAREN actuals_opt RPAREN	{ Call($1, $3) }
    | ID LSQUARE expr RSQUARE     { Array($1, $3) }
    | ID DOT ADD LPAREN RPAREN { AddTableCall($1) }
    | ID DOT GET LPAREN actuals_opt RPAREN  { GetTableCall($1, $5) }
	| ID DOT ID LPAREN actuals_opt RPAREN { TableCall($1, $3, $5) }
	| ID DOT ID SEMI				{ TableAttr($1, $3) }
	| LPAREN expr RPAREN			{ Parens($2) }

expr_opt:
					{ Noexpr }
	| expr 			{ $1 }

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
	expr 			{ [$1] }
	| actuals_list COMMA expr { $3 :: $1 }

var_decl_list:
							 { [] }
	| var_decl_list var_decl { $2 :: $1 }

var_decl:
	dtype ID ASSIGN expr SEMI		{ VarDecl($1, $2, $4) }

dtype:
    VOID   { VoidType }
    | INT  { IntType }
    | STRING { StringType }
    | TABLE { TableType }
    | FLOAT { FloatType }

/* CORaL segment of grammar */

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
    | attribute_group attribute { $2 :: $1 }

key_decls_list:
								{ [] }
	| key_decls_list key_decls    { $2 :: $1 }

key_decls:
    PRIMARYKEY LPAREN attribute_label RPAREN SEMI { PrimaryKey($3) }
    | FOREIGNKEY LPAREN attribute_label RPAREN SEMI { ForeignKey($3) }

table_label:
	ID 		{ TableLabel($1) }
	| ID COLON ID { TableLabelRel($1, $3) }

table_body:
    attribute_group key_decls_list fdef_list { TableBody($1,$2,$3) }

table:
	TABLE table_label LBRACKET table_body RBRACKET	SEMI { {
						tbname = $2;
						tbbody = $4
	} }

tables_list:
							  { [] }
	| tables_list table { $2 :: $1 }


