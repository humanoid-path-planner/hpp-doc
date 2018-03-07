FROM ubuntu:16.04

RUN echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros-latest.list
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

RUN apt-get update -qqy && apt-get install -qqy \
      autoconf \
      g++ \
      cmake \
      doxygen \
      libboost-dev \
      liburdfdom-dev \
      libassimp-dev \
      ros-kinetic-xacro \
      ros-kinetic-kdl-parser \
      ros-kinetic-common-msgs \
      ros-kinetic-tf \
      ros-kinetic-tf-conversions \
      libccd-dev \
      ros-kinetic-octomap \
      ros-kinetic-resource-retriever \
      ros-kinetic-srdfdom \
      ros-kinetic-pr2-description \
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
      libxml2 \
      libtinyxml2-dev \
      liblog4cxx10-dev \
      libltdl-dev \
      qt4-dev-tools \
      libqt4-opengl-dev \
      libqtgui4 \
      oxygen-icon-theme \
      libopenscenegraph-dev \
      openscenegraph \
      libpcre3-dev \
      && rm -rf /var/lib/apt/lists/*

COPY script/auto-install-hpp.sh /

ENTRYPOINT /auto-install-hpp.sh
