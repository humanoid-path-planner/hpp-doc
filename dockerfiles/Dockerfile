FROM ros:noetic

ADD http://robotpkg.openrobots.org/packages/debian/robotpkg.key /
RUN --mount=type=cache,sharing=locked,target=/var/cache/apt \
    --mount=type=cache,sharing=locked,target=/var/lib/apt \
    apt-key add /robotpkg.key \
 && echo "deb [arch=amd64] http://robotpkg.openrobots.org/packages/debian/pub focal robotpkg" > /etc/apt/sources.list.d/robotpkg.list \
 && apt-get update -y \
 && DEBIAN_FRONTEND=noninteractive apt-get install -qqy \
    oxygen-icon-theme \
    robotpkg-py38-hpp-environments \
    robotpkg-py38-hpp-manipulation-corba \
    robotpkg-py38-qt5-hpp-gepetto-viewer \
    robotpkg-py38-qt5-hpp-gui \
    robotpkg-py38-qt5-hpp-plot \
    ros-noetic-pr2-description

RUN echo "[pyplugins]\nhpp.gui=true" >> /opt/openrobots/etc/gepetto-gui/settings.conf \
 && echo "[pyplugins]\nhpp.gui=true" >> /opt/openrobots/etc/gepetto-gui/basic.conf

ENV PATH=/opt/openrobots/bin:${PATH} \
    LD_LIBRARY_PATH=/opt/openrobots/lib:${LD_LIBRARY_PATH} \
    PYTHONPATH=/opt/openrobots/lib/python3.8/site-packages:${PYTHONPATH} \
    ROS_PACKAGE_PATH=/opt/openrobots/share:${ROS_PACKAGE_PATH} \
    CMAKE_PREFIX_PATH=/opt/openrobots:${CMAKE_PREFIX_PATH} \
    PKG_CONFIG_PATH=/opt/openrobots:${PKG_CONFIG_PATH}
