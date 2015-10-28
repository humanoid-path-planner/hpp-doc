#!/bin/bash

BRANCH=devel
if [ -z ${DEVEL_DIR} ]; then
  export DEVEL_DIR=/local/devel/hpp
fi

# Add ros repositories
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116

sudo sh -c 'echo "deb http://archive.ubuntu.com/ubuntu trusty universe" > /etc/apt/sources.list.d/trusty-universe.list'

sudo apt-get update && sudo apt-get --assume-yes upgrade

# Install dependencies

# FIXME: I do not know why this is not in the installed Ubuntu. Is wget missing in Ubuntu 14.04 
# or is it deboostrap that is not installing the good version ?
sudo apt-get --assume-yes install wget
# This is required by OpenSceneGraph and is usually installed with Ubuntu 14.04 and graphic card
# drivers.
sudo apt-get --assume-yes install doxygen freeglut3-dev

# From here, it is a standard HPP installation
sudo apt-get --assume-yes install autoconf g++ cmake libboost-dev liburdfdom-dev libassimp-dev ros-indigo-xacro ros-indigo-kdl-parser ros-indigo-common-msgs ros-indigo-tf ros-indigo-tf-conversions ros-indigo-libccd ros-indigo-octomap ros-indigo-resource-retriever ros-indigo-srdfdom ros-indigo-pr2-robot flex bison asciidoc source-highlight git libomniorb4-dev omniorb-nameserver omniidl omniidl-python libltdl-dev python-matplotlib libtinyxml2-dev liblog4cxx10-dev libltdl-dev
sudo apt-get --assume-yes build-dep openscenegraph

# hpp-gui dependencies
sudo apt-get --assume-yes install qt4-dev-tools libqt4-opengl-dev libqtgui4 oxygen-icon-theme

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
make hpp-manipulation-corba.install all hpp-gui.install
