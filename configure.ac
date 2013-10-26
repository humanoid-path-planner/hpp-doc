# Don't expend macros beginning by JRL_.
m4_pattern_forbid([^JRL_])
AC_PREREQ([2.63])

## --------------------- ##
## Package configuration ##
## --------------------- ##
AC_INIT([hpp-doc],
        [m4_esyscmd(build-aux/git-version-gen .tarball-version)],
	[hpp@laas.fr],
	[hpp-doc])

# Auxiliary files.
AC_CONFIG_AUX_DIR([build-aux])

# Automake.
AM_INIT_AUTOMAKE([1.9.6 dist-bzip2 -Wall nostdinc])

# Macros are stored in build-aux.
AC_CONFIG_MACRO_DIR([build-aux])

## ------------------- ##
## Additionnal tools.  ##
## ------------------- ##

# Search for install.
AC_PROG_INSTALL

# Check for asciidoc.
JRL_PROG_ASCIIDOC([ASCIIDOC], [8.2.5])

# Search for pkg-config.
PKG_PROG_PKG_CONFIG

# Check that executable dot is installed
AC_CHECK_PROG([dot_found], [dot], [true], [false])
if test $dot_found = false; then
   echo 'dot not found, install package graphviz and try to run configure again'
   exit -1
fi

# Macro that search for a package's documentation and
# generate the corresponding link to the ``main.html'' file
# of the Doxygen documentation.
pkg_list=""

AC_DEFUN([JRL_GENERATELINK],
[PKGNAME=`echo "$2 " | cut -d' ' -f1`

AC_MSG_CHECKING([for $2])
pkg_failed=yes
PKG_CHECK_EXISTS([$PKGNAME], [pkg_failed=no])

if test $pkg_failed = yes; then
   AC_SUBST([$1_LINK], [$prefix/share/doc/hpp-doc/$2-missing.html])
   AC_MSG_RESULT([no])
else
   if test x`$PKG_CONFIG $PKGNAME --variable=doxygendocdir` = x; then
      docPrefix=`$PKG_CONFIG $PKGNAME --variable=docdir`/html
   else
      docPrefix=`$PKG_CONFIG $PKGNAME --variable=doxygendocdir`
   fi
   if [[ -f $docPrefix/main.html ]]; then
      AC_SUBST([$1_LINK], [$docPrefix/main.html])
   else
      AC_SUBST([$1_LINK], [$docPrefix/index.html])
   fi
   AC_MSG_RESULT([yes])
fi

pkg_list="$pkg_list $2"
])

# List packages.
JRL_GENERATELINK([KWSPLUS], [kwsPlus])
JRL_GENERATELINK([HPPGEOMETRY], [hpp-geometry])
JRL_GENERATELINK([HPPMODEL], [hpp-model])
JRL_GENERATELINK([HPPCORE], [hpp-core])
JRL_GENERATELINK([WALKGENJRL], [jrl-walkgen])
JRL_GENERATELINK([HPPCORBASERVER], [hpp-corbaserver])
JRL_GENERATELINK([HPPWALKFOOTPLANNER], [hpp-walkfootplanner])
JRL_GENERATELINK([HPPWALKPLANNER], [hpp-walkplanner])
JRL_GENERATELINK([KPPINTERFACE], [kpp-interface])
JRL_GENERATELINK([KPPINTERFACEWALK], [kpp-interfacewalk])
JRL_GENERATELINK([HPPGIK], [hpp-gik])
JRL_GENERATELINK([DYNAMICSJRLJAPAN], [jrl-dynamics])
JRL_GENERATELINK([ABSTRACTROBOTDYNAMICS], [abstract-robot-dynamics])
JRL_GENERATELINK([ABSTRACTGIKTASK], [abstract-gik-task])
JRL_GENERATELINK([HRP2DYNAMICS], [hrp2-dynamics])
JRL_GENERATELINK([ROBOPTIMCORE], [roboptim-core])
JRL_GENERATELINK([ROBOPTIMTRAJECTORY], [roboptim-trajectory])
JRL_GENERATELINK([HPPROBOPTIM], [hpp-roboptim])
JRL_GENERATELINK([HPPCONSTRAINED], [hpp-constrained])
JRL_GENERATELINK([HPPCONSTRAINEDPLANNER], [hpp-constrained-planner])
JRL_GENERATELINK([HPPWHOLEBODYSTEPPLANNER], [hpp-wholebody-step-planner])
JRL_GENERATELINK([HPPWHOLEBODYSTEPCORBA], [hpp-wholebody-step-corba])
JRL_GENERATELINK([KPPINTERFACESTEP], [kpp-interfacestep])

# Generate the list of html stub pages for missing packages that
# will be generated.
AC_SUBST([MISSING_FILES],
         [`for i in $pkg_list; do echo -n "$i-missing.html "; done`])

# Generate packages list for packageDep.
AC_SUBST([PKG_LIST], [$pkg_list])


# Create Makefiles.
AC_CONFIG_FILES([
	Makefile
	 doc/Makefile
	 doc/corba.html
	 doc/algorithm.html
	 doc/kpp-interface.html
	 doc/robotic-component.html
	 doc/main.html
	 doc/index.html
	 doc/tree.html
])

# Write files.
AC_OUTPUT
