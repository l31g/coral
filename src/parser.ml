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
\024\000\025\000\025\000\026\000\027\000\003\000\003\000\000\000"

let yylen = "\002\000\
\007\000\000\000\002\000\009\000\000\000\002\000\002\000\003\000\
\003\000\005\000\005\000\009\000\001\000\001\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\001\000\004\000\004\000\
\000\000\001\000\000\000\001\000\001\000\003\000\002\000\000\000\
\001\000\001\000\003\000\000\000\002\000\005\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\004\000\
\006\000\001\000\004\000\001\000\002\000\000\000\002\000\005\000\
\005\000\001\000\003\000\003\000\006\000\000\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\072\000\050\000\051\000\052\000\053\000\
\054\000\055\000\000\000\000\000\000\000\000\000\000\000\000\000\
\070\000\000\000\000\000\000\000\056\000\000\000\002\000\000\000\
\071\000\000\000\000\000\000\000\000\000\057\000\048\000\047\000\
\049\000\003\000\000\000\000\000\000\000\000\000\067\000\058\000\
\000\000\060\000\000\000\000\000\000\000\000\000\061\000\000\000\
\000\000\000\000\000\000\000\000\037\000\000\000\000\000\000\000\
\000\000\063\000\069\000\039\000\000\000\000\000\059\000\000\000\
\000\000\044\000\038\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\045\000\065\000\064\000\000\000\005\000\004\000\
\000\000\000\000\000\000\000\000\000\000\013\000\014\000\000\000\
\006\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\007\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\008\000\000\000\000\000\000\000\000\000\
\009\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\028\000\029\000\000\000\000\000\046\000\000\000\000\000\000\000\
\031\000\000\000\032\000\011\000\010\000\000\000\000\000\000\000\
\000\000\000\000\012\000"

let yydgoto = "\002\000\
\004\000\011\000\020\000\027\000\034\000\035\000\051\000\070\000\
\074\000\089\000\090\000\120\000\123\000\052\000\053\000\124\000\
\075\000\012\000\013\000\041\000\042\000\043\000\048\000\058\000\
\029\000\044\000\025\000"

let yysindex = "\007\000\
\222\254\000\000\208\254\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\236\254\040\255\208\254\006\255\015\255\208\254\
\000\000\068\255\208\254\034\255\000\000\208\254\000\000\044\255\
\000\000\208\254\011\255\082\255\094\255\000\000\000\000\000\000\
\000\000\000\000\051\255\067\255\092\255\116\255\000\000\000\000\
\129\255\000\000\092\255\144\255\011\255\011\255\000\000\027\255\
\151\255\115\255\154\255\147\255\000\000\156\255\157\255\159\255\
\011\255\000\000\000\000\000\000\168\255\011\255\000\000\092\255\
\092\255\000\000\000\000\175\255\176\255\011\255\177\255\178\255\
\139\255\029\255\000\000\000\000\000\000\192\255\000\000\000\000\
\181\255\182\255\199\255\096\255\200\255\000\000\000\000\061\255\
\000\000\150\255\096\255\043\255\096\255\096\255\096\255\173\255\
\096\255\096\255\096\255\096\255\096\255\096\255\096\255\096\255\
\000\000\096\255\096\255\096\255\096\255\096\255\096\255\096\255\
\096\255\096\255\196\255\000\000\220\255\244\255\035\000\201\255\
\000\000\035\000\203\255\193\255\204\255\077\255\246\000\246\000\
\077\255\077\255\077\255\243\000\243\000\243\000\243\000\237\000\
\000\000\000\000\089\255\237\000\000\000\072\255\072\255\096\255\
\000\000\096\255\000\000\000\000\000\000\212\255\035\000\096\255\
\221\255\072\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\229\000\168\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\255\000\000\223\255\000\000\000\000\085\255\
\000\000\000\000\000\000\224\255\000\000\000\000\000\000\000\000\
\195\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\058\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\127\255\
\000\000\000\000\000\000\000\000\000\000\000\000\225\255\000\000\
\227\255\227\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\112\255\000\000\
\000\000\030\255\000\000\228\255\000\000\059\000\139\000\159\000\
\079\000\099\000\119\000\165\000\183\000\189\000\207\000\106\255\
\000\000\000\000\012\000\213\000\000\000\000\000\000\000\225\255\
\000\000\000\000\000\000\000\000\000\000\000\000\032\255\237\255\
\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\184\000\000\000\242\255\000\000\000\000\
\173\000\148\255\172\255\155\255\155\000\000\000\192\000\000\000\
\000\000\000\000\001\002\060\000\212\000\000\000\000\000\000\000\
\000\000\000\000\000\000"

let yytablesize = 539
let yytable = "\096\000\
\005\000\006\000\007\000\008\000\009\000\010\000\115\000\001\000\
\117\000\118\000\119\000\062\000\122\000\122\000\126\000\127\000\
\128\000\129\000\130\000\131\000\003\000\132\000\133\000\134\000\
\135\000\136\000\137\000\138\000\139\000\140\000\050\000\054\000\
\062\000\148\000\149\000\014\000\042\000\062\000\043\000\079\000\
\080\000\062\000\150\000\031\000\042\000\155\000\043\000\050\000\
\032\000\015\000\153\000\017\000\033\000\079\000\116\000\073\000\
\062\000\062\000\018\000\119\000\081\000\151\000\082\000\083\000\
\084\000\085\000\098\000\119\000\005\000\005\000\099\000\086\000\
\087\000\088\000\081\000\021\000\082\000\083\000\084\000\085\000\
\023\000\024\000\079\000\055\000\056\000\086\000\087\000\088\000\
\028\000\005\000\036\000\005\000\005\000\005\000\005\000\038\000\
\002\000\111\000\112\000\113\000\005\000\005\000\005\000\081\000\
\037\000\082\000\083\000\084\000\085\000\111\000\112\000\039\000\
\023\000\023\000\086\000\087\000\088\000\002\000\034\000\034\000\
\023\000\045\000\002\000\068\000\069\000\023\000\002\000\030\000\
\030\000\030\000\030\000\030\000\085\000\030\000\030\000\023\000\
\040\000\046\000\086\000\087\000\088\000\030\000\030\000\030\000\
\030\000\030\000\030\000\030\000\030\000\030\000\100\000\101\000\
\102\000\103\000\104\000\049\000\030\000\105\000\059\000\060\000\
\061\000\062\000\064\000\063\000\065\000\106\000\107\000\108\000\
\109\000\110\000\111\000\112\000\113\000\100\000\101\000\102\000\
\103\000\104\000\066\000\114\000\121\000\071\000\072\000\078\000\
\076\000\077\000\093\000\094\000\106\000\107\000\108\000\109\000\
\110\000\111\000\112\000\113\000\100\000\101\000\102\000\103\000\
\104\000\091\000\114\000\141\000\095\000\097\000\068\000\146\000\
\144\000\145\000\147\000\106\000\107\000\108\000\109\000\110\000\
\111\000\112\000\113\000\152\000\100\000\101\000\102\000\103\000\
\104\000\114\000\142\000\154\000\001\000\035\000\036\000\057\000\
\033\000\040\000\041\000\106\000\107\000\108\000\109\000\110\000\
\111\000\112\000\113\000\033\000\100\000\101\000\102\000\103\000\
\104\000\114\000\143\000\092\000\125\000\067\000\047\000\000\000\
\000\000\000\000\000\000\106\000\107\000\108\000\109\000\110\000\
\111\000\112\000\113\000\000\000\021\000\021\000\021\000\021\000\
\021\000\114\000\021\000\021\000\000\000\000\000\000\000\000\000\
\000\000\000\000\021\000\021\000\021\000\021\000\021\000\021\000\
\000\000\000\000\021\000\100\000\101\000\102\000\103\000\104\000\
\000\000\021\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\106\000\107\000\108\000\109\000\110\000\111\000\
\112\000\113\000\000\000\015\000\015\000\015\000\015\000\015\000\
\114\000\015\000\015\000\000\000\000\000\000\000\000\000\000\000\
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
\025\000\025\000\025\000\022\000\000\000\000\000\000\000\000\000\
\022\000\000\000\000\000\000\000\025\000\100\000\101\000\102\000\
\103\000\104\000\022\000\100\000\101\000\102\000\103\000\104\000\
\102\000\103\000\104\000\000\000\106\000\107\000\108\000\109\000\
\000\000\111\000\112\000\113\000\000\000\000\000\000\000\111\000\
\112\000\113\000\111\000\112\000\113\000\016\000\000\000\000\000\
\019\000\000\000\000\000\022\000\000\000\000\000\026\000\000\000\
\000\000\000\000\030\000"

let yycheck = "\084\000\
\049\001\050\001\051\001\052\001\053\001\054\001\091\000\001\000\
\093\000\094\000\095\000\012\001\097\000\098\000\099\000\100\000\
\101\000\102\000\103\000\104\000\055\001\106\000\107\000\108\000\
\109\000\110\000\111\000\112\000\113\000\114\000\045\000\046\000\
\033\001\142\000\143\000\056\001\007\001\038\001\007\001\011\001\
\012\001\042\001\144\000\033\001\015\001\154\000\015\001\062\000\
\038\001\010\001\152\000\046\001\042\001\011\001\012\001\070\000\
\057\001\058\001\044\001\144\000\032\001\146\000\034\001\035\001\
\036\001\037\001\006\001\152\000\011\001\012\001\010\001\043\001\
\044\001\045\001\032\001\008\001\034\001\035\001\036\001\037\001\
\047\001\048\001\011\001\057\001\058\001\043\001\044\001\045\001\
\045\001\032\001\009\001\034\001\035\001\036\001\037\001\045\001\
\012\001\021\001\022\001\023\001\043\001\044\001\045\001\032\001\
\011\001\034\001\035\001\036\001\037\001\021\001\022\001\045\001\
\007\001\008\001\043\001\044\001\045\001\033\001\007\001\008\001\
\015\001\006\001\038\001\064\000\065\000\020\001\042\001\001\001\
\002\001\003\001\004\001\005\001\037\001\007\001\008\001\030\001\
\045\001\009\001\043\001\044\001\045\001\015\001\016\001\017\001\
\018\001\019\001\020\001\021\001\022\001\023\001\001\001\002\001\
\003\001\004\001\005\001\012\001\030\001\008\001\008\001\045\001\
\007\001\015\001\006\001\008\001\006\001\016\001\017\001\018\001\
\019\001\020\001\021\001\022\001\023\001\001\001\002\001\003\001\
\004\001\005\001\011\001\030\001\008\001\007\001\007\001\045\001\
\008\001\008\001\006\001\006\001\016\001\017\001\018\001\019\001\
\020\001\021\001\022\001\023\001\001\001\002\001\003\001\004\001\
\005\001\010\001\030\001\008\001\006\001\006\001\012\001\015\001\
\008\001\007\001\007\001\016\001\017\001\018\001\019\001\020\001\
\021\001\022\001\023\001\008\001\001\001\002\001\003\001\004\001\
\005\001\030\001\007\001\007\001\000\000\007\001\007\001\048\000\
\008\001\007\001\007\001\016\001\017\001\018\001\019\001\020\001\
\021\001\022\001\023\001\007\001\001\001\002\001\003\001\004\001\
\005\001\030\001\007\001\079\000\098\000\062\000\043\000\255\255\
\255\255\255\255\255\255\016\001\017\001\018\001\019\001\020\001\
\021\001\022\001\023\001\255\255\001\001\002\001\003\001\004\001\
\005\001\030\001\007\001\008\001\255\255\255\255\255\255\255\255\
\255\255\255\255\015\001\016\001\017\001\018\001\019\001\020\001\
\255\255\255\255\023\001\001\001\002\001\003\001\004\001\005\001\
\255\255\030\001\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\016\001\017\001\018\001\019\001\020\001\021\001\
\022\001\023\001\255\255\001\001\002\001\003\001\004\001\005\001\
\030\001\007\001\008\001\255\255\255\255\255\255\255\255\255\255\
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
\018\001\019\001\020\001\015\001\255\255\255\255\255\255\255\255\
\020\001\255\255\255\255\255\255\030\001\001\001\002\001\003\001\
\004\001\005\001\030\001\001\001\002\001\003\001\004\001\005\001\
\003\001\004\001\005\001\255\255\016\001\017\001\018\001\019\001\
\255\255\021\001\022\001\023\001\255\255\255\255\255\255\021\001\
\022\001\023\001\021\001\022\001\023\001\013\000\255\255\255\255\
\016\000\255\255\255\255\019\000\255\255\255\255\022\000\255\255\
\255\255\255\255\026\000"

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
# 33 "parser.mly"
                                                                   ( {
							conn = _2;
                            tables = List.rev _5;
							funcs = List.rev _7
		} )
# 452 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 40 "parser.mly"
      ( [] )
# 458 "parser.ml"
               : 'fdef_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'fdef_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdef) in
    Obj.repr(
# 41 "parser.mly"
                  ( _2 :: _1 )
# 466 "parser.ml"
               : 'fdef_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 8 : 'dtype) in
    let _2 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'var_decl_list) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 46 "parser.mly"
          ( {
											return_type = _1;
											fname	= _2;
											formals = _4;
											locals = List.rev _7 ;
											body	= List.rev _8	} )
# 482 "parser.ml"
               : 'fdef))
; (fun __caml_parser_env ->
    Obj.repr(
# 54 "parser.mly"
                    ( [] )
# 488 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 55 "parser.mly"
                       ( _2 :: _1 )
# 496 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 59 "parser.mly"
                 ( Expr (_1) )
# 503 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 60 "parser.mly"
                                ( Block(List.rev _2) )
# 510 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 61 "parser.mly"
                         ( Return(_2) )
# 517 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 63 "parser.mly"
                                ( If(_3, _5) )
# 525 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 64 "parser.mly"
                                  ( While(_3, _5) )
# 533 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 66 "parser.mly"
           ( For(_3, _5, _7, _9))
# 543 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 69 "parser.mly"
                  ( IntLiteral(_1) )
# 550 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 70 "parser.mly"
                     ( StringLiteral(_1) )
# 557 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 71 "parser.mly"
                      ( Assign(_1, _3) )
# 565 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 72 "parser.mly"
                      ( Binop(_1, Add, _3) )
# 573 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 73 "parser.mly"
                       ( Binop(_1, Sub, _3) )
# 581 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 74 "parser.mly"
                       ( Binop(_1, Mult, _3) )
# 589 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 75 "parser.mly"
                        ( Binop(_1, Div, _3) )
# 597 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 76 "parser.mly"
                     ( Binop(_1, Mod, _3) )
# 605 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 77 "parser.mly"
                     ( Binop(_1, Exp, _3) )
# 613 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 78 "parser.mly"
                     ( Binop(_1, Equal, _3) )
# 621 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 79 "parser.mly"
                     ( Binop(_1, Neq, _3) )
# 629 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 80 "parser.mly"
                     ( Binop(_1, Less, _3) )
# 637 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 81 "parser.mly"
                     ( Binop(_1, Leq, _3) )
# 645 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 82 "parser.mly"
                     ( Binop(_1, Greater, _3) )
# 653 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 83 "parser.mly"
                     ( Binop(_1, Geq, _3) )
# 661 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 84 "parser.mly"
                     ( Binop(_1, Or, _3))
# 669 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 85 "parser.mly"
                     ( Binop(_1, And, _3))
# 677 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 86 "parser.mly"
            ( Id(_1) )
# 684 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 87 "parser.mly"
                                    ( Print(_3) )
# 691 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 88 "parser.mly"
                                ( Call (_1, _3) )
# 699 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 91 "parser.mly"
     ( Noexpr )
# 705 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 92 "parser.mly"
           ( _1 )
# 712 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    Obj.repr(
# 95 "parser.mly"
     ( [] )
# 718 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 96 "parser.mly"
               ( List.rev _1 )
# 725 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal) in
    Obj.repr(
# 99 "parser.mly"
            ( [_1] )
# 732 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formal) in
    Obj.repr(
# 100 "parser.mly"
                            ( _3 :: _1 )
# 740 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'dtype) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 103 "parser.mly"
          ( Formal (_1, _2) )
# 748 "parser.ml"
               : 'formal))
; (fun __caml_parser_env ->
    Obj.repr(
# 106 "parser.mly"
     ( [] )
# 754 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 107 "parser.mly"
                 ( List.rev _1 )
# 761 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 110 "parser.mly"
         ( [_1] )
# 768 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 111 "parser.mly"
                           ( _3 :: _1 )
# 776 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 114 "parser.mly"
        ( [] )
# 782 "parser.ml"
               : 'var_decl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'var_decl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'var_decl) in
    Obj.repr(
# 115 "parser.mly"
                          ( _2 :: _1 )
# 790 "parser.ml"
               : 'var_decl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'dtype) in
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 118 "parser.mly"
                            ( VarDecl(_1, _2, _4) )
# 799 "parser.ml"
               : 'var_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 121 "parser.mly"
           ( VoidType )
# 805 "parser.ml"
               : 'dtype))
; (fun __caml_parser_env ->
    Obj.repr(
# 122 "parser.mly"
           ( IntType )
# 811 "parser.ml"
               : 'dtype))
; (fun __caml_parser_env ->
    Obj.repr(
# 123 "parser.mly"
             ( StringType )
# 817 "parser.ml"
               : 'dtype))
; (fun __caml_parser_env ->
    Obj.repr(
# 128 "parser.mly"
                ( ServerConn )
# 823 "parser.ml"
               : 'conn_label))
; (fun __caml_parser_env ->
    Obj.repr(
# 129 "parser.mly"
                ( PortConn )
# 829 "parser.ml"
               : 'conn_label))
; (fun __caml_parser_env ->
    Obj.repr(
# 130 "parser.mly"
                ( UserConn )
# 835 "parser.ml"
               : 'conn_label))
; (fun __caml_parser_env ->
    Obj.repr(
# 131 "parser.mly"
                ( PassConn )
# 841 "parser.ml"
               : 'conn_label))
; (fun __caml_parser_env ->
    Obj.repr(
# 132 "parser.mly"
                ( TypeConn )
# 847 "parser.ml"
               : 'conn_label))
; (fun __caml_parser_env ->
    Obj.repr(
# 133 "parser.mly"
                ( DBConn )
# 853 "parser.ml"
               : 'conn_label))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'conn_label) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 136 "parser.mly"
                                         ( ConnAttr(_1, _3) )
# 861 "parser.ml"
               : 'conn_attribute))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : 'conn_attribute) in
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'conn_attribute) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'conn_attribute) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'conn_attribute) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'conn_attribute) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'conn_attribute) in
    Obj.repr(
# 141 "parser.mly"
                                  ( ConnBlock(_1, _2, _3, _4, _5, _6) )
# 873 "parser.ml"
               : 'conn_block))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 144 "parser.mly"
            ( AttrLabel(_1) )
# 880 "parser.ml"
               : 'attribute_label))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'attribute_label) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'dtype) in
    Obj.repr(
# 147 "parser.mly"
                                     ( Attr(_1, _3) )
# 888 "parser.ml"
               : 'attribute))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'attribute) in
    Obj.repr(
# 150 "parser.mly"
                             ( [_1] )
# 895 "parser.ml"
               : 'attribute_group))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'attribute_group) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'attribute) in
    Obj.repr(
# 151 "parser.mly"
                                ( _2 :: _1 )
# 903 "parser.ml"
               : 'attribute_group))
; (fun __caml_parser_env ->
    Obj.repr(
# 154 "parser.mly"
        ( [] )
# 909 "parser.ml"
               : 'key_decls_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'key_decls_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'key_decls) in
    Obj.repr(
# 155 "parser.mly"
                               ( _2 :: _1 )
# 917 "parser.ml"
               : 'key_decls_list))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'attribute_label) in
    Obj.repr(
# 158 "parser.mly"
                                                  ( PrimaryKey(_3) )
# 924 "parser.ml"
               : 'key_decls))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'attribute_label) in
    Obj.repr(
# 159 "parser.mly"
                                                    ( ForeignKey(_3) )
# 931 "parser.ml"
               : 'key_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 162 "parser.mly"
      ( TableLabel(_1) )
# 938 "parser.ml"
               : 'table_label))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 163 "parser.mly"
               ( TableLabelRel(_1, _3) )
# 946 "parser.ml"
               : 'table_label))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'attribute_group) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'key_decls_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fdef_list) in
    Obj.repr(
# 166 "parser.mly"
                                             ( TableBody(_1,_2,_3) )
# 955 "parser.ml"
               : 'table_body))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'table_label) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'table_body) in
    Obj.repr(
# 169 "parser.mly"
                                                     ( {
						tbname = _2;
						tbbody = _4
	} )
# 966 "parser.ml"
               : 'table))
; (fun __caml_parser_env ->
    Obj.repr(
# 175 "parser.mly"
         ( [] )
# 972 "parser.ml"
               : 'tables_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'tables_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'table) in
    Obj.repr(
# 176 "parser.mly"
                     ( _2 :: _1 )
# 980 "parser.ml"
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
