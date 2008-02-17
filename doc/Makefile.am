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
	pictures/ftv2blank.png \
	pictures/ftv2doc.png \
	pictures/ftv2folderclosed.png \
	pictures/ftv2folderopen.png \
	pictures/ftv2lastnode.png \
	pictures/ftv2link.png \
	pictures/ftv2mlastnode.png \
	pictures/ftv2mnode.png \
	pictures/ftv2node.png \
	pictures/ftv2plastnode.png \
	pictures/ftv2pnode.png \
	pictures/ftv2vertline.png \
	pictures/graph_legend.png \
	pictures/tab_b.gif \
	pictures/tab_l.gif \
	pictures/tab_r.gif 


install:
	mkdir -p $(hppDocdir)
	$(INSTALL_DATA) html/* $(hppDocdir)
	$(INSTALL_DATA) $(srcdir)/html/hppdoc_autotools.html $(hppDocdir)
	$(INSTALL_DATA) $(srcdir)/package.css $(hppDocdir)
	mkdir -p $(hppDocdir)/pictures
	$(INSTALL_DATA) $(srcdir)/pictures/* $(hppDocdir)/pictures
	$(INSTALL_DATA) $(srcdir)/figures/kppInterfaceWalk.png $(hppDocdir)/pictures
	$(INSTALL_DATA) $(srcdir)/figures/archi.png $(hppDocdir)/pictures

