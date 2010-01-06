include $(top_srcdir)/build-aux/init.mk

EXTRA_DIST +=						\
		$(top_srcdir)/scripts/packageDep	\
		packages.sh missing.html.in

# Generate package dependencies diagram.
graphDep.dot: $(top_builddir)/config.status
	$(top_srcdir)/scripts/packageDep -o graphDep.dot $(PKG_LIST)
	sed -i 's/size = "12,15"//' graphDep.dot

pictures/dependencies.png: graphDep.dot
	mkdir -p pictures
	dot -o pictures/dependencies.png -Tpng graphDep.dot

CLEANFILES +=				\
	graphDep.dot			\
	pictures/dependencies.png


# Generate pages for missing packages.
%-missing.html: $(top_builddir)/config.status
	$(top_srcdir)/doc/packages.sh		\
	$(top_srcdir)/doc/missing.html.in 	\
	`echo "$@" | sed 's/-missing.html//g'`  \
	> $@

BUILT_SOURCES = $(MISSING_FILES)
CLEANFILES += $(MISSING_FILES)

# Distribute all files (HTML, images, videos...).
DOC_EXTRA =				\
	custom.css			\
	doxygen.css			\
	figures/archi.png		\
	figures/kppInterfaceWalk.png	\
	graph-dependency.html		\
	movies/passing-under.mp4	\
	movies/whole-body.mp4		\
	pictures/dependencies.png	\
	pictures/film.png		\
	pictures/footer.jpg		\
	pictures/ftv2blank.png		\
	pictures/ftv2doc.png		\
	pictures/ftv2folderclosed.png	\
	pictures/ftv2folderopen.png	\
	pictures/ftv2lastnode.png	\
	pictures/ftv2link.png		\
	pictures/ftv2mlastnode.png	\
	pictures/ftv2mnode.png		\
	pictures/ftv2node.png		\
	pictures/ftv2plastnode.png	\
	pictures/ftv2pnode.png		\
	pictures/ftv2vertline.png	\
	pictures/graph_legend.png	\
	pictures/passing-under.jpg	\
	pictures/tab_b.gif		\
	pictures/tab_l.gif		\
	pictures/tab_r.gif		\
	pictures/walk.png		\
	pictures/whole-body.png		\
	tabs.css

nobase_html_DATA =			\
	algorithm.html			\
	autotools.html			\
	corba.html			\
	develop.html			\
	doxygen.css			\
	index.html			\
	install.html			\
	kpp-interface.html		\
	main.html			\
	robotic-component.html		\
	tree.html

nobase_html_DATA += $(MISSING_FILES) $(DOC_EXTRA)

EXTRA_DIST += $(DOC_EXTRA)
