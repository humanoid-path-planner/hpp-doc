# 
#  Copyright 
# 


hppDocdir = $(datadir)/doc/hppDoc

EXTRA_DIST = \
	header.html \
	footer.html \
	package.css \
	pictures/footer.jpg \
	figures/archi.png  \
	figures/kppInterfaceWalk.png \
	additionalDoc/package.h 

install:
	mkdir -p $(hppDocdir)
	$(INSTALL_DATA) html/* $(hppDocdir)
	mkdir -p $(hppDocdir)/pictures
	$(INSTALL_DATA) $(srcdir)/pictures/* $(hppDocdir)/pictures

