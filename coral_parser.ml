type token =
  | SEMICOLON
  | LPAREN
  | RPAREN
  | LBRACKET
  | RBRACKET
  | VOID
  | STRING
  | IDENTIFIER of (string)
  | STRING_LIT of (string)
  | EOF

open Parsing;;
let _ = parse_error;;
let yytransl_const = [|
  257 (* SEMICOLON *);
  258 (* LPAREN *);
  259 (* RPAREN *);
  260 (* LBRACKET *);
  261 (* RBRACKET *);
  262 (* VOID *);
  263 (* STRING *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  264 (* IDENTIFIER *);
  265 (* STRING_LIT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\003\000\004\000\004\000\005\000\005\000\
\006\000\007\000\000\000"

let yylen = "\002\000\
\001\000\001\000\002\000\007\000\001\000\001\000\001\000\002\000\
\001\000\005\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\005\000\006\000\011\000\000\000\002\000\000\000\
\003\000\000\000\000\000\000\000\000\000\000\000\000\000\007\000\
\009\000\000\000\004\000\008\000\000\000\000\000\010\000"

let yydgoto = "\002\000\
\005\000\006\000\007\000\008\000\015\000\016\000\017\000"

let yysindex = "\001\000\
\254\254\000\000\000\000\000\000\000\000\254\254\000\000\249\254\
\000\000\004\255\005\255\003\255\001\255\008\255\251\254\000\000\
\000\000\002\255\000\000\000\000\009\255\012\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\014\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\009\000\000\000\000\000\002\000\000\000"

let yytablesize = 17
let yytable = "\019\000\
\010\000\001\000\014\000\003\000\004\000\011\000\013\000\012\000\
\014\000\018\000\021\000\022\000\023\000\001\000\009\000\000\000\
\020\000"

let yycheck = "\005\001\
\008\001\001\000\008\001\006\001\007\001\002\001\004\001\003\001\
\008\001\002\001\009\001\003\001\001\001\000\000\006\000\255\255\
\015\000"

let yynames_const = "\
  SEMICOLON\000\
  LPAREN\000\
  RPAREN\000\
  LBRACKET\000\
  RBRACKET\000\
  VOID\000\
  STRING\000\
  EOF\000\
  "

let yynames_block = "\
  IDENTIFIER\000\
  STRING_LIT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'function_list) in
    Obj.repr(
# 14 "coral_parser.mly"
 ()
# 95 "coral_parser.ml"
               : int))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'function_definition) in
    Obj.repr(
# 19 "coral_parser.mly"
 ()
# 102 "coral_parser.ml"
               : 'function_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'function_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'function_definition) in
    Obj.repr(
# 21 "coral_parser.mly"
 ()
# 110 "coral_parser.ml"
               : 'function_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 6 : 'type_specifier) in
    let _2 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'statement_list) in
    Obj.repr(
# 26 "coral_parser.mly"
 ()
# 119 "coral_parser.ml"
               : 'function_definition))
; (fun __caml_parser_env ->
    Obj.repr(
# 31 "coral_parser.mly"
 ()
# 125 "coral_parser.ml"
               : 'type_specifier))
; (fun __caml_parser_env ->
    Obj.repr(
# 34 "coral_parser.mly"
 ()
# 131 "coral_parser.ml"
               : 'type_specifier))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'statement) in
    Obj.repr(
# 39 "coral_parser.mly"
 ()
# 138 "coral_parser.ml"
               : 'statement_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'statement_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'statement) in
    Obj.repr(
# 41 "coral_parser.mly"
 ()
# 146 "coral_parser.ml"
               : 'statement_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'function_call) in
    Obj.repr(
# 46 "coral_parser.mly"
 ()
# 153 "coral_parser.ml"
               : 'statement))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    Obj.repr(
# 51 "coral_parser.mly"
 ()
# 161 "coral_parser.ml"
               : 'function_call))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : int)
