export INSTALL_HPP_DIR=$DEVEL_HPP_DIR/install
export ROBOTPKG=/opt/openrobots

export PATH=$INSTALL_HPP_DIR/sbin:$INSTALL_HPP_DIR/bin:$ROBOTPKG/bin:$ROBOTPKG/sbin:$PATH
export PKG_CONFIG_PATH=$INSTALL_HPP_DIR/lib/pkgconfig/:$ROBOTPKG/lib/pkgconfig

export PYTHONPATH=$INSTALL_HPP_DIR/lib/python3.10/site-packages:$ROBOTPKG/lib/python3.10/site-packages:$PYTHONPATH

export LD_LIBRARY_PATH=$INSTALL_HPP_DIR/lib:$ROBOTPKG/lib:$INSTALL_HPP_DIR/lib64:$LD_LIBRARY_PATH

# Make sure that /opt/ros/noetic is in the ROS_PACKAGE_PATH,
# otherwise, you should add it by hand in the line below.
export ROS_PACKAGE_PATH=$INSTALL_HPP_DIR/share:$ROBOTPKG/share
export CMAKE_PREFIX_PATH=$INSTALL_HPP_DIR:$ROBOTPKG:/usr

if [ -f "${INSTALL_HPP_DIR}/etc/hpp-tools/bashrc" ]; then
    source "${INSTALL_HPP_DIR}/etc/hpp-tools/bashrc"
fi
