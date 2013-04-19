LEX = ocamllex
YACC = ocamlyacc
OCAML = ocamlc

OBJS = parser.cmo scanner.cmo ast.cmo generator.cmo

OUTPUTS = coral *.cmo *.cmi *.mli *~ scanner.ml parser.ml parser.output IR.py *.pyc

coral : $(OBJS)
	$(OCAML) -o coral $(OBJS)

parser.ml parser.mli : parser.mly
	$(YACC) -v parser.mly

scanner.ml : scanner.mll
	$(LEX) scanner.mll

%.cmo : %.ml
	$(OCAML) -c $<

%.cmi : %.mli
	$(OCAML) -c $<

.PHONY : clean
clean:
	rm -rf $(OUTPUTS)



ast.cmo:
ast.cmx:
generator.cmo: ast.cmo
generator.cmx: ast.cmx
coral.cmx: scanner.cmx parser.cmx generator.cmx ast.cmx
parser.cmo: ast.cmo parser.cmi
parser.cmx: ast.cmx parser.cmi
scanner.cmo: parser.cmi
scanner.cmx: parser.cmx
parser.cmi: ast.cmo