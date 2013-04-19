let _ =

   let lexbuf = Lexing.from_channel stdin in
   let program = Parser.program Scanner.cor_token lexbuf in

   let listing = Ast.string_of_program program in print_string listing
