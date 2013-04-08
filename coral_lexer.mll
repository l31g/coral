{
#open "coral_parser";;
exception Eof;;
}
rule Token = parse
		[' ' '\t']		{ Token lexbuf } (* white space *)
	|	['\n']			{ EOL }
	|	'+'				{ PLUS }
	|	'-'				{ MINUS }
	|	'*'				{ MULTIPLY }
	|	'/'				{ DIVIDE }
	|	'('				{ LPAREN }
	|	')'				{ RPAREN }
	|	';'				{ SEMICOLON }
	|	':'				{ COLON }
	|	'='				{ EQUAL }
	|	'=='			{ DOUBLEEQUAL }
	|	'{'				{ OPENBRACKET }
	|	'}'				{ CLOSEBRACKET }
	|	'['
	|	eof				{ raise Eof }
;;