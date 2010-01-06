#! /bin/sh

# This script generates pages for missing software from
# a template and a package name.
#
# This script incorporates meta-information about pacakges
# and should be updates to handle a new package.

# Options.
verbose=0
template="$1"
package="$2"

# Shared variables.
pkg_list=""

# Functions.
pkg ()
{
    tarname="$1"
    name="$2"
    git_url="$3"
    robotpkg_package="$4"

    pkg_list="$pkg_list $tarname"

    key=`echo "$tarname" | sed 's/-/_/g'`
    eval "name__$key='$name'"
    eval "git_url__$key='$git_url'"
    eval "robotpkg_package__$key='$robotpkg_package'"
}

usage ()
{
    echo "$0 [TEMPLATE] [PACKAGE]"
    echo "TEMPLATE is the page template (html/missing.html.in)."
    echo "PACKAGE must be the package UNIX name (tarname)."
}

# Check options.
if test x$package = x || test x$template = x; then
    usage
    exit 1
fi


# Package database.
pkg "abstractGikTask" \
    "abstractGikTask" \
    "ssh://[softs|git].laas.fr/git/jrl/abstractGikTask" \
    "interfaces/jrl-interface-giktask"

pkg "abstractRobotsDynamics" \
    "abstractRobotsDynamics" \
    "ssh://[softs|git].laas.fr/git/jrl/abstractRobotsDynamics" \
    "interfaces/jrl-interface-dynamics"

pkg "dynamicsJRLJapan" \
    "dynamicsJRLJapan" \
    "ssh://[softs|git].laas.fr/git/jrl/dynamicsJRLJapan" \
    "math/jrl-dynamics"

pkg "hppCmpPlanner" \
    "hppCmpPlanner" \
    "ssh://[softs|git].laas.fr/git/jrl/hppCmpPlanner" \
    "" # no RobotPkg package.

pkg "hppCorbaServer" \
    "hppCorbaServer" \
    "ssh://[softs|git].laas.fr/git/jrl/hppCmpPlanner" \
    "devel/hpp-corbaserver"

pkg "hppCore" \
    "hppCore" \
    "ssh://[softs|git].laas.fr/git/jrl/hppCore" \
    "path/hpp-core"

pkg "hppDynamicObstacle" \
    "hppDynamicObstacle" \
    "ssh://[softs|git].laas.fr/git/jrl/hppDynamicObstacle" \
    "" # no RobotPkg package.

pkg "hppGik" \
    "hppGik" \
    "ssh://[softs|git].laas.fr/git/jrl/hppGik" \
    "path/hpp-gik"

pkg "hppHRPPlanner" \
    "hppHRPPlanner" \
    "ssh://[softs|git].laas.fr/git/jrl/hppHRPPlanner" \
    "" # no RobotPkg package.

pkg "hppHybridRobot" \
    "hppHybridRobot" \
    "ssh://[softs|git].laas.fr/git/jrl/algo/hppHybridRobot" \
    "" # no RobotPkg package.

pkg "hppLoa" \
    "hppLoa" \
    "ssh://[softs|git].laas.fr/git/jrl/hppLoa" \
    "" # no RobotPkg package.

pkg "hppLoaPlanner" \
    "hppLoaPlanner" \
    "ssh://[softs|git].laas.fr/git/jrl/hppLoaPlanner" \
    "" # no RobotPkg package.

pkg "hppModel" \
    "hppModel" \
    "ssh://[softs|git].laas.fr/git/jrl/hppModel" \
    "devel/hpp-model"

pkg "hppOpenHRP" \
    "hppOpenHRP" \
    "ssh://[softs|git].laas.fr/git/jrl/hppOpenHRP" \
    "path/hpp-openhrp"

pkg "hppPython" \
    "hppPython" \
    "ssh://[softs|git].laas.fr/git/jrl/hppPython" \
    "scripts/hpp-python"

pkg "hppTimingPlanner" \
    "hppTimingPlanner" \
    "ssh://[softs|git].laas.fr/git/jrl/hppTimingPlanner" \
    "" # no RobotPkg package.

pkg "hppTutorialPlanner" \
    "hppTutorialPlanner" \
    "ssh://[softs|git].laas.fr/git/jrl/hppTutorialPlanner" \
    "" # no RobotPkg package.

pkg "hppVisualizeMovePlanner" \
    "hppVisualizeMovePlanner" \
    "ssh://[softs|git].laas.fr/git/jrl/hppVisualizeMovePlanner" \
    "" # no RobotPkg package.

pkg "hpp-walkfootplanner" \
    "HPP walkfoot planner" \
    "ssh://[softs|git].laas.fr/git/jrl/algo/hppWalkFootPlanner" \
    "path/hpp-walkfootplanner"

pkg "hpp-walkplanner" \
    "HPP walk planner" \
    "ssh://[softs|git].laas.fr/git/jrl/hppWalkPlanner" \
    "path/hpp-walkplanner"

pkg "hppWalkPlannerCompSpec" \
    "hppWalkPlannerCompSpec" \
    "ssh://[softs|git].laas.fr/git/jrl/hppWalkPlannerCompSpec" \
    "" # no RobotPkg package.

pkg "hpphik" \
    "hpphik" \
    "ssh://[softs|git].laas.fr/git/jrl/algo/hpphik" \
    "path/hpp-hik"

pkg "hpplocalstepper" \
    "hpplocalstepper" \
    "ssh://[softs|git].laas.fr/git/jrl/algo/hpphik" \
    "path/hpp-localstepper"

pkg "hrp2Dynamics" \
    "hrp2Dynamics" \
    "ssh://[softs|git].laas.fr/git/jrl/hrp2Dynamics" \
    "" # no RobotPkg package.

pkg "kppInterface" \
    "kppInterface" \
    "ssh://[softs|git].laas.fr/git/jrl/kppInterface" \
    "graphics/kpp-interface"

pkg "kppInterfaceCmp" \
    "kppInterfaceCmp" \
    "ssh://[softs|git].laas.fr/git/jrl/kppInterfaceCmp" \
    "" # no RobotPkg package.

pkg "kppInterfaceHRP" \
    "kppInterfaceHRP" \
    "ssh://[softs|git].laas.fr/git/jrl/kppInterfaceHRP" \
    "" # no RobotPkg package.

pkg "kppInterfaceTutorial" \
    "kppInterfaceTutorial" \
    "ssh://[softs|git].laas.fr/git/jrl/kppInterfaceTutorial" \
    "" # no RobotPkg package.

pkg "kpp-interfacewalk" \
    "KPP interface walk" \
    "ssh://[softs|git].laas.fr/git/jrl/kppInterface" \
    "graphics/kpp-interfacewalk"

pkg "kwsPlus" \
    "kwsPlus" \
    "ssh://[softs|git].laas.fr/git/jrl/kwsPlus" \
    "devel/hpp-kwsplus"

pkg "roboptim-core" \
    "RobOptim core" \
    "ssh://[softs|git].laas.fr/git/jrl/roboptim/core" \
    "optimization/roboptim-core"

pkg "roboptim-posture" \
    "RobOptim posture" \
    "ssh://[softs|git].laas.fr/git/jrl/roboptim/posture" \
    "" # no RobotPkg package.

pkg "roboptim-trajectory" \
    "RobOptim trajectory" \
    "ssh://[softs|git].laas.fr/git/jrl/roboptim/trajectory" \
    "optimization/roboptim-trajectory"

pkg "slam3DPlanner" \
    "slam3DPlanner" \
    "ssh://[softs|git].laas.fr/git/jrl/slam3DPlanner" \
    "" # no RobotPkg package.

pkg "stackoftasks" \
    "stackoftasks" \
    "ssh://[softs|git].laas.fr/git/jrl/StackOfTasks" \
    "" # no RobotPkg package.

pkg "walk-genom" \
    "walk-genom" \
    "ssh://[softs|git].laas.fr/git/jrl/StackOfTasks" \
    "path/walk-genom"

pkg "walkGenJrl" \
    "walkGenJrl" \
    "ssh://[softs|git].laas.fr/git/jrl/walkGenJRL" \
    "path/jrl-walkgen"

pkg "walkPlannerOrtm" \
    "walkPlannerOrtm" \
    "ssh://[softs|git].laas.fr/git/jrl/walkPlannerOrtm" \
    "" # no RobotPkg package.

pkg "walkPlannerOrtmClient" \
    "walkPlannerOrtmClient" \
    "ssh://[softs|git].laas.fr/git/jrl/walkPlannerOrtmClient" \
    "" # no RobotPkg package.

pkg "worldModelGrid3D" \
    "worldModelGrid3D" \
    "ssh://[softs|git].laas.fr/git/jrl/worldModelGrid3D" \
    "" # no RobotPkg package.

# Retrieve information about wanted package.
key=`echo "$package" | sed 's/-/_/g'`
name=$(eval echo "\$name__$key")
git_url=$(eval echo "\$git_url__$key")
robotpkg_package=$(eval echo "\$robotpkg_package__$key")

# Display if verbose is enabled.
if test $verbose = 1; then
 echo "Information for package \`\`$package'':"
 echo -e "\tName: $name"
 echo -e "\tGit URL: $git_url"
 echo -e "\tRobotPkg package: $robotpkg_package"
 echo
 echo "Available packages are:"

 for pkg in $pkg_list; do
     echo "- $pkg"
 done
fi

# Generating steps instruction.
steps=""

if ! test "x$git_url" = x; then
    steps=`echo "$steps <li>"					\
	"get the source code through <code>git</code>:"		\
	"<code>git clone $git_url</code>,"			\
	"then configure, compile and install the package.</code></li>"`
fi

if ! test "x$robotpkg_package" = x; then
    steps=`echo "$steps <li>"					\
	"install it through <code>robotpkg</code>:"		\
	"<code>cd ${ROBOTPKG_BASE}/robotpkg/$robotpkg_package;" \
	" make update</code></li>"`
fi


# Generate template page.
sed -e "s/@PACKAGE_NAME@/$name/g"		\
    -e "s/@PACKAGE_TARNAME@/$package/g"	       	\
    -e "s!@STEPS@!$steps!g"			\
    "$template"
