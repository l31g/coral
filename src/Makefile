LEX = ocamllex
YACC = ocamlyacc
OCAML = ocamlc

OBJS = parser.cmo scanner.cmo ast.cmo generator.cmo coral.cmo

OUTPUTS = *.cmo *.cmi *.mli *~ scanner.ml parser.ml parser.output
BINDIR = ./build

all: coralc

coralc : $(OBJS)
	mkdir $(BINDIR)
	$(OCAML) -o coralc $(OBJS)
	mv coralc $(BINDIR)

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
	rm -rf $(BINDIR)



ast.cmo:
ast.cmx:
generator.cmo: ast.cmo
generator.cmx: ast.cmx
coral.cmo: scanner.cmo parser.cmi generator.cmo ast.cmo
coral.cmx: scanner.cmx parser.cmx generator.cmx ast.cmx
parser.cmo: ast.cmo parser.cmi
parser.cmx: ast.cmx parser.cmi
scanner.cmo: parser.cmi
scanner.cmx: parser.cmx
parser.cmi: ast.cmo