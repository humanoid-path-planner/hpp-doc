FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y \
   curl \
   gnupg2 \
   && rm -rf /var/lib/apt/lists/*

RUN echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN echo "deb [arch=amd64] http://robotpkg.openrobots.org/wip/packages/debian/pub bionic robotpkg" > /etc/apt/sources.list.d/robotpkg.list
RUN echo "deb [arch=amd64] http://robotpkg.openrobots.org/packages/debian/pub bionic robotpkg" >> /etc/apt/sources.list.d/robotpkg.list
RUN curl http://robotpkg.openrobots.org/packages/debian/robotpkg.key | apt-key add -

RUN apt-get update -y && apt-get install -y \
      g++ \
      cmake \
      doxygen \
      libboost-dev \
      liburdfdom-dev \
      libassimp-dev \
      libeigen3-dev \
      libgraphviz-dev \
      robotpkg-qpoases+doc \
      robotpkg-roboptim-core \
      robotpkg-roboptim-trajectory \
      robotpkg-romeo-description \
      robotpkg-py36-omniorbpy \
      ros-melodic-xacro \
      libccd-dev \
      ros-melodic-octomap \
      ros-melodic-resource-retriever \
      ros-melodic-srdfdom \
      ros-melodic-pr2-description \
      git \
      libomniorb4-dev \
      omniorb-nameserver \
      omniidl \
      omniidl-python \
      libltdl-dev \
      python-matplotlib \
      python-omniorb \
      libxml2 \
      libtinyxml2-dev \
      qt4-dev-tools \
      libqt4-opengl-dev \
      libqtgui4 \
      libqtwebkit-dev \
      oxygen-icon-theme \
      libopenscenegraph-dev \
      openscenegraph \
      libpcre3-dev \
      wget \
      libcdd-dev \
      sudo \
 && apt-get remove -y texlive-latex-base texlive-binaries ghostscript \
 && apt-get autoremove -y \
 && rm -rf /var/lib/apt/lists/*

COPY auto-install-hpp.sh /
