include $(top_srcdir)/build-aux/init.mk

EXTRA_DIST +=						\
		$(top_srcdir)/scripts/packageDep	\
		packages.sh missing.html.in

# Generate package dependencies diagram.
graphDep.dot: $(top_builddir)/config.status
	$(top_srcdir)/scripts/packageDep -o graphDep.dot $(PKG_LIST)
	sed -i 's/size = "12,15"//' graphDep.dot

images/dependencies.png: graphDep.dot
	mkdir -p images
	dot -o images/dependencies.png -Tpng graphDep.dot

CLEANFILES +=				\
	graphDep.dot			\
	images/dependencies.png


# Generate pages for missing packages.
%-missing.html: $(top_builddir)/config.status
	$(top_srcdir)/doc/packages.sh		\
	$(top_srcdir)/doc/missing.html.in 	\
	`echo "$@" | sed 's/-missing.html//g'`  \
	> $@

BUILT_SOURCES = $(MISSING_FILES)
CLEANFILES += $(MISSING_FILES)

# Graph dependency.
# Replace the special tag ``@MAP@'' by the dot generated map.
graphDep.html: graphDep.dot
	dot -o graphDep.html -Tcmapx graphDep.dot

graph-dependency.html: graph-dependency.html.in graphDep.html
	MAP=`tr -d '\n' < graphDep.html`; \
	sed "s|@MAP@|$$MAP|" "$<" > $@

EXTRA_DIST += $(DOC_EXTRA)		\
	graph-dependency.html.in	\
	cmaxp.html


# Asciidoc pages.
SUFFIXES += .html
.txt.html:
	asciidoc -a icons -o $@ $<

# Distribute all files (HTML, images, videos...).
DOC_EXTRA =				\
	custom.css			\
	doxygen.css			\
	figures/archi.png		\
	figures/kppInterfaceWalk.png	\
	movies/passing-under.mp4	\
	movies/whole-body.mp4		\
	images/dependencies.png		\
	images/film.png			\
	images/footer.jpg		\
	images/ftv2blank.png		\
	images/ftv2doc.png		\
	images/ftv2folderclosed.png	\
	images/ftv2folderopen.png	\
	images/ftv2lastnode.png		\
	images/ftv2link.png		\
	images/ftv2mlastnode.png	\
	images/ftv2mnode.png		\
	images/ftv2node.png		\
	images/ftv2plastnode.png	\
	images/ftv2pnode.png		\
	images/ftv2vertline.png		\
	images/graph_legend.png		\
	images/icons/callouts/1.png	\
	images/icons/callouts/2.png	\
	images/icons/callouts/3.png	\
	images/icons/callouts/4.png	\
	images/icons/callouts/5.png	\
	images/icons/callouts/6.png	\
	images/icons/callouts/7.png	\
	images/icons/callouts/8.png	\
	images/icons/callouts/9.png	\
	images/icons/callouts/10.png	\
	images/icons/callouts/11.png	\
	images/icons/callouts/12.png	\
	images/icons/callouts/13.png	\
	images/icons/callouts/14.png	\
	images/icons/callouts/15.png	\
	images/icons/caution.png	\
	images/icons/example.png	\
	images/icons/home.png		\
	images/icons/important.png	\
	images/icons/next.png		\
	images/icons/note.png		\
	images/icons/prev.png		\
	images/icons/tip.png		\
	images/icons/up.png		\
	images/icons/warning.png	\
	images/passing-under.jpg	\
	images/tab_b.gif		\
	images/tab_l.gif		\
	images/tab_r.gif		\
	images/walk.png			\
	images/whole-body.png		\
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

