
dnl 
dnl configure.ac file for package hppDoc 
dnl

AC_INIT([hppDoc], [1.0], [support@company.com])
AC_PREREQ(2.59)

AM_INIT_AUTOMAKE
AC_PROG_INSTALL

if PKG_CHECK_MODULES(KWSPLUS, kwsPlus); then
	KWSPLUS_PREFIX=`$PKG_CONFIG kwsPlus --variable=prefix`
	AC_SUBST(KWSPLUS_PREFIX)
fi

if PKG_CHECK_MODULES(HPPMODEL, hppCore); then
	HPPMODEL_PREFIX=`$PKG_CONFIG hppModel --variable=prefix`
	AC_SUBST(HPPMODEL_PREFIX)
fi

if PKG_CHECK_MODULES(HPPCORE, hppCore); then
	HPPCORE_PREFIX=`$PKG_CONFIG hppCore --variable=prefix`
	AC_SUBST(HPPCORE_PREFIX)
fi

if PKG_CHECK_MODULES(WALKGENJRL, walkGenJrl); then
	WALKGENJRL_PREFIX=`$PKG_CONFIG walkGenJrl --variable=prefix`
	AC_SUBST(WALKGENJRL_PREFIX)
fi

if PKG_CHECK_MODULES(HPPCORBASERVER, hppCorbaServer); then
	HPPCORBASERVER_PREFIX=`$PKG_CONFIG hppCorbaServer --variable=prefix`
	AC_SUBST(HPPCORBASERVER_PREFIX)
fi

if PKG_CHECK_MODULES(HPPPYTHON, hppPython); then
	HPPPYTHON_PREFIX=`$PKG_CONFIG hppPython --variable=prefix`
	AC_SUBST(HPPPYTHON_PREFIX)
fi

if PKG_CHECK_MODULES(HPPWALKPLANNER, hppWalkPlanner); then
	HPPWALKPLANNER_PREFIX=`$PKG_CONFIG hppWalkPlanner --variable=prefix`
	AC_SUBST(HPPWALKPLANNER_PREFIX)
fi

dnl if PKG_CHECK_MODULES(HPPHRPPLANNER, hppHRPPlanner); then
dnl 	HPPHRPPLANNER_PREFIX=`$PKG_CONFIG hppHRPPlanner --variable=prefix`
dnl 	AC_SUBST(HPPHRPPLANNER_PREFIX)
dnl fi

dnl if PKG_CHECK_MODULES(HPPCMPPLANNER, hppCmpPlanner); then
dnl 	HPPCMPPLANNER_PREFIX=`$PKG_CONFIG hppCmpPlanner --variable=prefix`
dnl 	AC_SUBST(HPPCMPPLANNER_PREFIX)
dnl fi

dnl if PKG_CHECK_MODULES(HPPTUTORIALPLANNER, hppTutorialPlanner); then
dnl 	HPPTUTORIALPLANNER_PREFIX=`$PKG_CONFIG hppTutorialPlanner --variable=prefix`
dnl 	AC_SUBST(HPPTUTORIALPLANNER_PREFIX)
dnl fi

if PKG_CHECK_MODULES(KPPINTERFACE, kppInterface); then
	KPPINTERFACE_PREFIX=`$PKG_CONFIG kppInterface --variable=prefix`
	AC_SUBST(KPPINTERFACE_PREFIX)
fi

if PKG_CHECK_MODULES(KPPINTERFACEWALK, kppInterfaceWalk); then
	KPPINTERFACEWALK_PREFIX=`$PKG_CONFIG kppInterfaceWalk --variable=prefix`
	AC_SUBST(KPPINTERFACEWALK_PREFIX)
fi

dnl if PKG_CHECK_MODULES(KPPINTERFACEHRP, kppInterfaceHRP); then
dnl 	KPPINTERFACEHRP_PREFIX=`$PKG_CONFIG kppInterfaceHRP --variable=prefix`
dnl 	AC_SUBST(KPPINTERFACEHRP_PREFIX)
dnl fi

dnl if PKG_CHECK_MODULES(KPPINTERFACECMP, kppInterfaceCmp); then
dnl 	KPPINTERFACECMP_PREFIX=`$PKG_CONFIG kppInterfaceCmp --variable=prefix`
dnl 	AC_SUBST(KPPINTERFACECMP_PREFIX)
dnl fi

if PKG_CHECK_MODULES(HPPGIK, hppGik); then
	HPPGIK_PREFIX=`$PKG_CONFIG hppGik --variable=prefix`
	AC_SUBST(HPPGIK_PREFIX)
fi

dnl if PKG_CHECK_MODULES(HPPLOA, hppLoa); then
dnl 	HPPLOA_PREFIX=`$PKG_CONFIG hppLoa --variable=prefix`
dnl 	AC_SUBST(HPPLOA_PREFIX)
dnl fi

if PKG_CHECK_MODULES(DYNAMICSJRLJAPAN, dynamicsJRLJapan); then
	DYNAMICSJRLJAPAN_PREFIX=`$PKG_CONFIG dynamicsJRLJapan --variable=prefix`
	AC_SUBST(DYNAMICSJRLJAPAN_PREFIX)
fi

if PKG_CHECK_MODULES(ABSTRACTROBOTDYNAMICS, abstractRobotDynamics); then
	ABSTRACTROBOTDYNAMICS_PREFIX=`$PKG_CONFIG abstractRobotDynamics --variable=prefix`
	AC_SUBST(ABSTRACTROBOTDYNAMICS_PREFIX)
fi

if PKG_CHECK_MODULES(ABSTRACTGIKTASK, abstractGikTask); then
	ABSTRACTGIKTASK_PREFIX=`$PKG_CONFIG abstractGikTask --variable=prefix`
	AC_SUBST(ABSTRACTGIKTASK_PREFIX)
fi

dnl if PKG_CHECK_MODULES(KPPINTERFACETUTORIAL, kppInterfaceTutorial); then
dnl 	KPPINTERFACETUTORIAL_PREFIX=`$PKG_CONFIG kppInterfaceTutorial --variable=prefix`
dnl 	AC_SUBST(KPPINTERFACETUTORIAL_PREFIX)
dnl fi

if PKG_CHECK_MODULES(HPPOPENHRP, hppOpenHRP); then
	HPPOPENHRP_PREFIX=`$PKG_CONFIG hppOpenHRP --variable=prefix`
	AC_SUBST(HPPOPENHRP_PREFIX)
fi

AC_OUTPUT(
	hppDoc.pc
	Makefile
	doc/Makefile
	doc/package.dox
	doc/additionalDoc/package.h
	)
