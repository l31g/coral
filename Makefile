SUBDIRS = src
PYTHONBUILD = build dist

all:
	@for i in $(SUBDIRS); do \
	echo "make all in $$i..."; \
	(cd $$i; $(MAKE) $(MFLAGS) all); done

install: backend_clean backend clean
	@for i in $(SUBDIRS); do \
	echo "make all in $$i..."; \
	(cd $$i; $(MAKE) $(MFLAGS) install); done

backend:
	echo "making Backend"
	cd dependencies; tar xvzf *; cd SQLAlchemy-0.8.1; python setup.py install
	python setup.py install

backend_clean:
	rm -rf dependencies/SQLAlchemy-0.8.1
	rm -rf $(PYTHONBUILD)


test: test/test.py
	python test/test.py

clean: backend_clean
	@for i in $(SUBDIRS); do \
	echo "Clearing in $$i..."; \
	(cd $$i; $(MAKE) $(MFLAGS) clean); done
