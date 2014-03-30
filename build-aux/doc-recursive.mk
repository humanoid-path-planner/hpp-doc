# Make documentation in ``doc'' directory.
# Simulate a recursive rule for doc and html targets.
# This file should be included in your top-level Makefile.am.
.PHONY: doc html
doc html:
	cd doc && $(MAKE) $(AM_MAKEFLAGS) $@
