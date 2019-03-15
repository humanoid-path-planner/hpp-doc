FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qqy && apt-get install -qqy \
   curl \
   gnupg2 \
   && rm -rf /var/lib/apt/lists/*

RUN echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
RUN echo "deb [arch=amd64] http://robotpkg.openrobots.org/wip/packages/debian/pub bionic robotpkg" > /etc/apt/sources.list.d/robotpkg.list
RUN echo "deb [arch=amd64] http://robotpkg.openrobots.org/packages/debian/pub bionic robotpkg" >> /etc/apt/sources.list.d/robotpkg.list
RUN curl http://robotpkg.openrobots.org/packages/debian/robotpkg.key | apt-key add -

RUN apt-get update -qqy && apt-get install -qqy \
    autoconf \
    g++ \
    cmake \
    doxygen \
    libassimp-dev \
    libboost-dev \
    libcdd-dev \
    libglpk-dev \
    liburdfdom-dev \
    robotpkg-osg-dae \
    robotpkg-qpoases+doc \
    robotpkg-roboptim-core \
    robotpkg-roboptim-trajectory \
    robotpkg-romeo-description \
    robotpkg-ros-baxter-common \
    ros-melodic-xacro \
    ros-melodic-kdl-parser \
    ros-melodic-common-msgs \
    ros-melodic-tf \
    ros-melodic-tf-conversions \
    libccd-dev \
    ros-melodic-octomap \
    ros-melodic-resource-retriever \
    ros-melodic-srdfdom \
    ros-melodic-pr2-description \
    flex \
    bison \
    asciidoc \
    source-highlight \
    git \
    libomniorb4-dev \
    omniorb-nameserver \
    omniidl \
    omniidl-python \
    libltdl-dev \
    python-matplotlib \
    libxml2-dev \
    libtinyxml2-dev \
    liblog4cxx-dev \
    libltdl-dev \
    qt4-dev-tools \
    libqt4-opengl-dev \
    libqtwebkit-dev \
    libqtgui4 \
    oxygen-icon-theme \
    libopenscenegraph-dev \
    openscenegraph \
    libpcre3-dev \
    sudo \
    wget \
 && apt-get remove -qqy texlive-latex-base texlive-binaries ghostscript \
 && apt-get autoremove -qqy \
 && rm -rf /var/lib/apt/lists/*

COPY auto-install-hpp.sh /
