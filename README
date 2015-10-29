#  Humanoid Path Planner

Copyright 2014 LAAS-CNRS

Author: Florent Lamiraux

##Description
Humanoid Path Planner is a software platform aimed at solving motion planning
problems for humanoid robots. It is also designed to solve classical (non
humanoid) path planning problems.

##Installation on ubuntu-14.04 64 bit with ros-indigo

To install all the packages on ubuntu 14.04 LTS 64 bit, you should do the following steps:

  1. install ROS-indigo (steps 1.1 - 1.3)
    - see http://wiki.ros.org/indigo/Installation/Ubuntu.

  2. install by apt-get
    - autoconf
    - g++
    - cmake
    - libboost-dev
    - liburdfdom-dev
    - libassimp-dev
    - ros-indigo-xacro
    - ros-indigo-kdl-parser
    - ros-indigo-common-msgs
    - ros-indigo-tf
    - ros-indigo-tf-conversions
    - ros-indigo-libccd
    - ros-indigo-octomap
    - ros-indigo-resource-retriever
    - ros-indigo-urdfdom-py
    - ros-indigo-srdfdom
    - ros-indigo-pr2-robot
    - flex
    - bison
    - asciidoc
    - source-highlight
    - git
    - libomniorb4-dev
    - omniorb-nameserver
    - omniidl
    - omniidl-python
    - libltdl-dev
    - python-matplotlib
    - libtinyxml2-dev
    - liblog4cxx10-dev
    - libltdl-dev
    - qt4-dev-tools
    - libqt4-opengl-dev
    - libqtgui4
    - oxygen-icon-theme

        sudo apt-get install autoconf g++ cmake libboost-dev liburdfdom-dev libassimp-dev ros-indigo-xacro ros-indigo-kdl-parser ros-indigo-common-msgs ros-indigo-tf ros-indigo-tf-conversions ros-indigo-libccd ros-indigo-octomap ros-indigo-resource-retriever ros-indigo-srdfdom ros-indigo-pr2-robot flex bison asciidoc source-highlight git libomniorb4-dev omniorb-nameserver omniidl omniidl-python libltdl-dev python-matplotlib libtinyxml2-dev liblog4cxx10-dev libltdl-dev qt4-dev-tools libqt4-opengl-dev libqtgui4 oxygen-icon-theme

  2. install dependencies of openscenegraph:

	sudo apt-get build-dep openscenegraph

  3. Choose a directory on you file system and define the environment
     variable DEVEL_DIR with the full path to this directory.
     - the packages will be cloned into $DEVEL_DIR/src,
     - the packages will be installed in $DEVEL_DIR/install.
     It is recommanded to set variable DEVEL_DIR in your .bashrc for future use.

  4. Copy Config and Makefile
        
        wget -O $DEVEL_DIR/config.sh https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/euroc/doc/config.sh

	wget -O $DEVEL_DIR/src/Makefile https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/euroc/doc/Makefile

  5. edit $DEVEL_DIR/src/Makefile and fill in lines

    - SVN_USERNAME=
    - SVN_PASSWORD=

    with the appropriate information to access svn repository of dlr.

  6. cd into $DEVEL_DIR and type

    source config.sh

  7. cd into $DEVEL_DIR/src and type

    make robot_state_chain_publisher.install;
    source ../config.sh;
    make all

##Documentation

  Open $DEVEL_DIR/install/share/doc/hpp-doc/index.html in a web brower and you
  will have access to the documentation of most packages.

  Click on tutotial in the left panel to start learning about the software.
