{
#open "coral_parser";;
exception Eof;;
}
rule Token = parse
		[' ' '\t']				{ Token lexbuf } (* white space *)
	|	['\n']					{ EOL }
	|	'+'						{ PLUS }
	|	'-'						{ MINUS }
	|	'*'						{ MULTIPLY }
	|	'/'						{ DIVIDE }
	|	'('						{ LPAREN }
	|	')'						{ RPAREN }
	|	';'						{ SEMICOLON }
	|	':'						{ COLON }
	|	'='						{ EQUAL }
	|	'=='					{ DOUBLE_EQUAL }
	|	'{'						{ OPEN_BRACKET }
	|	'}'						{ CLOSE_BRACKET }
	|	["void" "int" "boolean"
		"array" "char" "double"
		"string"]				{ RETURN_TYPE }
	|	[a-zA-Z_][0-9a-zA-Z_]*	{ IDENTIFIER }		
	|	\".*\"					{ STRING_LITERAL }
	|	eof						{ raise Eof }
;;