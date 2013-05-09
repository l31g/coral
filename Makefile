
SUBDIRS = src

all:
	@for i in $(SUBDIRS); do \
	echo "make all in $$i..."; \
	(cd $$i; $(MAKE) $(MFLAGS) all); done

test:
	@for i in $(SUBDIRS); do \
	echo "make test in $$i..."; \
	(cd $$i; $(MAKE) $(MFLAGS) test); done

clean:
	@for i in $(SUBDIRS); do \
	echo "Clearing in $$i..."; \
	(cd $$i; $(MAKE) $(MFLAGS) clean); done
