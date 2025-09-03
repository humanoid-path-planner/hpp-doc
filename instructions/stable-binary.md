## Binary installation on ubuntu-24.04 64 bit

To install all the packages on ubuntu 24.04 LTS 64 bit, you should do the following steps:

  1. install some basic tools

      ```bash
      sudo apt-get install git cmake curl doxygen lsb-release make wget
      ```

  2. install robotpkg: follow [the robotpkg installation website](http://robotpkg.openrobots.org/debian.html).

  3. install HPP:

    ```bash
    pyver=312
    sudo apt-get install robotpkg-py${pyver}-hpp-manipulation-corba robotpkg-py${pyver}-qt5-hpp-gepetto-viewer
    ```

  4. install (optionnal) extra packages for demonstrations:

    - Tutorials:

      ```bash
      sudo apt-get install robotpkg-py${pyver}-hpp-tutorial robotpkg-py${pyver}-qt5-hpp-practicals
      ```

    - GUI:

      ```bash
      sudo apt-get install robotpkg-py${pyver}-qt5-hpp-gui robotpkg-py${pyver}-qt5-hpp-plot
      ```

    - Some robot descriptions:

      ```bash
      sudo apt-get install robotpkg-py${pyver}-hpp-environments robotpkg-romeo-description
      ```

  5. Choose a directory on your file system and define the environment
     variable `DEVEL_HPP_DIR` with the full path to this directory.
     - the documentation will be cloned into `$DEVEL_HPP_DIR/src`,
     - the documentation will be installed in `$DEVEL_HPP_DIR/install`.
     It is recommanded to set variable `DEVEL_HPP_DIR` in your `.bashrc` for future use.

    ```bash
    mkdir -p $DEVEL_HPP_DIR/src
    ```
  6. Copy Config and Makefile

    ```bash
    wget -O $DEVEL_HPP_DIR/config.sh https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/stable/doc/config/ubuntu-24.04.sh
    wget -O $DEVEL_HPP_DIR/src/Makefile https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/stable/makefiles/devel.mk
    ```

  7. cd into `$DEVEL_HPP_DIR` and type

    ```bash
    cd ${DEVEL_HPP_DIR}
    source config.sh
    ```

  8. cd into `$DEVEL_HPP_DIR/src` and type

    ```bash
    cd ${DEVEL_HPP_DIR}/src
    make hpp-doc.install hpp-practicals.checkout hpp_tutorial.checkout
    ```

  10. open `$DEVEL_HPP_DIR/install/share/doc/hpp-doc/index.html` in a web brower and you
  will have access to the documentation of most packages.

## Binary installation on ubuntu-22.04 64 bit

To install all the packages on ubuntu 22.04 LTS 64 bit, you should do the following steps:

  11. install robotpkg: follow [the robotpkg installation website](http://robotpkg.openrobots.org/debian.html).

  12. install HPP:

    ```bash
    pyver=310
    sudo apt-get install robotpkg-py${pyver}-hpp-manipulation-corba robotpkg-py${pyver}-qt5-hpp-gepetto-viewer
    ```

  13. install (optionnal) extra packages for demonstrations:

    - Tutorials:

      ```bash
      sudo apt-get install robotpkg-py${pyver}-hpp-tutorial
      ```

    - GUI:

      ```bash
      sudo apt-get install robotpkg-py${pyver}-qt5-hpp-gui robotpkg-py${pyver}-qt5-hpp-plot
      ```

    - Some robot descriptions:

      ```bash
      sudo apt-get install robotpkg-py${pyver}-hpp-environments robotpkg-romeo-description
      ```

    - documentation:

      ```bash
      sudo apt-get install robotpkg-hpp-doc
      ```

  14. setup your environment variables by adding the following lines (fix Python version if necessary) to your `.bashrc`:

    ```bash
    export PATH=/opt/openrobots/bin${!PATH:-:}${PATH}
    export LD_LIBRARY_PATH=/opt/openrobots/lib${!LD_LIBRARY_PATH:-:}${LD_LIBRARY_PATH}
    export PYTHONPATH=/opt/openrobots/lib/python3.10/site-packages${!PYTHONPATH:-:}${PYTHONPATH}
    export ROS_PACKAGE_PATH=/opt/openrobots/share${!ROS_PACKAGE_PATH:-:}${ROS_PACKAGE_PATH}

    export CMAKE_PREFIX_PATH=/opt/openrobots${!CMAKE_PREFIX_PATH:-:}${CMAKE_PREFIX_PATH}
    export PKG_CONFIG_PATH=/opt/openrobots${!PKG_CONFIG_PATH:-:}${PKG_CONFIG_PATH}
    ```

  15. open `/opt/openrobots/share/doc/hpp-doc/index.html` in a web brower and you
  will have access to the documentation of most packages.

## Binary installation on ubuntu-20.04 64 bit with ros-noetic

To install all the packages on ubuntu 20.04 LTS 64 bit, you should do the following steps:

  1. install ROS-noetic: follow steps 1.1 to 1.3 of [the ROS installation website.](http://wiki.ros.org/noetic/Installation/Ubuntu).

  2. install robotpkg: follow [the robotpkg installation website](http://robotpkg.openrobots.org/debian.html).

  3. install HPP:

    ```bash
    pyver=38
    sudo apt-get install robotpkg-py${pyver}-hpp-manipulation-corba robotpkg-py${pyver}-qt5-hpp-gepetto-viewer
    ```

  4. install (optionnal) extra packages for demonstrations:

    - Tutorials:

      ```bash
      sudo apt-get install robotpkg-py${pyver}-hpp-tutorial
      ```

    - GUI:

      ```bash
      sudo apt-get install robotpkg-py${pyver}-qt5-hpp-gui robotpkg-py${pyver}-qt5-hpp-plot
      ```

    - Some robot descriptions:

      ```bash
      sudo apt-get install ros-noetic-pr2-description robotpkg-py${pyver}-hpp-environments robotpkg-romeo-description
      ```

    - documentation:

      ```bash
      sudo apt-get install robotpkg-hpp-doc
      ```

  5. setup your environment variables by adding the following lines (fix Python version if necessary) to your `.bashrc`:

    ```bash
    source /opt/ros/noetic/setup.bash

    export PATH=/opt/openrobots/bin${!PATH:-:}${PATH}
    export LD_LIBRARY_PATH=/opt/openrobots/lib${!LD_LIBRARY_PATH:-:}${LD_LIBRARY_PATH}
    export PYTHONPATH=/opt/openrobots/lib/python2.7/site-packages${!PYTHONPATH:-:}${PYTHONPATH}
    export ROS_PACKAGE_PATH=/opt/openrobots/share${!ROS_PACKAGE_PATH:-:}${ROS_PACKAGE_PATH}

    export CMAKE_PREFIX_PATH=/opt/openrobots${!CMAKE_PREFIX_PATH:-:}${CMAKE_PREFIX_PATH}
    export PKG_CONFIG_PATH=/opt/openrobots${!PKG_CONFIG_PATH:-:}${PKG_CONFIG_PATH}
    ```

  6. open `/opt/openrobots/share/doc/hpp-doc/index.html` in a web brower and you
  will have access to the documentation of most packages.

