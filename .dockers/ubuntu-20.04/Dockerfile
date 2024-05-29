FROM ubuntu:20.04

ENV DEVEL_HPP_DIR=/workspace UBUNTU=focal ROS=noetic

RUN --mount=type=cache,sharing=locked,target=/var/cache/apt --mount=type=cache,sharing=locked,target=/var/lib/apt \
    apt-get update -qqy && DEBIAN_FRONTEND=noninteractive apt-get install -qqy \
    curl \
    gnupg2

ADD repos.key /
RUN echo "deb http://packages.ros.org/ros/ubuntu ${UBUNTU} main" > /etc/apt/sources.list.d/ros-latest.list \
 && echo "deb [arch=amd64] http://robotpkg.openrobots.org/wip/packages/debian/pub ${UBUNTU} robotpkg" \
 >> /etc/apt/sources.list.d/robotpkg.list \
 && echo "deb [arch=amd64] http://robotpkg.openrobots.org/packages/debian/pub ${UBUNTU} robotpkg" \
 >> /etc/apt/sources.list.d/robotpkg.list \
 && apt-key add /repos.key

RUN --mount=type=cache,sharing=locked,target=/var/cache/apt --mount=type=cache,sharing=locked,target=/var/lib/apt \
    apt-get update -qqy && DEBIAN_FRONTEND=noninteractive apt-get install -qqy \
    cmake \
    doxygen \
    g++ \
    git \
    graphviz \
    libassimp-dev \
    libboost-dev \
    libccd-dev \
    libcdd-dev \
    libeigen3-dev \
    libglpk-dev \
    libgraphviz-dev \
    libltdl-dev \
    libomniorb4-dev \
    libpcre3-dev \
    libqt5svg5-dev \
    libqt5webkit5-dev \
    libqt5xmlpatterns5-dev \
    libtinyxml2-dev \
    liburdfdom-dev \
    libxml2 \
    omniorb-nameserver \
    oxygen-icon-theme \
    psmisc \
    pyqt5-dev \
    python3-lxml \
    python3-pyqt5 \
    python3-matplotlib \
    python-is-python3 \
    qtdeclarative5-dev \
    qtbase5-private-dev \
    qtmultimedia5-dev \
    robotpkg-omniorb \
    robotpkg-openscenegraph \
    robotpkg-qpoases+doc \
    robotpkg-romeo-description \
    robotpkg-py38-eigenpy \
    robotpkg-py38-omniorbpy \
    robotpkg-py38-pythonqt \
    robotpkg-qt5-osgqt \
    ros-${ROS}-octomap \
    ros-${ROS}-resource-retriever \
    ros-${ROS}-srdfdom \
    ros-${ROS}-xacro \
    sudo \
    wget \
 && apt-get remove -y texlive-latex-base texlive-binaries ghostscript \
 && apt-get autoremove -y

COPY auto-install-hpp.sh /
