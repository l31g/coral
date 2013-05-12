SUBDIRS = Comments Error File Functions GlobalVars HelloWorld IfElse Math Return Tables Type_Checking Variables constructs TableFunction While

clean:
	@for i in $(SUBDIRS); do \
	echo "clean all in $$i..."; \
	(cd $$i; rm -rf *.err *.clx *.out); done