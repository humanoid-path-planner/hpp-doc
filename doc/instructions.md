## Installation on ubuntu-14.04 64 bit with ros-indigo

**Warning: this version has stopped receiving updates. Please consider using a more recent version**

To install all the packages on ubuntu 14.04 LTS 64 bit, you should do the following steps:

  1. install ROS-indigo: follow steps 1.1 to 1.3 of [the ROS installation website.](http://wiki.ros.org/indigo/Installation/Ubuntu).

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
    - ros-indigo-pr2-description
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
    - libqtwebkit-dev
    - oxygen-icon-theme
    - libopenscenegraph-dev

    ```bash
sudo apt-get install autoconf g++ cmake libboost-dev liburdfdom-dev libassimp-dev ros-indigo-xacro ros-indigo-kdl-parser ros-indigo-common-msgs ros-indigo-tf ros-indigo-tf-conversions ros-indigo-libccd ros-indigo-octomap ros-indigo-resource-retriever ros-indigo-srdfdom ros-indigo-pr2-description flex bison asciidoc source-highlight git libomniorb4-dev omniorb-nameserver omniidl omniidl-python libltdl-dev python-matplotlib libtinyxml2-dev liblog4cxx10-dev libltdl-dev qt4-dev-tools libqt4-opengl-dev libqtgui4 libqtwebkit-dev oxygen-icon-theme libopenscenegraph-dev
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
wget -O $DEVEL_HPP_DIR/config.sh https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/ubuntu-14.04/doc/config/ubuntu-14.04-indigo.sh
wget -O $DEVEL_HPP_DIR/src/Makefile https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/ubuntu-14.04/doc/Makefile
    ```

  5. cd into `$DEVEL_HPP_DIR` and type

    ```bash
cd ${DEVEL_HPP_DIR}
source config.sh
    ```

  6. cd into `$DEVEL_HPP_DIR/src` and type

    ```bash
cd ${DEVEL_HPP_DIR}/src
make robot_state_chain_publisher.install;
source ../config.sh;
make all
    ```

##Documentation

  Open `$DEVEL_HPP_DIR/install/share/doc/hpp-doc/index.html` in a web brower and you
  will have access to the documentation of most packages.
