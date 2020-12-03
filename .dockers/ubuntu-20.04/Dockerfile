FROM ubuntu:20.04

ENV DEVEL_HPP_DIR=/workspace UBUNTU=focal ROS=noetic

RUN apt-get update -y && apt-get install -y \
   curl \
   gnupg2 \
   && rm -rf /var/lib/apt/lists/*

ADD repos.key /
RUN echo "deb http://packages.ros.org/ros/ubuntu ${UBUNTU} main" > /etc/apt/sources.list.d/ros-latest.list \
 && echo "deb [arch=amd64] http://robotpkg.openrobots.org/wip/packages/debian/pub ${UBUNTU} robotpkg" \
 >> /etc/apt/sources.list.d/robotpkg.list \
 && echo "deb [arch=amd64] http://robotpkg.openrobots.org/packages/debian/pub ${UBUNTU} robotpkg" \
 >> /etc/apt/sources.list.d/robotpkg.list \
 && apt-key add /repos.key

RUN apt-get update -qqy \
 && DEBIAN_FRONTEND=noninteractive apt-get install -qqy \
    g++ \
    wget \
    sudo \
    cmake \
    git \
    doxygen \
    graphviz \
    libboost-dev \
    liburdfdom-dev \
    libassimp-dev \
    libeigen3-dev \
    libgraphviz-dev \
    libccd-dev \
    libxml2 \
    libtinyxml2-dev \
    libpcre3-dev \
    libltdl-dev \
    qttools5-dev \
    qttools5-dev-tools \
    qtbase5-private-dev \
    libqt5opengl5-dev \
    libqt5gui5 \
    libqt5webkit5-dev \
    qtmultimedia5-dev \
    libqt5svg5-dev \
    python-is-python3 \
    python3-matplotlib \
    ros-${ROS}-xacro \
    ros-${ROS}-octomap \
    ros-${ROS}-resource-retriever \
    ros-${ROS}-srdfdom \
    ros-${ROS}-pr2-description \
    robotpkg-omniorb \
    robotpkg-qpoases+doc \
    robotpkg-roboptim-core \
    robotpkg-roboptim-trajectory \
    robotpkg-py38-omniorbpy \
    robotpkg-qt5-osgqt \
    oxygen-icon-theme \
 && apt-get remove -y texlive-latex-base texlive-binaries ghostscript \
 && apt-get autoremove -y \
 && rm -rf /var/lib/apt/lists/*

COPY auto-install-hpp.sh /
