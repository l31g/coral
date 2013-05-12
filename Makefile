SUBDIRS = src
PYTHONBUILD = build dist

all:
	@for i in $(SUBDIRS); do \
	echo "make all in $$i..."; \
	(cd $$i; $(MAKE) $(MFLAGS) all); done

install: clean
	@for i in $(SUBDIRS); do \
	echo "make all in $$i..."; \
	(cd $$i; $(MAKE) $(MFLAGS) install); done

backend:
	echo "making Backend"
	python setup.py install

backend_clean:
	rm -rf $(PYTHONBUILD)

test:
	@for i in $(SUBDIRS); do \
	echo "make test in $$i..."; \
	(cd $$i; $(MAKE) $(MFLAGS) test); done

clean: backend_clean
	@for i in $(SUBDIRS); do \
	echo "Clearing in $$i..."; \
	(cd $$i; $(MAKE) $(MFLAGS) clean); done
