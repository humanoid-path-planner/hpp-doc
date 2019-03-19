export INSTALL_HPP_DIR=$DEVEL_HPP_DIR/install
export ROBOTPKG=/opt/openrobots
export ROS=/opt/ros/kinetic

export PATH=$INSTALL_HPP_DIR/sbin:$INSTALL_HPP_DIR/bin:$ROS/bin:$PATH
export PKG_CONFIG_PATH=$INSTALL_HPP_DIR/lib/pkgconfig/:$ROS/lib/pkgconfig:$ROBOTPKG/lib/pkgconfig

export PYTHONPATH=$INSTALL_HPP_DIR/lib/python2.7/site-packages:$INSTALL_HPP_DIR/lib/python2.7/dist-packages:$ROS/lib/python2.7/dist-packages:$PYTHONPATH

export LD_LIBRARY_PATH=$INSTALL_HPP_DIR/lib:$INSTALL_HPP_DIR/lib64:$ROS/lib:$ROBOTPKG/lib:$LD_LIBRARY_PATH

if [ -f $INSTALL_HPP_DIR/setup.bash ]; then
    source $INSTALL_HPP_DIR/setup.bash
else
    source $ROS/setup.bash
fi
# Make sure that /opt/ros/kinetic/setup.bash is in the ROS_PACKAGE_PATH,
# otherwise, you should add it by hand in the line below.
export ROS_PACKAGE_PATH=$INSTALL_HPP_DIR/share:$ROBOTPKG/share:$ROS_PACKAGE_PATH

if [ -f "${INSTALL_HPP_DIR}/etc/hpp-tools/bashrc" ]; then
    source "${INSTALL_HPP_DIR}/etc/hpp-tools/bashrc"
fi
export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:$ROBOTPKG
