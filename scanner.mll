{
	open Parser
}

rule token = parse
		[' ' '\t' '\r' '\n']	{ token lexbuf }
	| "/*"						{ comment lexbuf }

	|	'+'						{ PLUS }
	|	'-'						{ MINUS }
	|	'*'						{ TIMES }
	|	'%'						{ MOD }
	|	'/'						{ DIVIDE }

	|	'('						{ LPAREN }
	|	')'						{ RPAREN }
	|	';'						{ SEMI }
	|	':'						{ COLON }
	|	'='						{ EQUAL }
	|	'{'						{ LBRACKET }
	|	'}'						{ RBRACKET }
	|	'^'						{ CARAT }
	|	'.'						{ DOT }
	|	','						{ COMMA }

	|	'>'						{ GT }
	|	'<'						{ LT }
	|	">="					{ GEQ }
	|	"<="					{ LEQ }
	|	"!="					{ NEQ }
	|	"||"					{ OR }
	|	"&&"					{ AND }
	|	"=="					{ EQ }

	|	"else"					{ ELSE }
	|	"while"					{ WHILE }
	|	"int"					{ INT }
	|	"if"					{ IF }
	|	"for"					{ FOR }
	|	"return"				{ RETURN }
	|	"void"					{ VOID }


	|	eof						{ EOF }
	| ['0' - '9']+ as lxm { LITERAL(int_of_string lxm) } (* integers *)
	| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '_' '0'-'9']* as lxm { ID(lxm) }

and comment = parse
		"*/" { token lexbuf }
		| _	 { comment lexbuf }