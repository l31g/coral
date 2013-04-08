%{ open Ast %}

%token SEMICOLON LPAREN RPAREN LBRACKET RBRACKET
%token VOID
%token <string> IDENTIFIER
%token <string> STRING
%token EOF

%start	program
%type <Ast.program> program

%%

program:
	/* nothing */						{ []. [] }
	| program fdef						{ fst $1, ($2 :: snd $1) }

fdef:
	IDENTIFIER LPAREN RPAREN LBRACKET stmt_list RBRACKET
										{ { fname	= $1;
											formals = $3;
											locals	= List.rev $6;
											body	= List.rev $7	}}

stmt_list:
	/* Nothing */						{ [] }
	| stmt_list stmt 					{ $2 :: $1 }


stmt:
	expr SEMICOLON						{ Expr ($1) }
	| LBRACKET stmt_list RBRACKET		{ Block(List.rev $2) }

expr:
	STRING 								{ Literal($1)}
	| IDENTIFIER						{ Id ($1) }
	| IDENTIFIER LPAREN STRING RPAREN	{ Call ($1, $3) }
