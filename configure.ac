# Require at least Autoconf >=2.59.
AC_PREREQ(2.59)

## --------------------- ##
## Package configuration ##
## --------------------- ##
AC_INIT([hppDoc],
        [1.3],
        [hpp@laas.fr])

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

# Search for pkg-config.
PKG_PROG_PKG_CONFIG

AC_SUBST(pkg_list,[])

# --- PKG_CHKADDDPD([VARIABLE], [MODULE]) ----------------------------
#
# do you love consonants?

m4_define([PKG_CHKADDDPD],[
  AC_MSG_CHECKING([for $2])
  pkg_failed=no
  if test "$3" = ""; then pname=$2; else pname=$3; fi
  PKG_CHECK_EXISTS([$pname],
                   [pkgprefix_[]$1=`$PKG_CONFIG --variable=prefix "$pname" 2>/dev/null`],
	           [pkg_failed=yes])
  if test $pkg_failed = yes; then
    AC_SUBST($1[]_DOCDIR,$prefix/share/doc/hppDoc/$2)
    AC_MSG_RESULT([no])
  else
    AC_SUBST($1[]_PREFIX,$pkgprefix_[]$1)
# once all packages will export their docdir in pkgconfig:
    AC_SUBST($1[]_DOCDIR,`$PKG_CONFIG --variable=docdir "$2" 2>/dev/null`)
#   AC_SUBST($1[]_DOCDIR,$$1[]_PREFIX/share/doc/$2)
    if test -n "$pkg_list"; then pkg_list="$pkg_list $2"; else pkg_list="$2"; fi
    AC_MSG_RESULT([yes])
  fi[]dnl
])


# --- Look for installed packages ------------------------------------

PKG_CHKADDDPD(KWSPLUS,			kwsPlus)
PKG_CHKADDDPD(HPPMODEL,			hppModel)
PKG_CHKADDDPD(HPPCORE,			hppCore)
PKG_CHKADDDPD(WALKGENJRL,		walkGenJrl)
PKG_CHKADDDPD(HPPCORBASERVER,		hppCorbaServer)
PKG_CHKADDDPD(HPPPYTHON,		hppPython)
PKG_CHKADDDPD(HPPWALKFOOTPLANNER,	hppWalkFootPlanner)
PKG_CHKADDDPD(HPPWALKPLANNER,		hppWalkPlanner)
PKG_CHKADDDPD(HPPHYBRIDROBOT, 		hppHybridRobot)
PKG_CHKADDDPD(HPPHRPPLANNER, 		hppHRPPlanner)
PKG_CHKADDDPD(HPPCMPPLANNER, 		hppCmpPlanner)
PKG_CHKADDDPD(HPPTUTORIALPLANNER, 	hppTutorialPlanner)
PKG_CHKADDDPD(KPPINTERFACE, 		kppInterface)
PKG_CHKADDDPD(KPPINTERFACEWALK, 	kppInterfaceWalk)
PKG_CHKADDDPD(KPPINTERFACEHRP, 		kppInterfaceHRP)
PKG_CHKADDDPD(KPPINTERFACECMP, 		kppInterfaceCmp)
PKG_CHKADDDPD(HPPGIK, 			hppGik)
PKG_CHKADDDPD(HPPLOA, 			hppLoa)
PKG_CHKADDDPD(HPPLOAPLANNER,		hppLoaPlanner)
PKG_CHKADDDPD(HPPTIMINGPLANNER, 	hppTimingPlanner)
PKG_CHKADDDPD(DYNAMICSJRLJAPAN,		dynamicsJRLJapan)
PKG_CHKADDDPD(ABSTRACTROBOTDYNAMICS, 	abstractRobotDynamics)
PKG_CHKADDDPD(ABSTRACTGIKTASK, 		abstractGikTask)
PKG_CHKADDDPD(KPPINTERFACETUTORIAL, 	kppInterfaceTutorial)
PKG_CHKADDDPD(HPPOPENHRP, 		hppOpenHRP)
PKG_CHKADDDPD(HPPVISUALIZEMOVEPLANNER,	hppVisualizeMovePlanner)
PKG_CHKADDDPD(SLAM3DPLANNER,		slam3DPlanner)
PKG_CHKADDDPD(HPPDYNAMICOBSTACLE,	hppDynamicObstacle)
PKG_CHKADDDPD(WORLDMODELGRID3D,		worldModelGrid3D)
PKG_CHKADDDPD(HRP2DYNAMICS,		hrp2Dynamics)
PKG_CHKADDDPD(HPPWALKPLANNERCOMPSPEC,	hppWalkPlannerCompSpec)
PKG_CHKADDDPD(WALKPLANNERORTM,		walkPlannerOrtm)
PKG_CHKADDDPD(WALKPLANNERORTMCLIENT,	walkPlannerOrtmClient)
PKG_CHKADDDPD(ROBOPTIMCORE,		roboptim-core)
PKG_CHKADDDPD(ROBOPTIMPOSTURE,		roboptim-posture)
PKG_CHKADDDPD(ROBOPTIMTRAJECTORY,	roboptim-trajectory)
PKG_CHKADDDPD(SOT,			stackoftasks)

PKG_CHKADDDPD(WALKGENOM,		walk-genom, walk)

# --- generate files -------------------------------------------------

# Create Makefiles.
AC_CONFIG_FILES([
	Makefile
	hppDoc.pc
	doc/Makefile
	doc/html/corba.html
	doc/html/algorithm.html
	doc/html/kppInterface.html
	doc/html/roboticComponent.html
	doc/html/main.html
	doc/html/index.html
	doc/html/tree.html
	doc/html/hppdoc_development.html
	doc/html/hppdoc_howtoinstall.html
])

# Write files.
AC_OUTPUT
