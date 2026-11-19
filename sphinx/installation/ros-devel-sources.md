# Source installation with ROS

To compile all the packages in a ROS 2 workspace, follow these steps. They are
the steps run by [ros/Dockerfile](https://github.com/humanoid-path-planner/hpp-doc/blob/devel/ros/Dockerfile).

## 1. Install ROS 2

Choose, install and activate a ROS 2 distribution: <https://www.ros.org/blog/getting-started/>

## 2. Choose a workspace directory

Choose a directory on your file system, which we will call `DEVEL_HPP_DIR`.
The packages will be cloned into `$DEVEL_HPP_DIR/src` and installed into
`$DEVEL_HPP_DIR/install`.

```bash
mkdir -p $DEVEL_HPP_DIR
cd $DEVEL_HPP_DIR
```

## 3. Clone the packages

Download our repos file and clone the packages with [vcs2l](https://github.com/ros-infrastructure/vcs2l):

```bash
wget https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/devel/ros/devel.repos
vcs import --input devel.repos
```

## 4. Install the dependencies

If rosdep has never been initialized on your machine, run `sudo rosdep init`
and `rosdep update` first.

```bash
rosdep install --from-paths src --ignore-src -r -y
```

## 5. Compile all packages with [colcon](https://colcon.readthedocs.io/)

```bash
colcon build
```

## 6. Activate the install prefix of the workspace

```bash
source install/setup.bash
```
