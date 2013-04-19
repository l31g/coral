%{ open Ast %}

%token PLUS MINUS TIMES MOD DIVIDE LPAREN RPAREN SEMI COLON EQUAL
%token LBRACKET RBRACKET CARAT DOT COMMA GT LT GEQ LEQ NEQ OR AND
%token EQ ELSE WHILE INT IF FOR RETURN VOID
%token <int> LITERAL
%token <string> ID
%token EOF

%nonassoc ELSE
%right EQUAL
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE

%start	program
%type <Ast.program> program

%%

program:
	/* nothing */						{ [], [] }
	| program fdef						{ fst $1, ($2 :: snd $1) }

fdef:
	ID LPAREN RPAREN LBRACKET stmt_list RBRACKET
										{ { fname	= $1;
											formals = [];
											locals = [];
											body	= List.rev $5	} }

stmt_list:
	/* Nothing */						{ [] }
	| stmt_list stmt 					{ $2 :: $1 }


stmt:
	expr SEMI							{ Expr ($1) }
	| LBRACKET stmt_list RBRACKET		{ Block(List.rev $2) }

expr:
	  LITERAL					{ Literal($1) }
	| ID						{ Id ($1) }
	| ID LPAREN actuals_opt RPAREN	{ Call ($1, $3) }

actuals_opt:
					{ [] }
	| expr 			{ [$1] }
	| LITERAL 		{ [Literal($1)] }
