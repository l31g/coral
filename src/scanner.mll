{
	open Parser
}
let letter = ['a' - 'z' 'A' - 'Z' ' ' '0' - '9']
let digit = ['0' - '9']
let whitespace = [' ' '\t' '\n' '\r']

rule token = parse
		whitespace+	{ token lexbuf }
	| "/*"						{ comment lexbuf }
	| "//"						{ singleComment lexbuf }
	| '\n'						{ NEWLINE }

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

	|	'!'						{ NOT }
	|	'>'						{ GT }
	|	'<'						{ LT }
	|	">="					{ GEQ }
	|	"<="					{ LEQ }
	|	"!="					{ NEQ }
	|	"||"					{ OR }
	|	"&&"					{ AND }
	|	"=="					{ EQ }

	|	"**"					{ EXP }
	|	"++"					{ INCR }
	|	"--"					{ DECR }
	|	"+="					{ PLEQ }
	|	"-="					{ MIEQ }
	|	"*="					{ MUEQ }
	|	"/="					{ DVEQ } 

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

	|	"Table"					{ TABLE }
	|	"#cordb"				{ CORDB }
	|	"#enddb"				{ ENDDB }
	|	"server"				{ SERVER }
	|	"port"					{ PORT }
	| 	"user"					{ USER }
	|	"password"				{ PASS }
	| 	"type"					{ TYPE }
	| 	"DBName"				{ DBNAME }
	|	"#cordbconn"			{ CORDBCONN }
	|	"#enddbconn"			{ ENDDBCONN }
	|	"primary_key"			{ PRIMARYKEY }
	| 	"foreign_key"			{ FOREIGNKEY }
	|	"string"				{ STRING }
	|	"float"					{ FLOAT }


	|	eof						{ EOF }
	| digit+ as lxm { INTLITERAL(int_of_string lxm) } (* integers *)
	| "\""(letter*)"\"" as lxm { STRINGLITERAL(lxm) }
	| ['0'-'9']+'.'['0'-'9']* as lxm { FPLITERAL(float_of_string lxm) }
	| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '_' '0'-'9']* as lxm { ID(lxm) }

and comment = parse
		"*/" { token lexbuf }
		| _	 { comment lexbuf }

and singleComment = parse 
		"\n" { token lexbuf }
		| _ { singleComment lexbuf }
