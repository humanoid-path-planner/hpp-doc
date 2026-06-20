## Source installation with ROS

To compile all the packages in a ROS workspace, you can follow these steps:

  1. Choose, setup, and activate a ROS distribution: <https://www.ros.org/blog/getting-started/>

  2. Choose a directory on your file system which we will call `DEVEL_HPP_DIR`.
     - the packages will be cloned into `$DEVEL_HPP_DIR/src`,
     - the packages will be installed in `$DEVEL_HPP_DIR/install`.

     Create that directory and enter inside

  3. Download our repos file to clone HPP packages with [vcs2l](https://github.com/ros-infrastructure/vcs2l):

    ```bash
    mkdir -p $DEVEL_HPP_DIR/src
    wget -O $DEVEL_HPP_DIR/hpp.repos https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/devel/ros/devel.repos
    vcs import --input hpp.repos src
    ```

  3. Compile all packages with [colcon](https://colcon.readthedocs.io/):

    ```bash
    colcon build
    ```

  4. Activate the install prefix of the workspace

    ```bash
    source install/setup.bash
    ```
