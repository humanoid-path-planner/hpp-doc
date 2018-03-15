#!/bin/bash

# Exit on error
set -e
HOST_DIST=$(lsb_release -s -c)
case $HOST_DIST in
  trusty)
    APT_DEP="autoconf g++ cmake libboost-dev liburdfdom-dev libassimp-dev \
      ros-indigo-xacro ros-indigo-kdl-parser ros-indigo-common-msgs \
      ros-indigo-tf ros-indigo-tf-conversions ros-indigo-libccd ros-indigo-octomap \
      ros-indigo-resource-retriever ros-indigo-srdfdom ros-indigo-pr2-description flex \
      bison asciidoc source-highlight git libomniorb4-dev omniorb-nameserver \
      omniidl omniidl-python libltdl-dev python-matplotlib libtinyxml2-dev \
      liblog4cxx10-dev libltdl-dev qt4-dev-tools libqt4-opengl-dev \
      libqtgui4 oxygen-icon-theme libopenscenegraph-dev"
    APT_BUILD_DEP=""
    CONFIG_FILE="ubuntu-14.04-indigo.sh"
    ;;
  xenial)
    APT_DEP="autoconf g++ cmake doxygen libboost-dev liburdfdom-dev \
      libassimp-dev ros-kinetic-xacro ros-kinetic-kdl-parser ros-kinetic-common-msgs \
      ros-kinetic-tf ros-kinetic-tf-conversions libccd-dev ros-kinetic-octomap \
      ros-kinetic-resource-retriever ros-kinetic-srdfdom ros-kinetic-pr2-description flex \
      bison asciidoc source-highlight git libomniorb4-dev omniorb-nameserver omniidl \
      omniidl-python libltdl-dev python-matplotlib libxml2 libtinyxml2-dev \
      liblog4cxx10-dev libltdl-dev qt4-dev-tools libqt4-opengl-dev libqtgui4 libqtwebkit-dev oxygen-icon-theme \
      libopenscenegraph-dev openscenegraph libpcre3-dev"
    APT_BUILD_DEP=""
    CONFIG_FILE="ubuntu-16.04-kinetic.sh"
    ;;
  *)
    echo "Unknow host distribution."
    exit 1
    ;;
esac

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
wget -q -O $DEVEL_HPP_DIR/config.sh https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/${BRANCH}/doc/config/${CONFIG_FILE}
wget -q -O $DEVEL_HPP_DIR/src/Makefile https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/${BRANCH}/doc/Makefile

source $DEVEL_HPP_DIR/config.sh

cd $DEVEL_HPP_DIR/src

make -s -e robot_state_chain_publisher.install
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
