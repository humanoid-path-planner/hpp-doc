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

c_good="\e[32m"
c_bad="\e[31m"
c_reset="\e[0m"

echo "Devel directory is $DEVEL_HPP_DIR"
# Check that
# - remote origin is something like https://github.com/humanoid-path-planner/...
# - there is no difference between origin/devel
#   and the current working directory.
# - working directory is clean
for pkg in ${pkg_main}; do
  GIT="git -C ${DEVEL_HPP_DIR}/src/${pkg}"

  remote_origin=$(${GIT} remote get-url origin)
  if [[ ! "$remote_origin" =~ ^.*github.com[:/]humanoid-path-planner/${pkg}.*$ ]]; then
    echo -e "${pkg}: ${c_bad}Remote 'origin' is not the main repo. Should be https://github.com/humanoid-path-planner/${pkg}${c_reset}"
    # exit 1
  fi

  #current_branch=$(${GIT} rev-parse --abbrev-ref HEAD)
  #if [ ! "${current_branch}" == "devel" ]; then
  #  echo "${pkg}: Current branch is ${current_branch}. Should be devel."
  #  exit 1
  #fi
  ${GIT} update-index -q --refresh
  CHANGED=$(${GIT} diff-index --name-only origin/devel --)
  if [ -n "${CHANGED}" ]; then
    echo -e "${pkg}: ${c_bad}Not synchronized with origin/devel${c_reset}."
    exit 1
  fi

  CHANGED=$(${GIT} diff-index --name-only HEAD --)
  if [ -n "${CHANGED}" ]; then
    echo -e "${pkg}: ${c_bad}Working directory not clean${c_reset}."
    exit 1
  fi
  echo -e "${pkg}: ${c_good}Ok${c_reset}."
done

exit 0

# Create the tags
echo "Create tags ${version}"
for pkg in ${pkg_main}; do
  GIT="git -C ${DEVEL_HPP_DIR}/src/${pkg}"
  ${GIT} tag -a -m "Version ${version}" ${version}
  echo -e "${pkg}: ${c_good}Ok${c_reset}."
done

# Push the tags
read -p "Push the tags ? [y/N]" answer
if [[ "${answer}" =~ ^[yY]$ ]]; then
  echo "Push tags ${version} to origin"
  for pkg in ${pkg_main}; do
    GIT="git -C ${DEVEL_HPP_DIR}/src/${pkg}"
    ${GIT} push origin ${version}
    echo -e "${pkg}: ${c_good}Ok${c_reset}."
  done
fi
