#!/bin/bash

set -e

# I (Joseph Mirabel) do not think there
# is a need to create tags for these ones.
# hpp-util
# hpp-template-corba
# hpp-statistics
# hpp-environments

# Version
if [ ! $# -eq 1 ]; then
  echo "usage: $0 version"
  echo "$#"
  exit 1
fi
version=$1

# Packages to tag
# pinocchio
pkg_main="hpp-fcl hpp-pinocchio hpp-constraints hpp-corbaserver hpp-core \
hpp_tutorial hpp-doc \
hpp-walkgen hpp-wholebody-step hpp-wholebody-step-corba \
hpp-manipulation hpp-manipulation-corba hpp-manipulation-urdf \
hpp-gepetto-viewer hpp-gui hpp-plot"

echo "Devel directory is $DEVEL_HPP_DIR"
# Check that
# - current branch is devel
# - local repository if clean
for pkg in ${pkg_main}; do
  GIT="git -C ${DEVEL_HPP_DIR}/src/${pkg}"
  current_branch=$(${GIT} rev-parse --abbrev-ref HEAD)
  if [ ! "${current_branch}" == "devel" ]; then
    echo "${pkg}: Current branch is ${current_branch}. Should be devel."
    #exit 1
  fi
  ${GIT} update-index -q --refresh
  CHANGED=$(${GIT} diff-index --name-only HEAD --)
  if [ -n "${CHANGED}" ]; then
    echo "${pkg}: Working directory not clean."
    #exit 1
  fi
done

# Create the tags
for pkg in ${pkg_main}; do
  GIT="git -C ${DEVEL_HPP_DIR}/src/${pkg}"
  echo "Create tag ${version} in ${pkg}"
  ${GIT} tag -a -m "Version ${version}" ${version}
done
