LEX = ocamllex
YACC = ocamlyacc
OCAML = ocamlc

OBJS = parser.cmo scanner.cmo ast.cmo semantic.cmo generator.cmo coral.cmo

OUTPUTS = *.cmo *.cmi *.mli *~ scanner.ml parser.ml parser.output
BINDIR = ./build

install: all
	cp coralc /usr/local/bin

all: coralc
	chmod a+x coralc

coralc : $(OBJS)
	$(OCAML) -o coralc $(OBJS)
	chmod +x coralc

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
	rm -rf coralc


ast.cmo:
ast.cmx:
generator.cmo: ast.cmo
generator.cmx: ast.cmx
coral.cmo: semantic.cmo scanner.cmo parser.cmi generator.cmo ast.cmo
coral.cmx: semantic.cmx scanner.cmx parser.cmx generator.cmx ast.cmx
parser.cmo: ast.cmo parser.cmi
parser.cmx: ast.cmx parser.cmi
scanner.cmo: parser.cmi
scanner.cmx: parser.cmx
parser.cmi: ast.cmo
