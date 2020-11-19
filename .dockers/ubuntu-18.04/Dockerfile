FROM ubuntu:18.04

ENV DEVEL_HPP_DIR=/workspace UBUNTU=bionic ROS=melodic

RUN apt-get update -y && apt-get install -y \
   curl \
   gnupg2 \
   && rm -rf /var/lib/apt/lists/*

RUN echo "deb http://packages.ros.org/ros/ubuntu ${UBUNTU} main" > /etc/apt/sources.list.d/ros-latest.list
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN echo "deb [arch=amd64] http://robotpkg.openrobots.org/wip/packages/debian/pub ${UBUNTU} robotpkg" > /etc/apt/sources.list.d/robotpkg.list
RUN echo "deb [arch=amd64] http://robotpkg.openrobots.org/packages/debian/pub ${UBUNTU} robotpkg" >> /etc/apt/sources.list.d/robotpkg.list
RUN curl http://robotpkg.openrobots.org/packages/debian/robotpkg.key | apt-key add -

RUN apt-get update -y && apt-get install -y \
    cmake \
    doxygen \
    g++ \
    git \
    libassimp-dev \
    libboost-dev \
    libccd-dev \
    libcdd-dev \
    libeigen3-dev \
    libglpk-dev \
    libgraphviz-dev \
    libltdl-dev \
    libomniorb4-dev \
    libopenscenegraph-dev \
    libpcre3-dev \
    libqt4-opengl-dev \
    libqtgui4 \
    libqtwebkit-dev \
    libtinyxml2-dev \
    liburdfdom-dev \
    libxml2 \
    omniorb-nameserver \
    openscenegraph \
    oxygen-icon-theme \
    python-matplotlib \
    python-omniorb \
    qt4-dev-tools \
    robotpkg-omniorb \
    robotpkg-qpoases+doc \
    robotpkg-roboptim-core \
    robotpkg-roboptim-trajectory \
    robotpkg-py36-omniorbpy \
    ros-${ROS}-octomap \
    ros-${ROS}-pr2-description \
    ros-${ROS}-resource-retriever \
    ros-${ROS}-srdfdom \
    ros-${ROS}-xacro \
    sudo \
    wget \
 && apt-get remove -y texlive-latex-base texlive-binaries ghostscript \
 && apt-get autoremove -y \
 && rm -rf /var/lib/apt/lists/*

COPY auto-install-hpp.sh /
