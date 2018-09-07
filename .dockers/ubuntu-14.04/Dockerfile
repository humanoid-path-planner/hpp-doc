FROM ubuntu:14.04

RUN echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

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
   && apt remove -qqy texlive \
   && apt autoremove \
   && rm -rf /var/lib/apt/lists/*

COPY auto-install-hpp.sh /
