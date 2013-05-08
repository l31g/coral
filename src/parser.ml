type token =
  | PLUS
  | MINUS
  | TIMES
  | MOD
  | DIVIDE
  | LPAREN
  | RPAREN
  | SEMI
  | COLON
  | ASSIGN
  | LBRACKET
  | RBRACKET
  | CARAT
  | DOT
  | COMMA
  | GT
  | LT
  | GEQ
  | LEQ
  | NEQ
  | OR
  | AND
  | EXP
  | INCR
  | DECR
  | PLEQ
  | MIEQ
  | MUEQ
  | DVEQ
  | EQ
  | ELSE
  | WHILE
  | INT
  | IF
  | FOR
  | RETURN
  | PRINT
  | VOID
  | BREAK
  | CONTINUE
  | SIZEOF
  | STRING
  | INTLITERAL of (int)
  | STRINGLITERAL of (string)
  | ID of (string)
  | EOF
  | CORDB
  | ENDDB
  | TABLE
  | SERVER
  | PORT
  | USER
  | PASS
  | TYPE
  | DBNAME
  | CORDBCONN
  | ENDDBCONN
  | FOREIGNKEY
  | PRIMARYKEY

open Parsing;;
let _ = parse_error;;
# 1 "parser.mly"
 open Ast 
# 67 "parser.ml"
let yytransl_const = [|
  257 (* PLUS *);
  258 (* MINUS *);
  259 (* TIMES *);
  260 (* MOD *);
  261 (* DIVIDE *);
  262 (* LPAREN *);
  263 (* RPAREN *);
  264 (* SEMI *);
  265 (* COLON *);
  266 (* ASSIGN *);
  267 (* LBRACKET *);
  268 (* RBRACKET *);
  269 (* CARAT *);
  270 (* DOT *);
  271 (* COMMA *);
  272 (* GT *);
  273 (* LT *);
  274 (* GEQ *);
  275 (* LEQ *);
  276 (* NEQ *);
  277 (* OR *);
  278 (* AND *);
  279 (* EXP *);
  280 (* INCR *);
  281 (* DECR *);
  282 (* PLEQ *);
  283 (* MIEQ *);
  284 (* MUEQ *);
  285 (* DVEQ *);
  286 (* EQ *);
  287 (* ELSE *);
  288 (* WHILE *);
  289 (* INT *);
  290 (* IF *);
  291 (* FOR *);
  292 (* RETURN *);
  293 (* PRINT *);
  294 (* VOID *);
  295 (* BREAK *);
  296 (* CONTINUE *);
  297 (* SIZEOF *);
  298 (* STRING *);
    0 (* EOF *);
  302 (* CORDB *);
  303 (* ENDDB *);
  304 (* TABLE *);
  305 (* SERVER *);
  306 (* PORT *);
  307 (* USER *);
  308 (* PASS *);
  309 (* TYPE *);
  310 (* DBNAME *);
  311 (* CORDBCONN *);
  312 (* ENDDBCONN *);
  313 (* FOREIGNKEY *);
  314 (* PRIMARYKEY *);
    0|]

let yytransl_block = [|
  299 (* INTLITERAL *);
  300 (* STRINGLITERAL *);
  301 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\004\000\004\000\005\000\009\000\009\000\010\000\010\000\
\010\000\010\000\010\000\010\000\011\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
\012\000\012\000\007\000\007\000\014\000\014\000\015\000\013\000\
\013\000\016\000\016\000\008\000\008\000\017\000\006\000\006\000\
\006\000\018\000\018\000\018\000\018\000\018\000\018\000\019\000\
\002\000\020\000\021\000\022\000\022\000\023\000\023\000\024\000\
\024\000\025\000\025\000\026\000\026\000\027\000\028\000\003\000\
\003\000\000\000"

let yylen = "\002\000\
\007\000\000\000\002\000\009\000\000\000\002\000\002\000\003\000\
\003\000\005\000\005\000\009\000\001\000\001\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\001\000\004\000\004\000\
\000\000\001\000\000\000\001\000\001\000\003\000\002\000\000\000\
\001\000\001\000\003\000\000\000\002\000\005\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\004\000\
\006\000\001\000\004\000\001\000\002\000\000\000\002\000\005\000\
\005\000\001\000\003\000\001\000\003\000\003\000\006\000\000\000\
\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\074\000\050\000\051\000\052\000\053\000\
\054\000\055\000\000\000\000\000\000\000\000\000\000\000\000\000\
\072\000\000\000\000\000\000\000\056\000\000\000\002\000\000\000\
\073\000\000\000\000\000\000\000\068\000\000\000\057\000\048\000\
\047\000\049\000\003\000\000\000\000\000\000\000\000\000\000\000\
\067\000\069\000\058\000\000\000\060\000\000\000\000\000\000\000\
\000\000\061\000\000\000\000\000\000\000\000\000\000\000\037\000\
\000\000\000\000\000\000\000\000\063\000\071\000\039\000\000\000\
\000\000\059\000\000\000\000\000\044\000\038\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\045\000\065\000\064\000\
\000\000\005\000\004\000\000\000\000\000\000\000\000\000\000\000\
\013\000\014\000\000\000\006\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\007\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\008\000\000\000\
\000\000\000\000\000\000\009\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\046\000\
\000\000\000\000\000\000\031\000\000\000\032\000\011\000\010\000\
\000\000\000\000\000\000\000\000\000\000\012\000"

let yydgoto = "\002\000\
\004\000\011\000\020\000\027\000\035\000\036\000\054\000\073\000\
\077\000\092\000\093\000\123\000\126\000\055\000\056\000\127\000\
\078\000\012\000\013\000\044\000\045\000\046\000\051\000\061\000\
\029\000\030\000\047\000\025\000"

let yysindex = "\007\000\
\222\254\000\000\208\254\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\236\254\033\255\208\254\004\255\041\255\208\254\
\000\000\083\255\208\254\090\255\000\000\208\254\000\000\051\255\
\000\000\208\254\011\255\101\255\000\000\111\255\000\000\000\000\
\000\000\000\000\000\000\060\255\118\255\051\255\119\255\159\255\
\000\000\000\000\000\000\147\255\000\000\119\255\167\255\011\255\
\011\255\000\000\067\255\174\255\138\255\177\255\170\255\000\000\
\178\255\181\255\182\255\011\255\000\000\000\000\000\000\191\255\
\011\255\000\000\119\255\119\255\000\000\000\000\198\255\199\255\
\011\255\200\255\201\255\162\255\029\255\000\000\000\000\000\000\
\210\255\000\000\000\000\204\255\205\255\222\255\096\255\223\255\
\000\000\000\000\061\255\000\000\150\255\096\255\043\255\096\255\
\096\255\096\255\173\255\096\255\096\255\096\255\096\255\096\255\
\096\255\096\255\096\255\000\000\096\255\096\255\096\255\096\255\
\096\255\096\255\096\255\096\255\096\255\196\255\000\000\220\255\
\244\255\011\000\224\255\000\000\011\000\226\255\215\255\227\255\
\077\255\202\000\202\000\077\255\077\255\077\255\254\255\254\255\
\254\255\254\255\213\000\011\000\011\000\011\000\213\000\000\000\
\072\255\072\255\096\255\000\000\096\255\000\000\000\000\000\000\
\236\255\011\000\096\255\228\255\072\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\231\000\241\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\255\000\000\246\255\
\000\000\000\000\085\255\000\000\000\000\000\000\247\255\000\000\
\000\000\000\000\000\000\005\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\058\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\127\255\000\000\000\000\000\000\000\000\000\000\
\000\000\014\000\000\000\016\000\016\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\152\255\000\000\000\000\030\255\000\000\017\000\000\000\
\035\000\115\000\135\000\055\000\075\000\095\000\141\000\159\000\
\165\000\183\000\106\255\044\255\074\255\104\255\189\000\000\000\
\000\000\000\000\014\000\000\000\000\000\000\000\000\000\000\000\
\000\000\032\255\018\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\240\000\000\000\239\255\000\000\000\000\
\200\000\145\255\169\255\185\255\199\000\000\000\236\000\000\000\
\000\000\000\000\224\001\094\000\000\001\000\000\000\000\000\000\
\009\001\000\000\000\000\000\000"

let yytablesize = 506
let yytable = "\099\000\
\005\000\006\000\007\000\008\000\009\000\010\000\118\000\001\000\
\120\000\121\000\122\000\062\000\125\000\125\000\129\000\130\000\
\131\000\132\000\133\000\134\000\003\000\135\000\136\000\137\000\
\138\000\139\000\140\000\141\000\142\000\143\000\053\000\057\000\
\062\000\151\000\152\000\014\000\042\000\062\000\043\000\082\000\
\083\000\062\000\015\000\032\000\042\000\158\000\043\000\053\000\
\033\000\017\000\028\000\028\000\034\000\082\000\119\000\076\000\
\062\000\062\000\028\000\122\000\084\000\154\000\085\000\086\000\
\087\000\088\000\101\000\122\000\005\000\005\000\102\000\089\000\
\090\000\091\000\084\000\153\000\085\000\086\000\087\000\088\000\
\029\000\029\000\082\000\156\000\018\000\089\000\090\000\091\000\
\029\000\005\000\021\000\005\000\005\000\005\000\005\000\028\000\
\002\000\114\000\115\000\116\000\005\000\005\000\005\000\084\000\
\040\000\085\000\086\000\087\000\088\000\037\000\021\000\021\000\
\023\000\023\000\089\000\090\000\091\000\002\000\021\000\038\000\
\023\000\039\000\002\000\058\000\059\000\023\000\002\000\030\000\
\030\000\030\000\030\000\030\000\088\000\030\000\030\000\023\000\
\023\000\024\000\089\000\090\000\091\000\030\000\030\000\030\000\
\030\000\030\000\030\000\030\000\030\000\030\000\103\000\104\000\
\105\000\106\000\107\000\049\000\030\000\108\000\034\000\034\000\
\071\000\072\000\041\000\043\000\048\000\109\000\110\000\111\000\
\112\000\113\000\114\000\115\000\116\000\103\000\104\000\105\000\
\106\000\107\000\052\000\117\000\124\000\062\000\063\000\064\000\
\065\000\066\000\067\000\068\000\109\000\110\000\111\000\112\000\
\113\000\114\000\115\000\116\000\103\000\104\000\105\000\106\000\
\107\000\069\000\117\000\144\000\074\000\075\000\081\000\079\000\
\080\000\096\000\097\000\109\000\110\000\111\000\112\000\113\000\
\114\000\115\000\116\000\094\000\103\000\104\000\105\000\106\000\
\107\000\117\000\145\000\098\000\100\000\149\000\001\000\147\000\
\148\000\150\000\157\000\109\000\110\000\111\000\112\000\113\000\
\114\000\115\000\116\000\155\000\103\000\104\000\105\000\106\000\
\107\000\117\000\146\000\066\000\035\000\036\000\103\000\104\000\
\105\000\106\000\107\000\109\000\110\000\111\000\112\000\113\000\
\114\000\115\000\116\000\103\000\104\000\105\000\106\000\107\000\
\070\000\117\000\114\000\115\000\116\000\033\000\040\000\041\000\
\033\000\095\000\109\000\110\000\111\000\112\000\113\000\114\000\
\115\000\116\000\060\000\015\000\015\000\015\000\015\000\015\000\
\117\000\015\000\015\000\128\000\070\000\050\000\042\000\000\000\
\000\000\015\000\015\000\015\000\015\000\015\000\015\000\018\000\
\018\000\018\000\018\000\018\000\000\000\018\000\018\000\000\000\
\015\000\000\000\000\000\000\000\000\000\018\000\018\000\018\000\
\018\000\018\000\018\000\020\000\020\000\020\000\020\000\020\000\
\000\000\020\000\020\000\000\000\018\000\000\000\000\000\000\000\
\000\000\020\000\020\000\020\000\020\000\020\000\020\000\019\000\
\019\000\019\000\019\000\019\000\000\000\019\000\019\000\000\000\
\020\000\000\000\000\000\000\000\000\000\019\000\019\000\019\000\
\019\000\019\000\019\000\016\000\016\000\000\000\000\000\000\000\
\000\000\016\000\016\000\000\000\019\000\000\000\000\000\000\000\
\000\000\016\000\016\000\016\000\016\000\016\000\016\000\017\000\
\017\000\000\000\000\000\000\000\000\000\017\000\017\000\000\000\
\016\000\000\000\000\000\026\000\026\000\017\000\017\000\017\000\
\017\000\017\000\017\000\026\000\026\000\026\000\026\000\026\000\
\026\000\000\000\000\000\000\000\017\000\024\000\024\000\000\000\
\000\000\000\000\026\000\027\000\027\000\024\000\024\000\024\000\
\024\000\024\000\024\000\027\000\027\000\027\000\027\000\027\000\
\027\000\000\000\000\000\000\000\024\000\025\000\025\000\000\000\
\000\000\000\000\027\000\022\000\022\000\025\000\025\000\025\000\
\025\000\025\000\025\000\022\000\105\000\106\000\107\000\000\000\
\022\000\000\000\000\000\000\000\025\000\103\000\104\000\105\000\
\106\000\107\000\022\000\000\000\000\000\000\000\114\000\115\000\
\116\000\000\000\000\000\000\000\109\000\110\000\111\000\112\000\
\000\000\114\000\115\000\116\000\016\000\000\000\000\000\019\000\
\000\000\000\000\022\000\000\000\000\000\026\000\000\000\000\000\
\000\000\031\000"

let yycheck = "\087\000\
\049\001\050\001\051\001\052\001\053\001\054\001\094\000\001\000\
\096\000\097\000\098\000\012\001\100\000\101\000\102\000\103\000\
\104\000\105\000\106\000\107\000\055\001\109\000\110\000\111\000\
\112\000\113\000\114\000\115\000\116\000\117\000\048\000\049\000\
\033\001\145\000\146\000\056\001\007\001\038\001\007\001\011\001\
\012\001\042\001\010\001\033\001\015\001\157\000\015\001\065\000\
\038\001\046\001\007\001\008\001\042\001\011\001\012\001\073\000\
\057\001\058\001\015\001\147\000\032\001\149\000\034\001\035\001\
\036\001\037\001\006\001\155\000\011\001\012\001\010\001\043\001\
\044\001\045\001\032\001\147\000\034\001\035\001\036\001\037\001\
\007\001\008\001\011\001\155\000\044\001\043\001\044\001\045\001\
\015\001\032\001\008\001\034\001\035\001\036\001\037\001\045\001\
\012\001\021\001\022\001\023\001\043\001\044\001\045\001\032\001\
\045\001\034\001\035\001\036\001\037\001\009\001\007\001\008\001\
\007\001\008\001\043\001\044\001\045\001\033\001\015\001\009\001\
\015\001\011\001\038\001\057\001\058\001\020\001\042\001\001\001\
\002\001\003\001\004\001\005\001\037\001\007\001\008\001\030\001\
\047\001\048\001\043\001\044\001\045\001\015\001\016\001\017\001\
\018\001\019\001\020\001\021\001\022\001\023\001\001\001\002\001\
\003\001\004\001\005\001\009\001\030\001\008\001\007\001\008\001\
\067\000\068\000\045\001\045\001\006\001\016\001\017\001\018\001\
\019\001\020\001\021\001\022\001\023\001\001\001\002\001\003\001\
\004\001\005\001\012\001\030\001\008\001\008\001\045\001\007\001\
\015\001\008\001\006\001\006\001\016\001\017\001\018\001\019\001\
\020\001\021\001\022\001\023\001\001\001\002\001\003\001\004\001\
\005\001\011\001\030\001\008\001\007\001\007\001\045\001\008\001\
\008\001\006\001\006\001\016\001\017\001\018\001\019\001\020\001\
\021\001\022\001\023\001\010\001\001\001\002\001\003\001\004\001\
\005\001\030\001\007\001\006\001\006\001\015\001\000\000\008\001\
\007\001\007\001\007\001\016\001\017\001\018\001\019\001\020\001\
\021\001\022\001\023\001\008\001\001\001\002\001\003\001\004\001\
\005\001\030\001\007\001\011\001\007\001\007\001\001\001\002\001\
\003\001\004\001\005\001\016\001\017\001\018\001\019\001\020\001\
\021\001\022\001\023\001\001\001\002\001\003\001\004\001\005\001\
\012\001\030\001\021\001\022\001\023\001\008\001\007\001\007\001\
\007\001\082\000\016\001\017\001\018\001\019\001\020\001\021\001\
\022\001\023\001\051\000\001\001\002\001\003\001\004\001\005\001\
\030\001\007\001\008\001\101\000\065\000\046\000\038\000\255\255\
\255\255\015\001\016\001\017\001\018\001\019\001\020\001\001\001\
\002\001\003\001\004\001\005\001\255\255\007\001\008\001\255\255\
\030\001\255\255\255\255\255\255\255\255\015\001\016\001\017\001\
\018\001\019\001\020\001\001\001\002\001\003\001\004\001\005\001\
\255\255\007\001\008\001\255\255\030\001\255\255\255\255\255\255\
\255\255\015\001\016\001\017\001\018\001\019\001\020\001\001\001\
\002\001\003\001\004\001\005\001\255\255\007\001\008\001\255\255\
\030\001\255\255\255\255\255\255\255\255\015\001\016\001\017\001\
\018\001\019\001\020\001\001\001\002\001\255\255\255\255\255\255\
\255\255\007\001\008\001\255\255\030\001\255\255\255\255\255\255\
\255\255\015\001\016\001\017\001\018\001\019\001\020\001\001\001\
\002\001\255\255\255\255\255\255\255\255\007\001\008\001\255\255\
\030\001\255\255\255\255\007\001\008\001\015\001\016\001\017\001\
\018\001\019\001\020\001\015\001\016\001\017\001\018\001\019\001\
\020\001\255\255\255\255\255\255\030\001\007\001\008\001\255\255\
\255\255\255\255\030\001\007\001\008\001\015\001\016\001\017\001\
\018\001\019\001\020\001\015\001\016\001\017\001\018\001\019\001\
\020\001\255\255\255\255\255\255\030\001\007\001\008\001\255\255\
\255\255\255\255\030\001\007\001\008\001\015\001\016\001\017\001\
\018\001\019\001\020\001\015\001\003\001\004\001\005\001\255\255\
\020\001\255\255\255\255\255\255\030\001\001\001\002\001\003\001\
\004\001\005\001\030\001\255\255\255\255\255\255\021\001\022\001\
\023\001\255\255\255\255\255\255\016\001\017\001\018\001\019\001\
\255\255\021\001\022\001\023\001\013\000\255\255\255\255\016\000\
\255\255\255\255\019\000\255\255\255\255\022\000\255\255\255\255\
\255\255\026\000"

let yynames_const = "\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  MOD\000\
  DIVIDE\000\
  LPAREN\000\
  RPAREN\000\
  SEMI\000\
  COLON\000\
  ASSIGN\000\
  LBRACKET\000\
  RBRACKET\000\
  CARAT\000\
  DOT\000\
  COMMA\000\
  GT\000\
  LT\000\
  GEQ\000\
  LEQ\000\
  NEQ\000\
  OR\000\
  AND\000\
  EXP\000\
  INCR\000\
  DECR\000\
  PLEQ\000\
  MIEQ\000\
  MUEQ\000\
  DVEQ\000\
  EQ\000\
  ELSE\000\
  WHILE\000\
  INT\000\
  IF\000\
  FOR\000\
  RETURN\000\
  PRINT\000\
  VOID\000\
  BREAK\000\
  CONTINUE\000\
  SIZEOF\000\
  STRING\000\
  EOF\000\
  CORDB\000\
  ENDDB\000\
  TABLE\000\
  SERVER\000\
  PORT\000\
  USER\000\
  PASS\000\
  TYPE\000\
  DBNAME\000\
  CORDBCONN\000\
  ENDDBCONN\000\
  FOREIGNKEY\000\
  PRIMARYKEY\000\
  "

let yynames_block = "\
  INTLITERAL\000\
  STRINGLITERAL\000\
  ID\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : 'conn_block) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'tables_list) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'fdef_list) in
    Obj.repr(
# 31 "parser.mly"
                                                                   ( {
							conn = _2;
                            tables = List.rev _5;
							funcs = List.rev _7
		} )
# 446 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 38 "parser.mly"
      ( [] )
# 452 "parser.ml"
               : 'fdef_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'fdef_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdef) in
    Obj.repr(
# 39 "parser.mly"
                  ( _2 :: _1 )
# 460 "parser.ml"
               : 'fdef_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 8 : 'dtype) in
    let _2 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'var_decl_list) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 44 "parser.mly"
          ( {
											return_type = _1;
											fname	= _2;
											formals = _4;
											locals = List.rev _7 ;
											body	= List.rev _8	} )
# 476 "parser.ml"
               : 'fdef))
; (fun __caml_parser_env ->
    Obj.repr(
# 52 "parser.mly"
                    ( [] )
# 482 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 53 "parser.mly"
                       ( _2 :: _1 )
# 490 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 57 "parser.mly"
                 ( Expr (_1) )
# 497 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 58 "parser.mly"
                                ( Block(List.rev _2) )
# 504 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 59 "parser.mly"
                         ( Return(_2) )
# 511 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 61 "parser.mly"
                                ( If(_3, _5) )
# 519 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 62 "parser.mly"
                                  ( While(_3, _5) )
# 527 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 64 "parser.mly"
           ( For(_3, _5, _7, _9))
# 537 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 67 "parser.mly"
                  ( IntLiteral(_1) )
# 544 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 68 "parser.mly"
                     ( StringLiteral(_1) )
# 551 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 69 "parser.mly"
                      ( Assign(_1, _3) )
# 559 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 70 "parser.mly"
                      ( Binop(_1, Add, _3) )
# 567 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 71 "parser.mly"
                       ( Binop(_1, Sub, _3) )
# 575 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 72 "parser.mly"
                       ( Binop(_1, Mult, _3) )
# 583 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 73 "parser.mly"
                        ( Binop(_1, Div, _3) )
# 591 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 74 "parser.mly"
                     ( Binop(_1, Mod, _3) )
# 599 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 75 "parser.mly"
                     ( Binop(_1, Exp, _3) )
# 607 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 76 "parser.mly"
                     ( Binop(_1, Equal, _3) )
# 615 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 77 "parser.mly"
                     ( Binop(_1, Neq, _3) )
# 623 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 78 "parser.mly"
                     ( Binop(_1, Less, _3) )
# 631 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 79 "parser.mly"
                     ( Binop(_1, Leq, _3) )
# 639 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 80 "parser.mly"
                     ( Binop(_1, Greater, _3) )
# 647 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 81 "parser.mly"
                     ( Binop(_1, Geq, _3) )
# 655 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 82 "parser.mly"
                     ( Binop(_1, Or, _3))
# 663 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 83 "parser.mly"
                     ( Binop(_1, And, _3))
# 671 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 84 "parser.mly"
            ( Id(_1) )
# 678 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 85 "parser.mly"
                                    ( Print(_3) )
# 685 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 86 "parser.mly"
                                ( Call (_1, _3) )
# 693 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 89 "parser.mly"
     ( Noexpr )
# 699 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 90 "parser.mly"
           ( _1 )
# 706 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    Obj.repr(
# 93 "parser.mly"
     ( [] )
# 712 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 94 "parser.mly"
               ( List.rev _1 )
# 719 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal) in
    Obj.repr(
# 97 "parser.mly"
            ( [_1] )
# 726 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formal) in
    Obj.repr(
# 98 "parser.mly"
                            ( _3 :: _1 )
# 734 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'dtype) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 101 "parser.mly"
          ( Formal (_1, _2) )
# 742 "parser.ml"
               : 'formal))
; (fun __caml_parser_env ->
    Obj.repr(
# 104 "parser.mly"
     ( [] )
# 748 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 105 "parser.mly"
                 ( List.rev _1 )
# 755 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 108 "parser.mly"
         ( [_1] )
# 762 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 109 "parser.mly"
                           ( _3 :: _1 )
# 770 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 112 "parser.mly"
        ( [] )
# 776 "parser.ml"
               : 'var_decl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'var_decl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'var_decl) in
    Obj.repr(
# 113 "parser.mly"
                          ( _2 :: _1 )
# 784 "parser.ml"
               : 'var_decl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'dtype) in
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 116 "parser.mly"
                            ( VarDecl(_1, _2, _4) )
# 793 "parser.ml"
               : 'var_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 119 "parser.mly"
           ( VoidType )
# 799 "parser.ml"
               : 'dtype))
; (fun __caml_parser_env ->
    Obj.repr(
# 120 "parser.mly"
           ( IntType )
# 805 "parser.ml"
               : 'dtype))
; (fun __caml_parser_env ->
    Obj.repr(
# 121 "parser.mly"
             ( StringType )
# 811 "parser.ml"
               : 'dtype))
; (fun __caml_parser_env ->
    Obj.repr(
# 126 "parser.mly"
                ( ServerConn )
# 817 "parser.ml"
               : 'conn_label))
; (fun __caml_parser_env ->
    Obj.repr(
# 127 "parser.mly"
                ( PortConn )
# 823 "parser.ml"
               : 'conn_label))
; (fun __caml_parser_env ->
    Obj.repr(
# 128 "parser.mly"
                ( UserConn )
# 829 "parser.ml"
               : 'conn_label))
; (fun __caml_parser_env ->
    Obj.repr(
# 129 "parser.mly"
                ( PassConn )
# 835 "parser.ml"
               : 'conn_label))
; (fun __caml_parser_env ->
    Obj.repr(
# 130 "parser.mly"
                ( TypeConn )
# 841 "parser.ml"
               : 'conn_label))
; (fun __caml_parser_env ->
    Obj.repr(
# 131 "parser.mly"
                ( DBConn )
# 847 "parser.ml"
               : 'conn_label))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'conn_label) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 134 "parser.mly"
                                         ( ConnAttr(_1, _3) )
# 855 "parser.ml"
               : 'conn_attribute))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : 'conn_attribute) in
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'conn_attribute) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'conn_attribute) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'conn_attribute) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'conn_attribute) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'conn_attribute) in
    Obj.repr(
# 139 "parser.mly"
                                  ( ConnBlock(_1, _2, _3, _4, _5, _6) )
# 867 "parser.ml"
               : 'conn_block))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 142 "parser.mly"
            ( AttrLabel(_1) )
# 874 "parser.ml"
               : 'attribute_label))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'attribute_label) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'dtype) in
    Obj.repr(
# 145 "parser.mly"
                                     ( Attr(_1, _3) )
# 882 "parser.ml"
               : 'attribute))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'attribute) in
    Obj.repr(
# 148 "parser.mly"
                             ( [_1] )
# 889 "parser.ml"
               : 'attribute_group))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'attribute_group) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'attribute) in
    Obj.repr(
# 149 "parser.mly"
                                ( _2 :: _1 )
# 897 "parser.ml"
               : 'attribute_group))
; (fun __caml_parser_env ->
    Obj.repr(
# 152 "parser.mly"
        ( [] )
# 903 "parser.ml"
               : 'key_decls_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'key_decls_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'key_decls) in
    Obj.repr(
# 153 "parser.mly"
                               ( _2 :: _1 )
# 911 "parser.ml"
               : 'key_decls_list))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'attribute_label) in
    Obj.repr(
# 156 "parser.mly"
                                                  ( PrimaryKey(_3) )
# 918 "parser.ml"
               : 'key_decls))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'attribute_label) in
    Obj.repr(
# 157 "parser.mly"
                                                    ( ForeignKey(_3) )
# 925 "parser.ml"
               : 'key_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 160 "parser.mly"
      ( TableLabel(_1) )
# 932 "parser.ml"
               : 'table_label))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 161 "parser.mly"
               ( TableLabelRel(_1, _3) )
# 940 "parser.ml"
               : 'table_label))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'table_label) in
    Obj.repr(
# 164 "parser.mly"
              ( [_1] )
# 947 "parser.ml"
               : 'table_label_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'table_label_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'table_label) in
    Obj.repr(
# 165 "parser.mly"
                                      ( _3 :: _1 )
# 955 "parser.ml"
               : 'table_label_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'attribute_group) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'key_decls_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fdef_list) in
    Obj.repr(
# 168 "parser.mly"
                                             ( TableBody(_1,_2,_3) )
# 964 "parser.ml"
               : 'table_body))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'table_label_list) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'table_body) in
    Obj.repr(
# 171 "parser.mly"
                                                          ( {
						tbname = _2;
						tbbody = _4
	} )
# 975 "parser.ml"
               : 'table))
; (fun __caml_parser_env ->
    Obj.repr(
# 177 "parser.mly"
         ( [] )
# 981 "parser.ml"
               : 'tables_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'tables_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'table) in
    Obj.repr(
# 178 "parser.mly"
                     ( _2 :: _1 )
# 989 "parser.ml"
               : 'tables_list))
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
