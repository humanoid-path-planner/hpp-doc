# 
#  Copyright 
# 

SUBDIRS = \
	src \
	include \
	unitTesting

hppDocdir = $(libdir)/pkgconfig
hppDoc_DATA = hppDoc.pc

install-data-hook: documentation

documentation:
	cd doc; $(MAKE) install
