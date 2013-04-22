{
	open Parser
}
let letter = ['a' - 'z' 'A' - 'Z' ' ']
let digit = ['0' - '9']
let whitespace = [' ' '\t' '\n' '\r']

rule token = parse
		whitespace+	{ token lexbuf }
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
	|	'='						{ ASSIGN }
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
	|	"printf"				{ PRINT }
	|	"void"					{ VOID }
	|	"break"					{ BREAK }
	|	"continue"				{ CONTINUE }
	|	"sizeof"				{ SIZEOF }


	|	eof						{ EOF }
	| digit+ as lxm { INTLITERAL(int_of_string lxm) } (* integers *)
	| "\""(letter*)"\"" as lxm { STRINGLITERAL(lxm) }
	| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '_' '0'-'9']* as lxm { ID(lxm) }

and comment = parse
		"*/" { token lexbuf }
		| _	 { comment lexbuf }