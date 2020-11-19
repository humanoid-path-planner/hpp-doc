FROM ubuntu:16.04

ENV DEVEL_HPP_DIR=/workspace UBUNTU=xenial ROS=kinetic

RUN apt-get update -y && apt-get install -y \
   curl \
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
    asciidoc \
    autoconf \
    bison \
    cmake \
    doxygen \
    flex \
    g++ \
    git \
    libassimp-dev \
    libboost-dev \
    libcdd-dev \
    libglpk-dev \
    liblog4cxx10-dev \
    libltdl-dev \
    libomniorb4-dev \
    libopenscenegraph-dev \
    libpcre3-dev \
    libqt4-opengl-dev \
    libqtgui4 \
    libqtwebkit-dev \
    libtinyxml2-dev \
    liburdfdom-dev \
    libxml2-dev \
    omniidl \
    omniidl-python \
    omniorb-nameserver \
    openscenegraph \
    oxygen-icon-theme \
    python-matplotlib \
    qt4-dev-tools \
    robotpkg-qpoases+doc \
    robotpkg-roboptim-core \
    robotpkg-roboptim-trajectory \
    ros-${ROS}-common-msgs \
    ros-${ROS}-kdl-parser \
    ros-${ROS}-octomap \
    ros-${ROS}-pr2-description \
    ros-${ROS}-srdfdom \
    ros-${ROS}-resource-retriever \
    ros-${ROS}-tf \
    ros-${ROS}-tf-conversions \
    ros-${ROS}-xacro \
    source-highlight \
    sudo \
    wget \
 && apt-get remove -y texlive-latex-base texlive-binaries ghostscript \
 && apt-get autoremove -y \
 && rm -rf /var/lib/apt/lists/*

COPY auto-install-hpp.sh /
