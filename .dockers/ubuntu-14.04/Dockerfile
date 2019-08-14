FROM ubuntu:14.04

RUN apt-get update -qqy && apt-get install -qqy \
    curl \
 && rm -rf /var/lib/apt/lists/*

RUN echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN echo "deb [arch=amd64] http://robotpkg.openrobots.org/wip/packages/debian/pub trusty robotpkg" > /etc/apt/sources.list.d/robotpkg.list
RUN echo "deb [arch=amd64] http://robotpkg.openrobots.org/packages/debian/pub trusty robotpkg" >> /etc/apt/sources.list.d/robotpkg.list
RUN curl http://robotpkg.openrobots.org/packages/debian/robotpkg.key | apt-key add -

RUN apt-get update -qqy && apt-get install -qqy \
    autoconf \
    asciidoc \
    bison \
    cmake \
    flex \
    git \
    g++ \
    libassimp-dev \
    libboost-all-dev \
    libcdd-dev \
    libglpk-dev \
    liblog4cxx10-dev \
    libltdl-dev \
    libomniorb4-dev \
    libopenscenegraph-dev \
    libqt4-opengl-dev \
    libqtgui4 \
    libtinyxml2-dev \
    liburdfdom-dev \
    make \
    omniidl \
    omniidl-python \
    omniorb-nameserver \
    oxygen-icon-theme \
    python-matplotlib \
    qt4-dev-tools \
    robotpkg-osg-dae \
    robotpkg-qpoases+doc \
    robotpkg-roboptim-core \
    robotpkg-roboptim-trajectory \
    robotpkg-romeo-description \
    robotpkg-ros-baxter-common \
    ros-indigo-xacro \
    ros-indigo-kdl-parser \
    ros-indigo-common-msgs \
    ros-indigo-tf \
    ros-indigo-tf-conversions \
    ros-indigo-libccd \
    ros-indigo-octomap \
    ros-indigo-resource-retriever \
    ros-indigo-srdfdom \
    ros-indigo-pr2-description \
    source-highlight \
    wget \
 && apt-get remove -qqy texlive-latex-base texlive-binaries ghostscript \
 && apt-get autoremove -qqy \
 && rm -rf /var/lib/apt/lists/*

COPY auto-install-hpp.sh /
