export PATH=$DEVEL_DIR/install/sbin:$DEVEL_DIR/install/bin:/opt/ros/indigo/bin:$PATH
export PKG_CONFIG_PATH=$DEVEL_DIR/install/lib/pkgconfig/:/opt/ros/indigo/lib/pkgconfig

export PYTHONPATH=$DEVEL_DIR/install/lib/python2.7/site-packages:$DEVEL_DIR/install/lib/python2.7/dist-packages:/opt/ros/indigo/lib/python2.7/dist-packages:$PYTHONPATH

export LD_LIBRARY_PATH=$DEVEL_DIR/install/lib:$DEVEL_DIR/install/lib64:/opt/ros/indigo/lib:$LD_LIBRARY_PATH

if [ -f $DEVEL_DIR/install/setup.bash ]; then
    source $DEVEL_DIR/install/setup.bash
else
    source /opt/ros/indigo/setup.bash
fi
# Make sure that /opt/ros/indigo/setup.bash is in the ROS_PACKAGE_PATH,
# otherwise, you should add it by hand in the line below.
export ROS_PACKAGE_PATH=$DEVEL_DIR/install/share:$ROS_PACKAGE_PATH