%token SEMICOLON LPAREN RPAREN LBRACKET RBRACKET
%token VOID STRING
%token <string> IDENTIFIER
%token <string> STRING_LIT
%token EOF

%start	program
%type <int> program

%%

program:
	function_list
	{}
;

function_list:
	function_definition
	{}
	| function_list function_definition
	{}
;

function_definition:
	type_specifier IDENTIFIER LPAREN RPAREN LBRACKET statement_list RBRACKET
	{}
;

type_specifier:
	VOID
	{}
	| STRING
	{}
;

statement_list:
	statement
	{}
	| statement_list statement
	{}
;

statement:
	function_call
	{}
;

function_call:
	IDENTIFIER LPAREN STRING_LIT RPAREN SEMICOLON
	{}
;		
