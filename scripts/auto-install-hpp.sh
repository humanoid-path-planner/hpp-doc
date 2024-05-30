#!/bin/bash

# Exit on error
set -e
HOST_DIST=$(lsb_release -s -c)
case $HOST_DIST in
  xenial)
    APT_DEP="g++ cmake doxygen libboost-dev liburdfdom-dev \
      libassimp-dev ros-kinetic-xacro ros-kinetic-kdl-parser ros-kinetic-common-msgs \
      ros-kinetic-tf ros-kinetic-tf-conversions libccd-dev ros-kinetic-octomap \
      ros-kinetic-resource-retriever ros-kinetic-srdfdom ros-kinetic-pr2-description flex \
      bison asciidoc source-highlight git libomniorb4-dev omniorb-nameserver omniidl \
      omniidl-python libltdl-dev python-matplotlib libxml2 libtinyxml2-dev \
      liblog4cxx10-dev libltdl-dev qt4-dev-tools libqt4-opengl-dev libqtgui4 libqtwebkit-dev oxygen-icon-theme \
      libopenscenegraph-dev openscenegraph libpcre3-dev libcdd-dev"
    APT_BUILD_DEP=""
    CONFIG_FILE="ubuntu-16.04-kinetic.sh"
    ;;
  bionic)
    APT_DEP="g++ cmake doxygen libboost-dev liburdfdom-dev libassimp-dev \
       libeigen3-dev libgraphviz-dev robotpkg-omniorb robotpkg-qpoases+doc \
       robotpkg-romeo-description robotpkg-py36-omniorbpy robotpkg-py36-eigenpy \
       ros-melodic-xacro libccd-dev ros-melodic-octomap \
       ros-melodic-resource-retriever ros-melodic-srdfdom \
       ros-melodic-pr2-description git libomniorb4-dev omniorb-nameserver \
       libltdl-dev python-matplotlib python-omniorb \
       libxml2 robotpkg-openscenegraph robotpkg-qt5-osgqt \
       libtinyxml2-dev qt4-dev-tools libqt4-opengl-dev libqtgui4 \
       libqtwebkit-dev oxygen-icon-theme \
       libpcre3-dev libcdd-dev wget"
    APT_BUILD_DEP=""
    CONFIG_FILE="ubuntu-18.04-melodic.sh"
    ;;
  focal)
    APT_DEP="g++ cmake doxygen libboost-dev liburdfdom-dev libassimp-dev \
      libeigen3-dev libgraphviz-dev graphviz robotpkg-omniorb robotpkg-py38-eigenpy \
      robotpkg-qpoases+doc robotpkg-romeo-description robotpkg-py38-omniorbpy \
      ros-noetic-xacro libccd-dev ros-noetic-octomap \
      ros-noetic-resource-retriever ros-noetic-srdfdom \
      ros-noetic-pr2-description git libltdl-dev \
      python3-matplotlib qtbase5-private-dev qtdeclarative5-dev \
      qtmultimedia5-dev libqt5svg5-dev libxml2 libtinyxml2-dev robotpkg-qt5-osgqt \
      oxygen-icon-theme robotpkg-openscenegraph libpcre3-dev wget libcdd-dev \
      texlive-latex-extra"
    APT_BUILD_DEP=""
    CONFIG_FILE="ubuntu-20.04-noetic.sh"
    ;;
  jammy)
    APT_DEP="assimp-utils build-essential cmake coinor-libipopt1v5 \
      coinor-libipopt-dev cython3 doxygen ffmpeg gcovr gfortran git graphviz \
      libassimp-dev libboost-all-dev libbullet-dev libccd-dev libcdd-dev \
      libconsole-bridge-dev libeigen3-dev libglpk-dev libgraphviz-dev libgtest-dev \
      liblapack-dev liblog4cxx-dev libltdl-dev liboctomap-dev libopencv-dev \
      libpcl-dev libqt5svg5-dev libqt5xmlpatterns5-dev libtinyxml2-dev \
      libtinyxml-dev libtool-bin liburdfdom-dev liburdfdom-headers-dev \
      libyaml-cpp-dev llvm lsb-release m4 oxygen-icon-theme pkg-config psmisc \
      pyqt5-dev python3-defusedxml python3-dev python3-empy python3-gnupg \
      python3-lxml python3-matplotlib python3-netifaces python3-nose python3-numpy \
      python3-paramiko python3-pip python3-pydot python3-pyqt5 python3-scipy \
      python3-setuptools python3-sip-dev python3-sphinx python3-yaml \
      python-is-python3 qtbase5-private-dev qtmultimedia5-dev \
      robotpkg-openscenegraph robotpkg-py310-omniorbpy robotpkg-qpoases \
      robotpkg-qt5-osgqt texlive-latex-extra sudo wget"
    APT_BUILD_DEP=""
    CONFIG_FILE="ubuntu-22.04.sh"
    ;;
  *)
    echo "Unknow host distribution."
    exit 1
    ;;
esac

GITREPO="https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc"
MAKE_TARBALL=false
TARGET=all

BRANCH=""
if [ -z ${DEVEL_HPP_DIR} ]; then
  export DEVEL_HPP_DIR=/local/devel/hpp
fi
if [ -z ${BUILD_TYPE} ]; then
  export BUILD_TYPE=Release
fi

while test $# -gt 0
do
  case $1 in
    --mktar)
      MAKE_TARBALL=true
      ;;
    --gitrepo)
      shift
      GITREPO=$1
      echo "Will download Makefile and config.sh from $GITREPO"
      ;;
    --show-dep)
      echo "Will install"
      echo "${APT_DEP}"
      echo "\nWill install build dependencies of"
      echo "${APT_BUILD_DEP}"
      exit 0
      ;;
    --target)
      shift
      TARGET=$1
      echo "Target set to $TARGET"
      ;;
    --branch)
      shift
      BRANCH=$1
      echo "Branch set to $BRANCH"
      ;;
    --help)
      echo "Options are"
      echo "--branch:         \tbranch which should be installed"
      echo "--gitrepo:        \trepository where to download makefile and config.sh"
      echo "--mktar:          \tmake tar balls after compilation"
      echo "--show-dep:       \tshow dependencies resolved by aptitude"
      echo "--target TARGET:  \tinstall TARGET (default: all)"
      echo "-v:               \tshow variables and ask for confirm (must be last arg)"
      exit 0
      ;;
    -v)
      for v in "DEVEL_HPP_DIR" "BUILD_TYPE" "MAKE_TARBALL" "BRANCH"
      do
        echo "$v=${!v}"
      done
      read -p "Continue (y/N)?" choice
      case "$choice" in
        y|Y )
          echo "yes"
          ;;
        * ) echo "no"
          exit 1
          ;;
      esac
      ;;
    *)
      echo "Option $1 not understood. Use --help"
      exit 1
      ;;
  esac
  shift
done

if [ -z "${BRANCH}" ]; then
  echo "A branch must be specified with argument --branch"
  exit 1
fi

# standard HPP installation
sudo apt-get update -qqy
sudo apt-get --assume-yes install ${APT_DEP}
[[ -z $APT_BUILD_DEP ]] || sudo apt-get --assume-yes build-dep ${APT_BUILD_DEP}

# Setup environment
mkdir --parents $DEVEL_HPP_DIR
mkdir --parents $DEVEL_HPP_DIR/src
mkdir --parents $DEVEL_HPP_DIR/install

# Get config script
wget -q -O $DEVEL_HPP_DIR/config.sh ${GITREPO}/${BRANCH}/doc/config/${CONFIG_FILE}
wget -q -O $DEVEL_HPP_DIR/src/Makefile ${GITREPO}/${BRANCH}/makefiles/${BRANCH}.mk

source $DEVEL_HPP_DIR/config.sh

cd $DEVEL_HPP_DIR/src

source ../config.sh
make -s -e $TARGET

if [ ${MAKE_TARBALL} = true ]; then
  cd $DEVEL_HPP_DIR/
  mkdir tarball
  SUFFIX="${BRANCH}-`date +%Y%m%d`-${BUILD_TYPE}"
  tar czf "tarball/hpp.src.${SUFFIX}.tar.gz" src/ install/ config.sh
  tar czf "tarball/hpp.${SUFFIX}.tar.gz" install/ config.sh
  INSTALL="$DEVEL_HPP_DIR/tarball/check.${SUFFIX}.sh"
  echo "#!/bin/bash" > ${INSTALL}
  echo "# Dependencies" >> ${INSTALL}
  echo "sudo apt-get install $APT_DEP" >> ${INSTALL}
  echo "sudo apt-get build-dep $APT_BUILD_DEP" >> ${INSTALL}
  echo "" >> ${INSTALL}
  echo "# config.sh" >> ${INSTALL}
  echo "echo \"Configure using 'config.sh' file\"" >> ${INSTALL}
fi
