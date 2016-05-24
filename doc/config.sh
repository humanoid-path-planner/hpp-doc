export INSTALL_DIR=$DEVEL_DIR/install
export PATH=$INSTALL_DIR/sbin:$INSTALL_DIR/bin:$PATH
export PKG_CONFIG_PATH=$INSTALL_DIR/lib/pkgconfig/:/opt/ros/indigo/lib/pkgconfig

export PYTHONPATH=$INSTALL_DIR/lib/python2.7/site-packages:$INSTALL_DIR/lib/python2.7/dist-packages:/opt/ros/indigo/lib/python2.7/dist-packages:$PYTHONPATH

export LD_LIBRARY_PATH=$INSTALL_DIR/lib:/opt/ros/indigo/lib:$LD_LIBRARY_PATH

if [ -f $INSTALL_DIR/setup.bash ]; then
    source $INSTALL_DIR/setup.bash
else
    source /opt/ros/indigo/setup.bash
fi
