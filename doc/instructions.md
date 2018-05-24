## Installation on ubuntu-16.04 64 bit with ros-kinetic

To install all the packages on ubuntu 16.04 LTS 64 bit, you should do the following steps:

  1. install ROS-kinetic: follow steps 1.1 to 1.3 of [the ROS installation website.](http://wiki.ros.org/kinetic/Installation/Ubuntu).

  2. install by apt-get
    - autoconf
    - g++
    - cmake
    - doxygen
    - libboost-dev
    - liburdfdom-dev
    - libassimp-dev
    - libeigen3-dev
    - ros-kinetic-xacro
    - ros-kinetic-kdl-parser
    - ros-kinetic-common-msgs
    - ros-kinetic-tf
    - ros-kinetic-tf-conversions
    - ros-kinetic-libccd
    - ros-kinetic-octomap
    - ros-kinetic-resource-retriever
    - ros-kinetic-urdfdom-py
    - ros-kinetic-srdfdom
    - ros-kinetic-pr2-description
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
    - libxml2
    - libtinyxml2-dev
    - liblog4cxx10-dev
    - libltdl-dev
    - qt4-dev-tools
    - libqt4-opengl-dev
    - libqtgui4
    - libqtwebkit-dev
    - oxygen-icon-theme
    - libopenscenegraph-dev
    - openscenegraph
    - libpcre3-dev

    ```bash
sudo apt-get install autoconf g++ cmake doxygen libboost-dev liburdfdom-dev libassimp-dev libeigen3-dev ros-kinetic-xacro ros-kinetic-kdl-parser ros-kinetic-common-msgs ros-kinetic-tf ros-kinetic-tf-conversions libccd-dev ros-kinetic-octomap ros-kinetic-resource-retriever ros-kinetic-srdfdom ros-kinetic-pr2-description flex bison asciidoc source-highlight git libomniorb4-dev omniorb-nameserver omniidl omniidl-python libltdl-dev python-matplotlib libxml2 libtinyxml2-dev liblog4cxx10-dev libltdl-dev qt4-dev-tools libqt4-opengl-dev libqtgui4 libqtwebkit-dev oxygen-icon-theme libopenscenegraph-dev openscenegraph libpcre3-dev
    ```

  3. Choose a directory on you file system and define the environment
     variable `DEVEL_HPP_DIR` with the full path to this directory.
     - the packages will be cloned into `$DEVEL_HPP_DIR/src`,
     - the packages will be installed in `$DEVEL_HPP_DIR/install`.
     It is recommanded to set variable `DEVEL_HPP_DIR` in your `.bashrc` for future use.

    ```bash
    mkdir -p $DEVEL_HPP_DIR/src
    ```
  4. Copy Config and Makefile

    ```bash
wget -O $DEVEL_HPP_DIR/config.sh https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/master/doc/config/ubuntu-16.04-kinetic.sh
wget -O $DEVEL_HPP_DIR/src/Makefile https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/master/doc/Makefile
    ```

  5. cd into `$DEVEL_HPP_DIR` and type

    ```bash
cd ${DEVEL_HPP_DIR}
source config.sh
    ```

  6. cd into `$DEVEL_HPP_DIR/src` and type

    ```bash
cd ${DEVEL_HPP_DIR}/src
make iai_maps.install;
source ../config.sh;
make all
    ```

##Documentation

  Open `$DEVEL_HPP_DIR/install/share/doc/hpp-doc/index.html` in a web brower and you
  will have access to the documentation of most packages.
