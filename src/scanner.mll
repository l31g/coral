{
	open Parser

	let incrLineNum lexbuf =
		let pos = lexbuf.Lexing.lex_curr_p in
			lexbuf.Lexing.lex_curr_p <- { pos with
				Lexing.pos_lnum =
					pos.Lexing.pos_lnum + 1;

				Lexing.pos_bol =
					pos.Lexing.pos_cnum;
			}


}


let letter = ['a' - 'z' 'A' - 'Z' ' ' '0' - '9']
let digit = ['0' - '9']
let symbol = "\\n" | "\\t" | '.' | '*' | "\\" | '?' | '`' | '!' | '@' | '#' | '$' | '%' | '^' | '&' | '*' | '(' | ')' | '-' | '+' | '=' | '{' | '}' | '[' | ']' | '|' | ';' | '>' | '<' | ','
let whitespace = [' ' '\t']



rule token = parse
	 whitespace+				{ token lexbuf }
	| ['\n' '\r']				{ incrLineNum lexbuf; token lexbuf }
	| "/*"						{ comment lexbuf }
	| "//"						{ singleComment lexbuf }

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
	|	'['						{ LSQUARE }
	|	']'						{ RSQUARE }
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
	|	"fprintf"				{ FPRINT }
	|	"void"					{ VOID }
	| 	"global"				{ GLOBAL }

	|	"Table"					{ TABLE }
	|	"#cordb"				{ CORDB }
	|	"#enddb"				{ ENDDB }
	|	"server"				{ SERVER }
	|	"port"					{ PORT }
	| 	"user"					{ USER }
	| 	"user_t"				{ USERTYPE }
	|	"password"				{ PASS }
	| 	"type"					{ TYPE }
	| 	"DBName"				{ DBNAME }
	|	"#cordbconn"			{ CORDBCONN }
	|	"#enddbconn"			{ ENDDBCONN }
	|	"primary_key"			{ PRIMARYKEY }
	| 	"foreign_key"			{ FOREIGNKEY }
	|	"sizeof"				{ SIZEOF }
	|	"string"				{ STRING }
	|	"float"					{ FLOAT }
	|	"add"					{ ADD }
	|	"get"					{ GET }
	| 	"connectDB"				{ CONNECTDB }
	|	"closeDB"				{ CLOSEDB }
	|	"fopen"					{ OPEN }
	|	"fclose"				{ CLOSE }
	|	"freadline"				{ FREAD }
	|	"File"					{ FILE }

	|	eof						{ EOF }
	| digit+ as lxm { INTLITERAL(int_of_string lxm) } (* integers *)
	| "\""(letter | digit | symbol)* "\"" as lxm { STRINGLITERAL(lxm) }
	| ['0'-'9']+'.'['0'-'9']* as lxm { FPLITERAL(float_of_string lxm) }
	| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '_' '0'-'9']* as lxm { ID(lxm) }
	| _  as char				{
									let pos = lexbuf.Lexing.lex_curr_p in
									raise (Failure("Illegal character: "^ Char.escaped char ^ " in line #" ^ (string_of_int pos.Lexing.pos_lnum))) }

and comment = parse
		"*/" { token lexbuf }
		| "\n" { incrLineNum lexbuf; token lexbuf }
		| _	 { comment lexbuf }

and singleComment = parse
		"\n" { incrLineNum lexbuf; token lexbuf }
		| _ { singleComment lexbuf }


