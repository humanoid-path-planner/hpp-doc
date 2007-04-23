# 
#  Copyright 
# 


hppDocdir = $(datadir)/doc/hppDoc

EXTRA_DIST = \
	header.html \
	footer.html \
	package.css \
	pictures/footer.jpg \
	additionalDoc/package.h 


install:html-doc 
	mkdir -p $(hppDocdir)
	$(INSTALL_DATA) html/* $(hppDocdir)
	mkdir -p $(hppDocdir)/pictures
	$(INSTALL_DATA) $(srcdir)/pictures/* $(hppDocdir)/pictures
	mkdir -p $(datadir)/doc/doxytag
	$(INSTALL_DATA) hppDoc.doxytag $(datadir)/doc/doxytag

html-doc: package.dox
	doxygen $<
