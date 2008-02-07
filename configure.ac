
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

dnl if PKG_CHECK_MODULES(HPPMODEL, hppModel); then
dnl 	HPPMODEL_PREFIX=`$PKG_CONFIG hppModel --variable=prefix`
dnl 	AC_SUBST(HPPMODEL_PREFIX)
dnl fi

if PKG_CHECK_MODULES(HPPCORE, hppCore); then
	HPPCORE_PREFIX=`$PKG_CONFIG hppCore --variable=prefix`
	AC_SUBST(HPPCORE_PREFIX)
fi

dnl if PKG_CHECK_MODULES(WALKGENJRL, walkGenJrl); then
dnl 	WALKGENJRL_PREFIX=`$PKG_CONFIG walkGenJrl --variable=prefix`
dnl 	AC_SUBST(WALKGENJRL_PREFIX)
dnl fi

if PKG_CHECK_MODULES(HPPCORBASERVER, hppCorbaServer); then
	HPPCORBASERVER_PREFIX=`$PKG_CONFIG hppCorbaServer --variable=prefix`
	AC_SUBST(HPPCORBASERVER_PREFIX)
fi

dnl dnl if PKG_CHECK_MODULES(HPPPYTHON, hppPython); then
dnl dnl 	HPPPYTHON_PREFIX=`$PKG_CONFIG hppPython --variable=prefix`
dnl dnl 	AC_SUBST(HPPPYTHON_PREFIX)
dnl dnl fi

dnl if PKG_CHECK_MODULES(HPPWALKPLANNER, hppWalkPlanner); then
dnl 	HPPWALKPLANNER_PREFIX=`$PKG_CONFIG hppWalkPlanner --variable=prefix`
dnl 	AC_SUBST(HPPWALKPLANNER_PREFIX)
dnl fi

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

dnl if PKG_CHECK_MODULES(KPPINTERFACEWALK, kppInterfaceWalk); then
dnl 	KPPINTERFACEWALK_PREFIX=`$PKG_CONFIG kppInterfaceWalk --variable=prefix`
dnl 	AC_SUBST(KPPINTERFACEWALK_PREFIX)
dnl fi

dnl if PKG_CHECK_MODULES(KPPINTERFACEHRP, kppInterfaceHRP); then
dnl 	KPPINTERFACEHRP_PREFIX=`$PKG_CONFIG kppInterfaceHRP --variable=prefix`
dnl 	AC_SUBST(KPPINTERFACEHRP_PREFIX)
dnl fi

dnl if PKG_CHECK_MODULES(KPPINTERFACECMP, kppInterfaceCmp); then
dnl 	KPPINTERFACECMP_PREFIX=`$PKG_CONFIG kppInterfaceCmp --variable=prefix`
dnl 	AC_SUBST(KPPINTERFACECMP_PREFIX)
dnl fi

dnl if PKG_CHECK_MODULES(HPPGIK, hppGik); then
dnl 	HPPGIK_PREFIX=`$PKG_CONFIG hppGik --variable=prefix`
dnl 	AC_SUBST(HPPGIK_PREFIX)
dnl fi

dnl if PKG_CHECK_MODULES(HPPLOA, hppLoa); then
dnl 	HPPLOA_PREFIX=`$PKG_CONFIG hppLoa --variable=prefix`
dnl 	AC_SUBST(HPPLOA_PREFIX)
dnl fi

dnl if PKG_CHECK_MODULES(DYNAMICSJRLJAPAN, dynamicsJRLJapan); then
dnl 	DYNAMICSJRLJAPAN_PREFIX=`$PKG_CONFIG dynamicsJRLJapan --variable=prefix`
dnl 	AC_SUBST(DYNAMICSJRLJAPAN_PREFIX)
dnl fi

dnl if PKG_CHECK_MODULES(ABSTRACTROBOTDYNAMICS, abstractRobotDynamics); then
dnl 	ABSTRACTROBOTDYNAMICS_PREFIX=`$PKG_CONFIG abstractRobotDynamics --variable=prefix`
dnl 	AC_SUBST(ABSTRACTROBOTDYNAMICS_PREFIX)
dnl fi

dnl if PKG_CHECK_MODULES(ABSTRACTGIKTASK, abstractGikTask); then
dnl 	ABSTRACTGIKTASK_PREFIX=`$PKG_CONFIG abstractGikTask --variable=prefix`
dnl 	AC_SUBST(ABSTRACTGIKTASK_PREFIX)
dnl fi

dnl if PKG_CHECK_MODULES(KPPINTERFACETUTORIAL, kppInterfaceTutorial); then
dnl 	KPPINTERFACETUTORIAL_PREFIX=`$PKG_CONFIG kppInterfaceTutorial --variable=prefix`
dnl 	AC_SUBST(KPPINTERFACETUTORIAL_PREFIX)
dnl fi

dnl if PKG_CHECK_MODULES(HPPOPENHRP, hppOpenHRP); then
dnl 	HPPOPENHRP_PREFIX=`$PKG_CONFIG hppOpenHRP --variable=prefix`
dnl 	AC_SUBST(HPPOPENHRP_PREFIX)
dnl fi

dnl if PKG_CHECK_MODULES(HPPVISUALIZEMOVEPLANNER, hppVisualizeMovePlanner); then
dnl 	HPPVISUALIZEMOVEPLANNER_PREFIX=`$PKG_CONFIG hppVisualizeMovePlanner --variable=prefix`
dnl 	AC_SUBST(HPPVISUALIZEMOVEPLANNER_PREFIX)
dnl fi


AC_OUTPUT(
	Makefile
	doc/Makefile
	doc/html/corba.html
	doc/html/algorithm.html
	doc/html/kppInterface.html
	doc/html/main.html
	doc/html/index.html
	doc/html/tree.html
	doc/html/hppdoc_development.html
	doc/html/hppdoc_howtoinstall.html
	)
