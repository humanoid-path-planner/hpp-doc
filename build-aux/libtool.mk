# Regenerate libtool if required, should be included by the
# top-level Makefile.am file.
LIBTOOL_DEPS = @LIBTOOL_DEPS@
libtool: $(LIBTOOL_DEPS)
	$(SHELL) ./config.status --recheck