{
	(*open coral_parser*)
	open Printf
	exception Eof
}

let digit = ['0'-'9']
let iden = ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '_' '0'-'9']*

rule cor_tok = parse
		[' ' '\t']				{ cor_tok lexbuf }

	|	iden as identifier		{ printf "id: %s\n" identifier}
	|	digit+ as inum			{ printf "digit: %s\n" inum}

	|	['\n']					{ printf "EOL" }

	|	'+'
	|	'-'
	|	'*'
	|	'/' as op 				{ printf "op: %c\n" op}

	|	'('						{ printf "LPAREN" }
	|	')'						{ printf "RPAREN" }
	|	';'						{ printf "SEMICOLON" }
	|	':'						{ printf "COLON" }
	|	'='						{ printf "EQUAL" }
	|	'{'						{ printf "LBRACKET" }
	|	'}'						{ printf "RBRACKET" }
	|	'^'

	|	'>'
	|	'<'
	|	">="
	|	"<="

	|	'!'
	|	'%'
	|	"||"					{ printf "Pipes!\n" }
	|	"&&"
	|	"=="
	|	'.'
	|	','

	|	eof						{ raise Eof }

rule string_literal = parse


{
	let main () =
		let lexbuf = Lexing.from_channel stdin in
		while true do
			cor_tok lexbuf
		done

	let _ = Printexc.print main()
}