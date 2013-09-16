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
pkg "abstract-gik-task" \
    "abstract-gik-task" \
    "ssh://[softs|git].laas.fr/git/jrl/algo/abstract-gik-task" \
    "interfaces/jrl-interface-giktask"

pkg "abstract-robots-dynamics" \
    "abstract-robots-dynamics" \
    "git@github.com:laas/abstract-robot-dynamics" \
    "interfaces/jrl-interface-dynamics"

pkg "jrl-dynamics" \
    "jrl-dynamics" \
    "git@github.com:jrl-umi3218/jrl-dynamics" \
    "math/jrl-dynamics"

pkg "hpp-corbaserver" \
    "hpp-corbaserver" \
    "git@github.com:laas/hpp-corbaserver" \
    "devel/hpp-corbaserver"

pkg "hpp-core" \
    "hpp-core" \
    "git@github.com:laas/hpp-core" \
    "path/hpp-core"

pkg "hpp-gik" \
    "hpp-gik" \
    "git@github.com:laas/hpp-gik" \
    "path/hpp-gik"

pkg "hpp-model" \
    "hpp-model" \
    "git@github.com:laas/hpp-model" \
    "devel/hpp-model"

pkg "hpp-walkfootplanner" \
    "HPP walkfoot planner" \
    "ssh://[softs|git].laas.fr/git/jrl/algo/hppWalkFootPlanner" \
    "path/hpp-walkfootplanner"

pkg "hpp-walkplanner" \
    "HPP walk planner" \
    "ssh://[softs|git].laas.fr/git/jrl/algo/hpp-walkplanner" \
    "path/hpp-walkplanner"

pkg "hrp2-dynamics" \
    "hrp2-dynamics" \
    "git@github.com:thomas-moulard/hrp2-dynamics" \
    "math/hrp2-dynamics"

pkg "kpp-interface" \
    "kpp-interface" \
    "git@github.com:laas/kpp-interface" \
    "graphics/kpp-interface"

pkg "kpp-interfacewalk" \
    "KPP interface walk" \
    "ssh://[git|trac].laas.fr/git/jrl/kpp/kpp-interfacewalk" \
    "graphics/kpp-interfacewalk"

pkg "kwsPlus" \
    "kwsPlus" \
    "ssh://[git|trac].laas.fr/git/jrl/algo/kwsPlus" \
    "devel/hpp-kwsplus"

pkg "roboptim-core" \
    "RobOptim core" \
    "git@github.com:roboptim/roboptim-core" \
    "optimization/roboptim-core"

pkg "roboptim-trajectory" \
    "RobOptim trajectory" \
    "git@github.com:roboptim/roboptim-trajectory" \
    "optimization/roboptim-trajectory"

pkg "jrl-walkgen" \
    "jrl-walkgen" \
    "git@github.com:jrl-umi3218/jrl-walkgen" \
    "path/jrl-walkgen"

pkg "hpp-roboptim" \
    "hpp-roboptim" \
    "git@github.com:laas/hpp-roboptim" \
    "path/hpp-roboptim"

pkg "hpp-constrained" \
    "hpp-constrained" \
    "git@github.com:laas/hpp-constrained" \
    "path/hpp-constrained"

pkg "hpp-constrained-planner" \
    "hpp-constrained-planner" \
    "git@github.com:laas/hpp-constrained-planner" \
    "path/hpp-constrained-planner"

pkg "hpp-wholebody-step-planner" \
    "hpp-wholebody-step-planner" \
    "git@github.com:laas/hpp-wholebody-step-planner" \
    "path/hpp-wholebody-step-planner"

pkg "hpp-wholebody-step-corba" \
    "hpp-wholebody-step-corba" \
    "git@github.com:laas/hpp-wholebody-step-corba" \
    "path/hpp-wholebody-step-corba"

pkg "kpp-interfacestep" \
    "kpp-interfacestep" \
    "git@github.com:laas/kpp-interfacestep" \
    "path/kpp-interfacestep"

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
	"to get the source code through <code>git</code>: "		\
	"<code>git clone $git_url</code>,"			\
	"then configure, compile and install the package.</code></li>"`
fi

if ! test "x$robotpkg_package" = x; then
    steps=`echo "$steps <li>"					\
	"install it through <code>robotpkg</code>: "		\
	"<code>cd robotpkg/$robotpkg_package;" \
	" make update</code></li>"`
fi


# Generate template page.
sed -e "s/@PACKAGE_NAME@/$name/g"		\
    -e "s/@PACKAGE_TARNAME@/$package/g"	       	\
    -e "s!@STEPS@!$steps!g"			\
    "$template"
