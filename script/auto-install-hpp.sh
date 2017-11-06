#!/bin/bash

# Exit on error
set -e

APT_DEP="autoconf g++ cmake libboost-dev liburdfdom-dev libassimp-dev \
ros-indigo-xacro ros-indigo-kdl-parser ros-indigo-common-msgs \
ros-indigo-tf ros-indigo-tf-conversions ros-indigo-libccd ros-indigo-octomap \
ros-indigo-resource-retriever ros-indigo-srdfdom ros-indigo-pr2-description flex \
bison asciidoc source-highlight git libomniorb4-dev omniorb-nameserver \
omniidl omniidl-python libltdl-dev python-matplotlib libtinyxml2-dev \
liblog4cxx10-dev libltdl-dev qt4-dev-tools libqt4-opengl-dev \
libqtgui4 oxygen-icon-theme libopenscenegraph-dev"
APT_BUILD_DEP=""

MAKE_TARBALL=false

BRANCH=devel
if [ -z ${DEVEL_DIR} ]; then
  export DEVEL_DIR=/local/devel/hpp
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
    --help)
      echo "Options are"
      echo "--mktar:   \tmake tar balls after compilation"
      echo "--show-dep:\tshow dependencies resolved by aptitude"
      echo "-v:        \tshow variables and ask for confirm (must be last arg)"
      exit 0
      ;;
    -v)
      for v in "DEVEL_DIR" "BUILD_TYPE" "MAKE_TARBALL"
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

# standard HPP installation
sudo apt-get update -qqy
sudo apt-get --assume-yes install ${APT_DEP}
sudo apt-get --assume-yes build-dep ${APT_BUILD_DEP}

# Setup environment
mkdir --parents $DEVEL_DIR
mkdir --parents $DEVEL_DIR/src
mkdir --parents $DEVEL_DIR/install

# Get config script
wget -O $DEVEL_DIR/config.sh https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/${BRANCH}/doc/config.sh
wget -O $DEVEL_DIR/src/Makefile https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/${BRANCH}/doc/Makefile

source $DEVEL_DIR/config.sh

cd $DEVEL_DIR/src

make -e robot_state_chain_publisher.install
source ../config.sh
make -e -s -j4 all

if [ ${MAKE_TARBALL} = true ]; then
  cd $DEVEL_DIR/
  mkdir tarball
  SUFFIX="${BRANCH}-`date +%Y%m%d`-${BUILD_TYPE}"
  tar czf "tarball/hpp.src.${SUFFIX}.tar.gz" src/ install/ config.sh
  tar czf "tarball/hpp.${SUFFIX}.tar.gz" install/ config.sh
  INSTALL="$DEVEL_DIR/tarball/check.${SUFFIX}.sh"
  echo "#!/bin/bash" > ${INSTALL}
  echo "# Dependencies" >> ${INSTALL}
  echo "sudo apt-get install $APT_DEP" >> ${INSTALL}
  echo "sudo apt-get build-dep $APT_BUILD_DEP" >> ${INSTALL}
  echo "" >> ${INSTALL}
  echo "# config.sh" >> ${INSTALL}
  echo "echo \"Configure using 'config.sh' file\"" >> ${INSTALL}
fi
