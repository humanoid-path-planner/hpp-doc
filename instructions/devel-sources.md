## Source installation on ubuntu-24.04 64 bit

To install all the packages on ubuntu 24.04 LTS 64 bit, you should do the following steps:

  2. install robotpkg: follow [the robotpkg installation website](http://robotpkg.openrobots.org/debian.html).

  3. install by apt-get
  ```bash
    sudo apt-get update && apt-get install \
    assimp-utils cmake coinor-libipopt-dev coinor-libipopt1v5 cython3 doxygen \
    git ffmpeg gcovr gfortran graphviz libassimp-dev libboost-all-dev \
    libbullet-dev libccd-dev libcdd-dev libconsole-bridge-dev libeigen3-dev \
    libglpk-dev libgraphviz-dev libgtest-dev liblapack-dev liblog4cxx-dev \
    libltdl-dev liboctomap-dev libopencv-dev libpcl-dev libqt5svg5-dev \
    libqt5xmlpatterns5-dev libtinyxml2-dev libtinyxml-dev libtool-bin \
    liburdfdom-dev liburdfdom-headers-dev libyaml-cpp-dev llvm m4 \
    oxygen-icon-theme pkg-config psmisc pyqt5-dev python3-defusedxml \
    python3-dev python3-empy python3-gnupg python3-matplotlib python3-venv\
    python3-netifaces python3-nose python3-numpy python3-paramiko \
    python3-pydot python3-pyqt5 python3-scipy python3-setuptools \
    python3-sip-dev python3-sphinx python3-yaml python3-pip python-is-python3 \
    qtbase5-private-dev qtmultimedia5-dev texlive-latex-extra wget \
    robotpkg-romeo-description robotpkg-py312-eigenpy robotpkg-py312-coal \
    robotpkg-py312-pinocchio robotpkg-py312-proxsuite robotpkg-qt5-qgv
  ```

  4. Choose a directory on your file system and define the environment
     variable `DEVEL_HPP_DIR` with the full path to this directory.
     - the packages will be cloned into `$DEVEL_HPP_DIR/src`,
     - the packages will be installed in `$DEVEL_HPP_DIR/install`.
     It is recommanded to set variable `DEVEL_HPP_DIR` in your `.bashrc` for future use.

  ```bash
    mkdir -p $DEVEL_HPP_DIR/src
  ```
  5. Copy Config and Makefile

  ```bash
    wget -O $DEVEL_HPP_DIR/config.sh https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/stable/doc/config/ubuntu-24.04.sh
    wget -O $DEVEL_HPP_DIR/src/Makefile https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/stable/makefiles/devel.mk
  ```

  6. cd into `$DEVEL_HPP_DIR` and type

  ```bash
  cd $DEVEL_HPP_DIR
  source config.sh
  ```

  7. install some dependencies via pip

  ```bash
  python -m venv $INSTALL_PIP_DIR
  $INSTALL_PIP_DIR/bin/pip install "numpy==1.26.4" trimesh pycollada viser
  ```

  8. cd into `$DEVEL_HPP_DIR/src` and type

  ```bash
  cd ${DEVEL_HPP_DIR}/src
  make all
  ```

  9. open `$DEVEL_HPP_DIR/install/share/doc/hpp-doc/index.html` in a web brower and you
  will have access to the documentation of most packages.

