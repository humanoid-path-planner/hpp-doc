## Binary installation on ubuntu-18.04 64 bit with ros-melodic

To install all the packages on ubuntu 18.04 LTS 64 bit, you should do the following steps:

  1. install ROS-melodic: follow steps 1.1 to 1.3 of [the ROS installation website.](http://wiki.ros.org/melodic/Installation/Ubuntu).

  2. install robotpkg: follow [the robotpkg installation website](http://robotpkg.openrobots.org/debian.html).

  3. install HPP: `sudo apt-get install robotpkg-hpp-tutorial robotpkg-osg-dae`

  4. install (optionnal) extra packages for demonstrations:
     `sudo apt-get install robotpkg-hpp-tutorial robotpkg-osg-dae ros-melodic-pr2-description robotpkg-hpp-environments robotpkg-romeo-description

  5. setup your environment variables by adding the following lines to your `.bashrc`:

    ```bash
    source /opt/ros/melodic/setup.bash

    export PATH=/opt/openrobots/bin${!PATH:-:}${PATH}
    export LD_LIBRARY_PATH=/opt/openrobots/lib${!LD_LIBRARY_PATH:-:}${LD_LIBRARY_PATH}
    export PYTHONPATH=/opt/openrobots/lib/python2.7/site-packages${!PYTHONPATH:-:}${PYTHONPATH}
    export ROS_PACKAGE_PATH=/opt/openrobots/share${!ROS_PACKAGE_PATH:-:}${ROS_PACKAGE_PATH}

    export CMAKE_PREFIX_PATH=/opt/openrobots${!CMAKE_PREFIX_PATH:-:}${CMAKE_PREFIX_PATH}
    export PKG_CONFIG_PATH=/opt/openrobots${!PKG_CONFIG_PATH:-:}${PKG_CONFIG_PATH}
    ```

  6. open `/opt/openrobots/share/doc/hpp-doc/index.html` in a web brower and you
  will have access to the documentation of most packages.

## Source installation on ubuntu-18.04 64 bit with ros-melodic

To install all the packages on ubuntu 18.04 LTS 64 bit, you should do the following steps:

  1. install ROS-melodic: follow steps 1.1 to 1.3 of [the ROS installation website.](http://wiki.ros.org/melodic/Installation/Ubuntu).

  2. install robotpkg: follow [the robotpkg installation website](http://robotpkg.openrobots.org/debian.html).

  3. install by apt-get
  ```bash
    sudo apt-get install \
      g++ \
      cmake \
      doxygen \
      libboost-dev \
      liburdfdom-dev \
      libassimp-dev \
      libeigen3-dev \
      libgraphviz-dev \
      robotpkg-qpoases+doc \
      robotpkg-roboptim-core \
      robotpkg-roboptim-trajectory \
      robotpkg-romeo-description \
      robotpkg-py36-omniorbpy \
      ros-melodic-xacro \
      libccd-dev \
      ros-melodic-octomap \
      ros-melodic-resource-retriever \
      ros-melodic-srdfdom \
      ros-melodic-pr2-description \
      git \
      libomniorb4-dev \
      omniorb-nameserver \
      omniidl \
      omniidl-python \
      libltdl-dev \
      python-matplotlib \
      libxml2 \
      libtinyxml2-dev \
      qt4-dev-tools \
      libqt4-opengl-dev \
      libqtgui4 \
      libqtwebkit-dev \
      oxygen-icon-theme \
      libopenscenegraph-dev \
      openscenegraph \
      libpcre3-dev \
      wget \
      libcdd-dev
    ```

  4. Choose a directory on your file system and define the environment
     variable `DEVEL_HPP_DIR` with the full path to this directory.
     - the packages will be cloned into `$DEVEL_HPP_DIR/src`,
     - the packages will be installed in `$DEVEL_HPP_DIR/install`.
     It is recommanded to set variable `DEVEL_HPP_DIR` in your `.bashrc` for future use.

    ```bash
    mkdir -p $DEVEL_HPP_DIR/src
    ```
  5. Copy Config and Makefile

    ```bash
    wget -O $DEVEL_HPP_DIR/config.sh https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/devel/doc/config/ubuntu-18.04-melodic.sh
    wget -O $DEVEL_HPP_DIR/src/Makefile https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/devel/doc/Makefile
    ```

  6. cd into `$DEVEL_HPP_DIR` and type

    ```bash
    cd ${DEVEL_HPP_DIR}
    source config.sh
    ```

  7. cd into `$DEVEL_HPP_DIR/src` and type

    ```bash
    cd ${DEVEL_HPP_DIR}/src
    make iai_maps.install;
    source ../config.sh;
    make all
    ```

  8. open `$DEVEL_HPP_DIR/install/share/doc/hpp-doc/index.html` in a web brower and you
  will have access to the documentation of most packages.
