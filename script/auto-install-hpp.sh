#!/bin/bash

BRANCH=euroc-devel
if [ -z ${DEVEL_DIR} ]; then
  export DEVEL_DIR=/local/devel/hpp
fi

# standard HPP installation
sudo apt-get --assume-yes install autoconf g++ cmake libboost-dev \
  liburdfdom-dev libassimp-dev ros-indigo-xacro ros-indigo-kdl-parser \
  ros-indigo-common-msgs ros-indigo-tf ros-indigo-tf-conversions ros-indigo-libccd \
  ros-indigo-octomap ros-indigo-resource-retriever ros-indigo-srdfdom \
  ros-indigo-pr2-robot flex bison asciidoc source-highlight git libomniorb4-dev \
  omniorb-nameserver omniidl omniidl-python libltdl-dev python-matplotlib \
  libtinyxml2-dev liblog4cxx10-dev libltdl-dev subversion
sudo apt-get --assume-yes build-dep openscenegraph

# hpp-gui dependencies
sudo apt-get --assume-yes install qt4-dev-tools libqt4-opengl-dev libqtgui4 oxygen-icon-theme graphviz

# Setup environment
mkdir --parents $DEVEL_DIR
mkdir --parents $DEVEL_DIR/src
mkdir --parents $DEVEL_DIR/install

# Get config script
wget -O $DEVEL_DIR/config.sh https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/${BRANCH}/doc/config.sh
wget -O $DEVEL_DIR/src/Makefile https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/${BRANCH}/doc/Makefile

source $DEVEL_DIR/config.sh

cd $DEVEL_DIR/src

make robot_state_chain_publisher.install
source ../config.sh
make doxygen-Release_1_8_10.install
make hpp-manipulation-corba.install all hpp-gui.install
