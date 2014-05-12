#  Humanoid Path Planner

Copyright 2014 LAAS-CNRS

Author: Florent Lamiraux

##Description
Humanoid Path Planner is a software platform aimed at solving motion planning
problems for humanoid robots. It is also designed to solve classical (non
humanoid) path planning problems.

##Installation

To install all the packages under ubuntu 12.04 LTS, you should do the following
steps:

  1. install by apt-get (see http://wiki.ros.org/groovy/Installation/Ubuntu)
    - ros-groovy-desktop-full,
    - ros-groovy-libccd,
    - asciidoc,
    - source-highlight,
    - git,
    - libomniorb4-dev,
    - omniorb-nameserver,
    - omniidl,
    - omniidl-python


        sudo apt-get install ros-groovy-desktop-full ros-groovy-libccd asciidoc source-highlight git libomniorb4-dev omniorb-nameserver omniidl omniidl-python

  2. Choose a directory on you file system and define the environment
     variable DEVEL_DIR with the full path to this directory.
     - the packages will be cloned into $DEVEL_DIR/src,
     - the packages will be installed in $DEVEL_DIR/install.
     It is recommanded to set variable DEVEL_DIR in your .bashrc for future use.

  3. Copy Config and Makefile
        
        wget https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/master/doc/config.sh $DEVEL_DIR && wget https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/master/doc/Makefile $DEVEL_DIR/src
  
  4. cd into $DEVEL_DIR and type

    source config.sh

  5. cd into $DEVEL_DIR/src and type

    make all.

##Documentation

  Open $DEVEL_DIR/install/share/doc/hpp-doc/index.html in a web brower and you
  will have access to the documentation of most packages.
