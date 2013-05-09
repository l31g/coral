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
\010\000\010\000\010\000\010\000\010\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\011\000\012\000\
\012\000\007\000\007\000\014\000\014\000\015\000\013\000\013\000\
\016\000\016\000\008\000\008\000\017\000\006\000\006\000\006\000\
\006\000\018\000\018\000\018\000\018\000\018\000\018\000\019\000\
\002\000\020\000\021\000\022\000\022\000\023\000\023\000\024\000\
\024\000\025\000\025\000\026\000\027\000\003\000\003\000\000\000"

let yylen = "\002\000\
\007\000\000\000\002\000\009\000\000\000\002\000\002\000\003\000\
\003\000\005\000\007\000\005\000\009\000\001\000\001\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\001\000\002\000\002\000\004\000\004\000\000\000\
\001\000\000\000\001\000\001\000\003\000\002\000\000\000\001\000\
\001\000\003\000\000\000\002\000\005\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\004\000\
\006\000\001\000\004\000\001\000\002\000\000\000\002\000\005\000\
\005\000\001\000\003\000\003\000\006\000\000\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\080\000\058\000\059\000\060\000\061\000\
\062\000\063\000\000\000\000\000\000\000\000\000\000\000\000\000\
\078\000\000\000\000\000\000\000\064\000\000\000\002\000\000\000\
\079\000\000\000\000\000\000\000\000\000\065\000\055\000\054\000\
\056\000\057\000\003\000\000\000\000\000\000\000\000\000\075\000\
\066\000\000\000\068\000\000\000\000\000\000\000\000\000\069\000\
\000\000\000\000\000\000\000\000\000\000\044\000\000\000\000\000\
\000\000\000\000\071\000\077\000\046\000\000\000\000\000\067\000\
\000\000\000\000\051\000\045\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\052\000\073\000\072\000\000\000\005\000\
\004\000\000\000\000\000\000\000\000\000\000\000\014\000\015\000\
\000\000\006\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\036\000\037\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\007\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\008\000\000\000\000\000\000\000\000\000\009\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\033\000\034\000\000\000\000\000\053\000\
\000\000\000\000\000\000\038\000\000\000\039\000\012\000\010\000\
\000\000\000\000\000\000\000\000\011\000\000\000\000\000\013\000"

let yydgoto = "\002\000\
\004\000\011\000\020\000\027\000\035\000\036\000\052\000\071\000\
\075\000\090\000\091\000\127\000\130\000\053\000\054\000\131\000\
\076\000\012\000\013\000\042\000\043\000\044\000\049\000\059\000\
\029\000\045\000\025\000"

let yysindex = "\005\000\
\209\254\000\000\134\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\227\254\044\255\134\255\014\255\042\255\134\255\
\000\000\085\255\134\255\210\254\000\000\134\255\000\000\050\255\
\000\000\134\255\085\001\091\255\098\255\000\000\000\000\000\000\
\000\000\000\000\000\000\057\255\065\255\066\255\115\255\000\000\
\000\000\113\255\000\000\066\255\111\255\085\001\085\001\000\000\
\203\254\129\255\094\255\133\255\126\255\000\000\152\255\136\255\
\155\255\085\001\000\000\000\000\000\000\169\255\085\001\000\000\
\066\255\066\255\000\000\000\000\159\255\182\255\085\001\154\255\
\195\255\161\255\039\255\000\000\000\000\000\000\198\255\000\000\
\000\000\201\255\203\255\204\255\120\255\205\255\000\000\000\000\
\063\001\000\000\151\255\120\255\053\255\120\255\120\255\120\255\
\174\255\120\255\120\255\120\255\000\000\000\000\120\255\120\255\
\120\255\120\255\120\255\120\255\120\255\120\255\120\255\000\000\
\120\255\120\255\120\255\120\255\120\255\120\255\120\255\120\255\
\120\255\197\255\000\000\221\255\245\255\228\000\213\255\000\000\
\228\000\222\255\215\255\224\255\023\255\023\255\023\255\023\255\
\023\255\036\255\036\255\023\255\023\255\023\255\108\001\108\001\
\108\001\108\001\098\001\000\000\000\000\023\255\098\001\000\000\
\083\255\083\255\120\255\000\000\120\255\000\000\000\000\000\000\
\225\255\228\000\083\255\120\255\000\000\228\255\083\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\212\000\223\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\004\255\000\000\229\255\000\000\000\000\
\005\255\000\000\000\000\000\000\238\255\000\000\000\000\000\000\
\000\000\220\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\069\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\128\255\000\000\000\000\000\000\000\000\000\000\000\000\246\255\
\000\000\248\255\248\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\041\255\000\000\000\000\
\062\255\000\000\249\255\000\000\013\000\037\000\061\000\085\000\
\109\000\252\000\016\001\133\000\157\000\181\000\022\001\040\001\
\046\001\064\001\048\255\000\000\000\000\205\000\078\001\000\000\
\000\000\000\000\246\255\000\000\000\000\000\000\000\000\000\000\
\000\000\092\255\000\000\250\255\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\204\000\000\000\045\000\000\000\000\000\
\178\000\227\255\171\255\104\255\160\000\000\000\197\000\000\000\
\000\000\000\000\119\002\001\000\225\000\000\000\000\000\000\000\
\000\000\000\000\000\000"

let yytablesize = 657
let yytable = "\097\000\
\023\000\024\000\161\000\056\000\057\000\001\000\122\000\003\000\
\124\000\125\000\126\000\166\000\129\000\129\000\133\000\070\000\
\002\000\134\000\135\000\136\000\137\000\138\000\139\000\140\000\
\141\000\142\000\014\000\143\000\144\000\145\000\146\000\147\000\
\148\000\149\000\150\000\151\000\070\000\002\000\109\000\110\000\
\111\000\070\000\002\000\118\000\119\000\070\000\002\000\041\000\
\041\000\080\000\081\000\070\000\002\000\015\000\028\000\028\000\
\118\000\119\000\120\000\017\000\070\000\070\000\028\000\080\000\
\123\000\069\000\070\000\028\000\049\000\126\000\082\000\162\000\
\083\000\084\000\085\000\086\000\049\000\028\000\126\000\005\000\
\005\000\087\000\088\000\089\000\082\000\018\000\083\000\084\000\
\085\000\086\000\051\000\055\000\021\000\080\000\028\000\087\000\
\088\000\089\000\050\000\037\000\005\000\039\000\005\000\005\000\
\005\000\005\000\050\000\051\000\038\000\040\000\041\000\005\000\
\005\000\005\000\082\000\074\000\083\000\084\000\085\000\086\000\
\046\000\047\000\050\000\159\000\160\000\087\000\088\000\089\000\
\035\000\035\000\035\000\035\000\035\000\165\000\035\000\035\000\
\060\000\168\000\061\000\062\000\063\000\065\000\035\000\035\000\
\035\000\035\000\035\000\035\000\035\000\035\000\035\000\107\000\
\108\000\109\000\110\000\111\000\086\000\035\000\112\000\064\000\
\066\000\077\000\087\000\088\000\089\000\072\000\113\000\114\000\
\115\000\116\000\117\000\118\000\119\000\120\000\107\000\108\000\
\109\000\110\000\111\000\067\000\121\000\128\000\005\000\006\000\
\007\000\008\000\009\000\010\000\073\000\113\000\114\000\115\000\
\116\000\117\000\118\000\119\000\120\000\107\000\108\000\109\000\
\110\000\111\000\078\000\121\000\152\000\079\000\094\000\092\000\
\095\000\096\000\098\000\001\000\113\000\114\000\115\000\116\000\
\117\000\118\000\119\000\120\000\155\000\107\000\108\000\109\000\
\110\000\111\000\121\000\153\000\156\000\157\000\158\000\076\000\
\164\000\074\000\167\000\042\000\113\000\114\000\115\000\116\000\
\117\000\118\000\119\000\120\000\043\000\107\000\108\000\109\000\
\110\000\111\000\121\000\154\000\058\000\040\000\047\000\048\000\
\040\000\093\000\132\000\068\000\113\000\114\000\115\000\116\000\
\117\000\118\000\119\000\120\000\048\000\016\000\016\000\016\000\
\016\000\016\000\121\000\016\000\016\000\000\000\000\000\000\000\
\000\000\000\000\000\000\016\000\016\000\016\000\016\000\016\000\
\016\000\000\000\000\000\016\000\000\000\017\000\017\000\017\000\
\017\000\017\000\016\000\017\000\017\000\000\000\000\000\000\000\
\000\000\000\000\000\000\017\000\017\000\017\000\017\000\017\000\
\017\000\000\000\000\000\017\000\000\000\018\000\018\000\018\000\
\018\000\018\000\017\000\018\000\018\000\000\000\000\000\000\000\
\000\000\000\000\000\000\018\000\018\000\018\000\018\000\018\000\
\018\000\000\000\000\000\018\000\000\000\019\000\019\000\019\000\
\019\000\019\000\018\000\019\000\019\000\000\000\000\000\000\000\
\000\000\000\000\000\000\019\000\019\000\019\000\019\000\019\000\
\019\000\000\000\000\000\019\000\000\000\020\000\020\000\020\000\
\020\000\020\000\019\000\020\000\020\000\000\000\000\000\000\000\
\000\000\000\000\000\000\020\000\020\000\020\000\020\000\020\000\
\020\000\000\000\000\000\020\000\000\000\023\000\023\000\023\000\
\023\000\023\000\020\000\023\000\023\000\000\000\000\000\000\000\
\000\000\000\000\000\000\023\000\023\000\023\000\023\000\023\000\
\023\000\000\000\000\000\023\000\000\000\025\000\025\000\025\000\
\025\000\025\000\023\000\025\000\025\000\000\000\000\000\000\000\
\000\000\000\000\000\000\025\000\025\000\025\000\025\000\025\000\
\025\000\000\000\000\000\025\000\000\000\024\000\024\000\024\000\
\024\000\024\000\025\000\024\000\024\000\000\000\000\000\000\000\
\000\000\000\000\000\000\024\000\024\000\024\000\024\000\024\000\
\024\000\000\000\000\000\024\000\000\000\026\000\026\000\026\000\
\026\000\026\000\024\000\026\000\026\000\000\000\000\000\000\000\
\000\000\000\000\000\000\026\000\026\000\026\000\026\000\026\000\
\026\000\000\000\000\000\026\000\107\000\108\000\109\000\110\000\
\111\000\000\000\026\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\113\000\114\000\115\000\116\000\117\000\
\118\000\119\000\120\000\000\000\021\000\021\000\000\000\000\000\
\000\000\121\000\021\000\021\000\000\000\000\000\000\000\000\000\
\000\000\000\000\021\000\021\000\021\000\021\000\021\000\021\000\
\022\000\022\000\000\000\000\000\000\000\000\000\022\000\022\000\
\000\000\021\000\000\000\000\000\031\000\031\000\022\000\022\000\
\022\000\022\000\022\000\022\000\031\000\031\000\031\000\031\000\
\031\000\031\000\000\000\000\000\000\000\022\000\029\000\029\000\
\000\000\000\000\000\000\031\000\032\000\032\000\029\000\029\000\
\029\000\029\000\029\000\029\000\032\000\032\000\032\000\032\000\
\032\000\032\000\000\000\000\000\099\000\029\000\030\000\030\000\
\100\000\000\000\000\000\032\000\000\000\000\000\030\000\030\000\
\030\000\030\000\030\000\030\000\027\000\027\000\101\000\102\000\
\103\000\104\000\105\000\106\000\027\000\030\000\000\000\000\000\
\000\000\027\000\107\000\108\000\109\000\110\000\111\000\000\000\
\000\000\000\000\000\000\027\000\107\000\108\000\109\000\110\000\
\111\000\113\000\114\000\115\000\116\000\031\000\118\000\119\000\
\120\000\000\000\032\000\000\000\000\000\000\000\033\000\000\000\
\118\000\119\000\120\000\016\000\034\000\000\000\019\000\000\000\
\000\000\022\000\000\000\000\000\026\000\000\000\000\000\000\000\
\030\000"

let yycheck = "\085\000\
\047\001\048\001\155\000\057\001\058\001\001\000\092\000\055\001\
\094\000\095\000\096\000\164\000\098\000\099\000\100\000\012\001\
\012\001\103\000\104\000\105\000\106\000\107\000\108\000\109\000\
\110\000\111\000\056\001\113\000\114\000\115\000\116\000\117\000\
\118\000\119\000\120\000\121\000\033\001\033\001\003\001\004\001\
\005\001\038\001\038\001\021\001\022\001\042\001\042\001\007\001\
\008\001\011\001\012\001\048\001\048\001\010\001\007\001\008\001\
\021\001\022\001\023\001\046\001\057\001\058\001\015\001\011\001\
\012\001\065\000\066\000\020\001\007\001\155\000\032\001\157\000\
\034\001\035\001\036\001\037\001\015\001\030\001\164\000\011\001\
\012\001\043\001\044\001\045\001\032\001\044\001\034\001\035\001\
\036\001\037\001\046\000\047\000\008\001\011\001\045\001\043\001\
\044\001\045\001\007\001\009\001\032\001\045\001\034\001\035\001\
\036\001\037\001\015\001\063\000\011\001\045\001\045\001\043\001\
\044\001\045\001\032\001\071\000\034\001\035\001\036\001\037\001\
\006\001\009\001\012\001\153\000\154\000\043\001\044\001\045\001\
\001\001\002\001\003\001\004\001\005\001\163\000\007\001\008\001\
\008\001\167\000\045\001\007\001\015\001\006\001\015\001\016\001\
\017\001\018\001\019\001\020\001\021\001\022\001\023\001\001\001\
\002\001\003\001\004\001\005\001\037\001\030\001\008\001\008\001\
\006\001\008\001\043\001\044\001\045\001\007\001\016\001\017\001\
\018\001\019\001\020\001\021\001\022\001\023\001\001\001\002\001\
\003\001\004\001\005\001\011\001\030\001\008\001\049\001\050\001\
\051\001\052\001\053\001\054\001\007\001\016\001\017\001\018\001\
\019\001\020\001\021\001\022\001\023\001\001\001\002\001\003\001\
\004\001\005\001\008\001\030\001\008\001\045\001\006\001\010\001\
\006\001\006\001\006\001\000\000\016\001\017\001\018\001\019\001\
\020\001\021\001\022\001\023\001\008\001\001\001\002\001\003\001\
\004\001\005\001\030\001\007\001\007\001\015\001\007\001\012\001\
\008\001\011\001\007\001\007\001\016\001\017\001\018\001\019\001\
\020\001\021\001\022\001\023\001\007\001\001\001\002\001\003\001\
\004\001\005\001\030\001\007\001\049\000\008\001\007\001\007\001\
\007\001\080\000\099\000\063\000\016\001\017\001\018\001\019\001\
\020\001\021\001\022\001\023\001\044\000\001\001\002\001\003\001\
\004\001\005\001\030\001\007\001\008\001\255\255\255\255\255\255\
\255\255\255\255\255\255\015\001\016\001\017\001\018\001\019\001\
\020\001\255\255\255\255\023\001\255\255\001\001\002\001\003\001\
\004\001\005\001\030\001\007\001\008\001\255\255\255\255\255\255\
\255\255\255\255\255\255\015\001\016\001\017\001\018\001\019\001\
\020\001\255\255\255\255\023\001\255\255\001\001\002\001\003\001\
\004\001\005\001\030\001\007\001\008\001\255\255\255\255\255\255\
\255\255\255\255\255\255\015\001\016\001\017\001\018\001\019\001\
\020\001\255\255\255\255\023\001\255\255\001\001\002\001\003\001\
\004\001\005\001\030\001\007\001\008\001\255\255\255\255\255\255\
\255\255\255\255\255\255\015\001\016\001\017\001\018\001\019\001\
\020\001\255\255\255\255\023\001\255\255\001\001\002\001\003\001\
\004\001\005\001\030\001\007\001\008\001\255\255\255\255\255\255\
\255\255\255\255\255\255\015\001\016\001\017\001\018\001\019\001\
\020\001\255\255\255\255\023\001\255\255\001\001\002\001\003\001\
\004\001\005\001\030\001\007\001\008\001\255\255\255\255\255\255\
\255\255\255\255\255\255\015\001\016\001\017\001\018\001\019\001\
\020\001\255\255\255\255\023\001\255\255\001\001\002\001\003\001\
\004\001\005\001\030\001\007\001\008\001\255\255\255\255\255\255\
\255\255\255\255\255\255\015\001\016\001\017\001\018\001\019\001\
\020\001\255\255\255\255\023\001\255\255\001\001\002\001\003\001\
\004\001\005\001\030\001\007\001\008\001\255\255\255\255\255\255\
\255\255\255\255\255\255\015\001\016\001\017\001\018\001\019\001\
\020\001\255\255\255\255\023\001\255\255\001\001\002\001\003\001\
\004\001\005\001\030\001\007\001\008\001\255\255\255\255\255\255\
\255\255\255\255\255\255\015\001\016\001\017\001\018\001\019\001\
\020\001\255\255\255\255\023\001\001\001\002\001\003\001\004\001\
\005\001\255\255\030\001\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\016\001\017\001\018\001\019\001\020\001\
\021\001\022\001\023\001\255\255\001\001\002\001\255\255\255\255\
\255\255\030\001\007\001\008\001\255\255\255\255\255\255\255\255\
\255\255\255\255\015\001\016\001\017\001\018\001\019\001\020\001\
\001\001\002\001\255\255\255\255\255\255\255\255\007\001\008\001\
\255\255\030\001\255\255\255\255\007\001\008\001\015\001\016\001\
\017\001\018\001\019\001\020\001\015\001\016\001\017\001\018\001\
\019\001\020\001\255\255\255\255\255\255\030\001\007\001\008\001\
\255\255\255\255\255\255\030\001\007\001\008\001\015\001\016\001\
\017\001\018\001\019\001\020\001\015\001\016\001\017\001\018\001\
\019\001\020\001\255\255\255\255\006\001\030\001\007\001\008\001\
\010\001\255\255\255\255\030\001\255\255\255\255\015\001\016\001\
\017\001\018\001\019\001\020\001\007\001\008\001\024\001\025\001\
\026\001\027\001\028\001\029\001\015\001\030\001\255\255\255\255\
\255\255\020\001\001\001\002\001\003\001\004\001\005\001\255\255\
\255\255\255\255\255\255\030\001\001\001\002\001\003\001\004\001\
\005\001\016\001\017\001\018\001\019\001\033\001\021\001\022\001\
\023\001\255\255\038\001\255\255\255\255\255\255\042\001\255\255\
\021\001\022\001\023\001\013\000\048\001\255\255\016\000\255\255\
\255\255\019\000\255\255\255\255\022\000\255\255\255\255\255\255\
\026\000"

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
# 34 "parser.mly"
                                                                   ( {
							conn = _2;
                            tables = List.rev _5;
							funcs = List.rev _7
		} )
# 487 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 41 "parser.mly"
      ( [] )
# 493 "parser.ml"
               : 'fdef_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'fdef_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdef) in
    Obj.repr(
# 42 "parser.mly"
                  ( _2 :: _1 )
# 501 "parser.ml"
               : 'fdef_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 8 : 'dtype) in
    let _2 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'var_decl_list) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 47 "parser.mly"
          ( {
											return_type = _1;
											fname	= _2;
											formals = _4;
											locals = List.rev _7 ;
											body	= List.rev _8	} )
# 517 "parser.ml"
               : 'fdef))
; (fun __caml_parser_env ->
    Obj.repr(
# 55 "parser.mly"
                    ( [] )
# 523 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 56 "parser.mly"
                       ( _2 :: _1 )
# 531 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 60 "parser.mly"
                 ( Expr (_1) )
# 538 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 61 "parser.mly"
                                ( Block(List.rev _2) )
# 545 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 62 "parser.mly"
                         ( Return(_2) )
# 552 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 63 "parser.mly"
                                            ( If(_3, _5, Nostmt))
# 560 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 64 "parser.mly"
                                           ( If(_3, _5, _7) )
# 569 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 65 "parser.mly"
                                     ( While(_3, _5) )
# 577 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 67 "parser.mly"
             ( For(_3, _5, _7, _9))
# 587 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 70 "parser.mly"
                  ( IntLiteral(_1) )
# 594 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 71 "parser.mly"
                     ( StringLiteral(_1) )
# 601 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 72 "parser.mly"
                      ( Assign(_1, Eql, _3) )
# 609 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 73 "parser.mly"
                     ( Assign(_1, Ple, _3) )
# 617 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 74 "parser.mly"
                     ( Assign(_1, Mie, _3) )
# 625 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 75 "parser.mly"
                     ( Assign(_1, Mue, _3) )
# 633 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 76 "parser.mly"
                     ( Assign(_1, Dve, _3) )
# 641 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 77 "parser.mly"
                      ( Binop(_1, Add, _3) )
# 649 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 78 "parser.mly"
                       ( Binop(_1, Sub, _3) )
# 657 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 79 "parser.mly"
                       ( Binop(_1, Mult, _3) )
# 665 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 80 "parser.mly"
                        ( Binop(_1, Div, _3) )
# 673 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 81 "parser.mly"
                     ( Binop(_1, Mod, _3) )
# 681 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 82 "parser.mly"
                     ( Binop(_1, Exp, _3) )
# 689 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 83 "parser.mly"
                     ( Binop(_1, Equal, _3) )
# 697 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 84 "parser.mly"
                     ( Binop(_1, Neq, _3) )
# 705 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 85 "parser.mly"
                     ( Binop(_1, Less, _3) )
# 713 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 86 "parser.mly"
                     ( Binop(_1, Leq, _3) )
# 721 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 87 "parser.mly"
                     ( Binop(_1, Greater, _3) )
# 729 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 88 "parser.mly"
                     ( Binop(_1, Geq, _3) )
# 737 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 89 "parser.mly"
                     ( Binop(_1, Or, _3))
# 745 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 90 "parser.mly"
                     ( Binop(_1, And, _3))
# 753 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 91 "parser.mly"
            ( Id(_1) )
# 760 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 92 "parser.mly"
                 ( Unop(_1, Incr) )
# 767 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 93 "parser.mly"
                 ( Unop(_1, Decr) )
# 774 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 94 "parser.mly"
                                    ( Print(_3) )
# 781 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 95 "parser.mly"
                                ( Call (_1, _3) )
# 789 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 98 "parser.mly"
     ( Noexpr )
# 795 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 99 "parser.mly"
           ( _1 )
# 802 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    Obj.repr(
# 102 "parser.mly"
     ( [] )
# 808 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 103 "parser.mly"
               ( List.rev _1 )
# 815 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal) in
    Obj.repr(
# 106 "parser.mly"
            ( [_1] )
# 822 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formal) in
    Obj.repr(
# 107 "parser.mly"
                            ( _3 :: _1 )
# 830 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'dtype) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 110 "parser.mly"
          ( Formal (_1, _2) )
# 838 "parser.ml"
               : 'formal))
; (fun __caml_parser_env ->
    Obj.repr(
# 113 "parser.mly"
     ( [] )
# 844 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 114 "parser.mly"
                 ( List.rev _1 )
# 851 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 117 "parser.mly"
         ( [_1] )
# 858 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 118 "parser.mly"
                           ( _3 :: _1 )
# 866 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 121 "parser.mly"
        ( [] )
# 872 "parser.ml"
               : 'var_decl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'var_decl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'var_decl) in
    Obj.repr(
# 122 "parser.mly"
                          ( _2 :: _1 )
# 880 "parser.ml"
               : 'var_decl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'dtype) in
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 125 "parser.mly"
                            ( VarDecl(_1, _2, _4) )
# 889 "parser.ml"
               : 'var_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 128 "parser.mly"
           ( VoidType )
# 895 "parser.ml"
               : 'dtype))
; (fun __caml_parser_env ->
    Obj.repr(
# 129 "parser.mly"
           ( IntType )
# 901 "parser.ml"
               : 'dtype))
; (fun __caml_parser_env ->
    Obj.repr(
# 130 "parser.mly"
             ( StringType )
# 907 "parser.ml"
               : 'dtype))
; (fun __caml_parser_env ->
    Obj.repr(
# 131 "parser.mly"
            ( TableType )
# 913 "parser.ml"
               : 'dtype))
; (fun __caml_parser_env ->
    Obj.repr(
# 136 "parser.mly"
                ( ServerConn )
# 919 "parser.ml"
               : 'conn_label))
; (fun __caml_parser_env ->
    Obj.repr(
# 137 "parser.mly"
                ( PortConn )
# 925 "parser.ml"
               : 'conn_label))
; (fun __caml_parser_env ->
    Obj.repr(
# 138 "parser.mly"
                ( UserConn )
# 931 "parser.ml"
               : 'conn_label))
; (fun __caml_parser_env ->
    Obj.repr(
# 139 "parser.mly"
                ( PassConn )
# 937 "parser.ml"
               : 'conn_label))
; (fun __caml_parser_env ->
    Obj.repr(
# 140 "parser.mly"
                ( TypeConn )
# 943 "parser.ml"
               : 'conn_label))
; (fun __caml_parser_env ->
    Obj.repr(
# 141 "parser.mly"
                ( DBConn )
# 949 "parser.ml"
               : 'conn_label))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'conn_label) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 144 "parser.mly"
                                         ( ConnAttr(_1, _3) )
# 957 "parser.ml"
               : 'conn_attribute))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : 'conn_attribute) in
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'conn_attribute) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'conn_attribute) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'conn_attribute) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'conn_attribute) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'conn_attribute) in
    Obj.repr(
# 149 "parser.mly"
                                  ( ConnBlock(_1, _2, _3, _4, _5, _6) )
# 969 "parser.ml"
               : 'conn_block))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 152 "parser.mly"
            ( AttrLabel(_1) )
# 976 "parser.ml"
               : 'attribute_label))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'attribute_label) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'dtype) in
    Obj.repr(
# 155 "parser.mly"
                                     ( Attr(_1, _3) )
# 984 "parser.ml"
               : 'attribute))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'attribute) in
    Obj.repr(
# 158 "parser.mly"
                             ( [_1] )
# 991 "parser.ml"
               : 'attribute_group))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'attribute_group) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'attribute) in
    Obj.repr(
# 159 "parser.mly"
                                ( _2 :: _1 )
# 999 "parser.ml"
               : 'attribute_group))
; (fun __caml_parser_env ->
    Obj.repr(
# 162 "parser.mly"
        ( [] )
# 1005 "parser.ml"
               : 'key_decls_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'key_decls_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'key_decls) in
    Obj.repr(
# 163 "parser.mly"
                               ( _2 :: _1 )
# 1013 "parser.ml"
               : 'key_decls_list))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'attribute_label) in
    Obj.repr(
# 166 "parser.mly"
                                                  ( PrimaryKey(_3) )
# 1020 "parser.ml"
               : 'key_decls))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'attribute_label) in
    Obj.repr(
# 167 "parser.mly"
                                                    ( ForeignKey(_3) )
# 1027 "parser.ml"
               : 'key_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 170 "parser.mly"
      ( TableLabel(_1) )
# 1034 "parser.ml"
               : 'table_label))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 171 "parser.mly"
               ( TableLabelRel(_1, _3) )
# 1042 "parser.ml"
               : 'table_label))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'attribute_group) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'key_decls_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'fdef_list) in
    Obj.repr(
# 174 "parser.mly"
                                             ( TableBody(_1,_2,_3) )
# 1051 "parser.ml"
               : 'table_body))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'table_label) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'table_body) in
    Obj.repr(
# 177 "parser.mly"
                                                     ( {
						tbname = _2;
						tbbody = _4
	} )
# 1062 "parser.ml"
               : 'table))
; (fun __caml_parser_env ->
    Obj.repr(
# 183 "parser.mly"
         ( [] )
# 1068 "parser.ml"
               : 'tables_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'tables_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'table) in
    Obj.repr(
# 184 "parser.mly"
                     ( _2 :: _1 )
# 1076 "parser.ml"
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
