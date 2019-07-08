## Binary installation on ubuntu-16.04 64 bit with ros-kinetic

To install all the packages on ubuntu 16.04 LTS 64 bit, you should do the following steps:

  1. install ROS-kinetic: follow steps 1.1 to 1.3 of [the ROS installation website.](http://wiki.ros.org/kinetic/Installation/Ubuntu).

  2. install robotpkg: follow [the robotpkg installation website](http://robotpkg.openrobots.org/debian.html).

  3. install HPP: `sudo apt-get install robotpkg-hpp-tutorial robotpkg-osg-dae`

  4. install (optionnal) extra packages for demonstrations:
     `sudo apt-get install robotpkg-hpp-tutorial robotpkg-osg-dae ros-kinetic-pr2-description robotpkg-hpp-environments robotpkg-hpp-universal-robot robotpkg-romeo-description robotpkg-ros-baxter-common`

  4. setup your environment variables by adding the following lines to your `.bashrc`:

    ```bash
    source /opt/ros/kinetic/setup.bash

    export PATH=/opt/openrobots/bin${!PATH:-:}${PATH}
    export LD_LIBRARY_PATH=/opt/openrobots/lib${!LD_LIBRARY_PATH:-:}${LD_LIBRARY_PATH}
    export PYTHONPATH=/opt/openrobots/lib/python2.7/site-packages${!PYTHONPATH:-:}${PYTHONPATH}
    export ROS_PACKAGE_PATH=/opt/openrobots/share${!ROS_PACKAGE_PATH:-:}${ROS_PACKAGE_PATH}

    export CMAKE_PREFIX_PATH=/opt/openrobots${!CMAKE_PREFIX_PATH:-:}${CMAKE_PREFIX_PATH}
    export PKG_CONFIG_PATH=/opt/openrobots${!PKG_CONFIG_PATH:-:}${PKG_CONFIG_PATH}
    ```

  5. open `/opt/openrobots/share/doc/hpp-doc/index.html` in a web brower and you
  will have access to the documentation of most packages.
