echo "Setup robotpkg"

source /opt/ros/noetic/setup.bash

export PATH=/opt/openrobots/bin:${PATH}
export LD_LIBRARY_PATH=/opt/openrobots/lib:${LD_LIBRARY_PATH}
export PYTHONPATH=/opt/openrobots/lib/python3.8/site-packages:${PYTHONPATH}
export ROS_PACKAGE_PATH=/opt/openrobots/share:${ROS_PACKAGE_PATH}

export CMAKE_PREFIX_PATH=/opt/openrobots:${CMAKE_PREFIX_PATH}
export PKG_CONFIG_PATH=/opt/openrobots:${PKG_CONFIG_PATH}
