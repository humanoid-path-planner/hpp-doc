FROM ubuntu:22.04

ENV DEVEL_HPP_DIR=/workspace UBUNTU=jammy

RUN --mount=type=cache,sharing=locked,target=/var/cache/apt --mount=type=cache,sharing=locked,target=/var/lib/apt \
    apt-get update -qqy && DEBIAN_FRONTEND=noninteractive apt-get install -qqy \
    curl \
    gnupg2

ADD repos.key /
RUN echo "deb [arch=amd64] http://robotpkg.openrobots.org/wip/packages/debian/pub ${UBUNTU} robotpkg" \
 >> /etc/apt/sources.list.d/robotpkg.list \
 && echo "deb [arch=amd64] http://robotpkg.openrobots.org/packages/debian/pub ${UBUNTU} robotpkg" \
 >> /etc/apt/sources.list.d/robotpkg.list \
 && apt-key add /repos.key

RUN --mount=type=cache,sharing=locked,target=/var/cache/apt --mount=type=cache,sharing=locked,target=/var/lib/apt \
    apt-get update -qqy && DEBIAN_FRONTEND=noninteractive apt-get install -qqy \
    assimp-utils \
    build-essential \
    cmake \
    coinor-libipopt1v5 \
    coinor-libipopt-dev \
    cython3 \
    doxygen \
    ffmpeg \
    gcovr \
    gfortran \
    git \
    graphviz \
    libassimp-dev \
    libboost-all-dev \
    libbullet-dev \
    libccd-dev \
    libcdd-dev \
    libconsole-bridge-dev \
    libeigen3-dev \
    libglpk-dev \
    libgraphviz-dev \
    libgtest-dev \
    liblapack-dev \
    liblog4cxx-dev \
    libltdl-dev \
    liboctomap-dev \
    libopencv-dev \
    libpcl-dev \
    libqt5svg5-dev \
    libqt5xmlpatterns5-dev \
    libtinyxml2-dev \
    libtinyxml-dev \
    libtool-bin \
    liburdfdom-dev \
    liburdfdom-headers-dev \
    libyaml-cpp-dev \
    llvm \
    lsb-release \
    m4 \
    oxygen-icon-theme \
    pkg-config \
    psmisc \
    pyqt5-dev \
    python3-defusedxml \
    python3-dev \
    python3-empy \
    python3-gnupg \
    python3-lxml \
    python3-matplotlib \
    python3-netifaces \
    python3-nose \
    python3-numpy \
    python3-paramiko \
    python3-pip \
    python3-pydot \
    python3-pyqt5 \
    python3-scipy \
    python3-setuptools \
    python3-sip-dev \
    python3-sphinx \
    python3-yaml \
    python-is-python3\
    qtbase5-private-dev \
    qtmultimedia5-dev \
    robotpkg-openscenegraph \
    robotpkg-py310-omniorbpy \
    robotpkg-qpoases \
    robotpkg-qt5-osgqt \
    texlive-latex-extra \
    sudo \
    wget \
 && apt-get remove -y texlive-latex-base texlive-binaries ghostscript \
 && apt-get autoremove -y

COPY auto-install-hpp.sh /
