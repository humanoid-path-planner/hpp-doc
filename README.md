#  Humanoid Path Planner

Copyright 2014 LAAS-CNRS

Author: Florent Lamiraux

##Description
Humanoid Path Planner is a software platform aimed at solving motion planning
problems for humanoid robots. It is also designed to solve classical (non
humanoid) path planning problems.

##Installation (Ubuntu 12.04 LTS)

1. install by apt-get (see http://wiki.ros.org/groovy/Installation/Ubuntu):
        
    
      sudo apt-get install ros-groovy-desktop-full ros-groovy-libccd asciidoc source-highlight git libomniorb4-dev omniorb-nameserver omniidl omniidl-python
    
2. Choose a directory on you file system and define the environment variable DEVEL_DIR with the full path to this directory. The packages will be cloned into $DEVEL_DIR/src, and installed to $DEVEL_DIR/install. Example:

      echo 'export DEVEL_DIR=/home/flamiraux/devel/hpp-stable/' >> ~/.bashrc

3. Copy Config and Makefile
        
      wget https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/master/doc/config.sh $DEVEL_DIR && wget https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/master/doc/Makefile $DEVEL_DIR/src
  
4. source the config.sh
    
      echo 'source $DEVEL_DIR/config.sh' >> ~/.bashrc

5. compile the project

      cd $DEVEL_DIR/src
      make all

