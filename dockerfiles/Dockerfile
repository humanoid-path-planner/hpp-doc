from ros:noetic

run apt update && apt install -qy curl

env DEBIAN_FRONTEND=noninteractive

run curl http://robotpkg.openrobots.org/packages/debian/robotpkg.key | apt-key add - \
  && curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

run echo "deb [arch=amd64] http://robotpkg.openrobots.org/packages/debian/pub focal robotpkg" > /etc/apt/sources.list.d/robotpkg.list
run apt update && apt install -qy \
  robotpkg-py38-hpp-manipulation-corba robotpkg-py38-qt5-hpp-gepetto-viewer \
  robotpkg-py38-qt5-hpp-gui robotpkg-py38-qt5-hpp-plot \
  ros-noetic-pr2-description robotpkg-py38-hpp-environments \
  oxygen-icon-theme \
  && rm -rf /var/lib/apt/lists/*

copy hpp_config.sh hpp_entrypoint.sh /
run chmod a+x /hpp_entrypoint.sh
run echo "[pyplugins]\nhpp.gui=true" >> /opt/openrobots/etc/gepetto-gui/settings.conf
run echo "[pyplugins]\nhpp.gui=true" >> /opt/openrobots/etc/gepetto-gui/basic.conf

entrypoint [ "/hpp_entrypoint.sh" ]
