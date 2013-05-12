open Ast
open Generator
open Semantic
open Parser
open Scanner

exception Silent of string

let _ =


   let source = open_in Sys.argv.(1) in
   let lexbuf = Lexing.from_channel source in
   let program = 
  (*   try*)
       Parser.program Scanner.token lexbuf 
   (*  with _ ->
       exit 2 *)
   in
   let _ = Semantic.check_program(program) in
   let python_source_code = (str_of_program program) in
   let file_name = (String.sub Sys.argv.(1) 0 (String.length Sys.argv.(1) - 3)) in
   let dest = file_name ^".clx" in
   let bin = open_out dest in
   output_string bin python_source_code;
   close_out bin;

let file_name = (String.sub Sys.argv.(1) 0 (String.length Sys.argv.(1) - 3)) in
let make_executable = Sys.command ("chmod a+x " ^ file_name ^ ".clx") in
match make_executable with
0 -> "Success!"
| _ -> "Error";
