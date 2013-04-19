open Ast
open Generator


let _ =

   let lexbuf = Lexing.from_channel stdin in
   let program = Parser.program Scanner.token lexbuf in

   let python_source_code = (str_of_program program) in
   let dest = open_out "IR.py" in
   output_string dest python_source_code;
   close_out dest;

