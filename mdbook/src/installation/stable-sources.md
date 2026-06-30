# Source installation on Ubuntu 24.04 64 bit

To install HPP and its dependencies from source on Ubuntu 24.04 LTS 64 bit, follow these steps.

## 1. Install robotpkg

Install robotpkg by following [the robotpkg installation website](http://robotpkg.openrobots.org/debian.html).

## 2. Install dependencies using apt-get

```bash
sudo apt-get update && sudo apt-get install \
assimp-utils cmake coinor-libipopt-dev coinor-libipopt1v5 cython3 doxygen \
git ffmpeg gcovr gfortran graphviz libassimp-dev libboost-all-dev \
libbullet-dev libccd-dev libcdd-dev libconsole-bridge-dev libeigen3-dev \
libglpk-dev libgraphviz-dev libgtest-dev liblapack-dev liblog4cxx-dev \
libltdl-dev liboctomap-dev libopencv-dev libpcl-dev libqt5svg5-dev \
libqt5xmlpatterns5-dev libtinyxml2-dev libtinyxml-dev libtool-bin \
liburdfdom-dev liburdfdom-headers-dev libyaml-cpp-dev llvm m4 \
oxygen-icon-theme pkg-config psmisc pyqt5-dev python3-defusedxml \
python3-dev python3-empy python3-gnupg python3-matplotlib python3-venv \
python3-netifaces python3-nose python3-numpy python3-paramiko \
python3-pydot python3-pyqt5 python3-scipy python3-setuptools \
python3-sip-dev python3-sphinx python3-yaml python3-pip python-is-python3 \
qtbase5-private-dev qtmultimedia5-dev texlive-latex-extra wget \
robotpkg-romeo-description robotpkg-py312-eigenpy robotpkg-py312-coal \
robotpkg-py312-pinocchio robotpkg-py312-proxsuite robotpkg-qt5-qgv
```

## 3. Choose a development directory

Choose a directory on your filesystem and define the environment variable <code class="env-variable">DEVEL_HPP_DIR</code> with its full path.

* The packages will be cloned into <code class="env-variable">$DEVEL_HPP_DIR/src</code>.
* The packages will be installed into <code class="env-variable">$DEVEL_HPP_DIR/install</code>.

It is recommended to set <code class="env-variable">DEVEL_HPP_DIR</code> in your <code class="env-variable">.bashrc</code> file for future use.

```bash
mkdir -p $DEVEL_HPP_DIR/src
```

## 4. Copy configuration files

```bash
wget -O $DEVEL_HPP_DIR/config.sh https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/stable/doc/config/ubuntu-24.04.sh

wget -O $DEVEL_HPP_DIR/src/Makefile https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/stable/makefiles/stable.mk
```

## 5. Configure the environment

Go to <code class="env-variable">$DEVEL_HPP_DIR</code> and source the configuration file:

```bash
cd $DEVEL_HPP_DIR
source config.sh
```

## 6. Install Python dependencies

Create a Python virtual environment and install the required Python packages:

```bash
python -m venv $INSTALL_PIP_DIR
$INSTALL_PIP_DIR/bin/pip install "numpy==1.26.4" trimesh pycollada viser
```

## 7. Build and install the packages

Go to the source directory and build the packages:

```bash
cd ${DEVEL_HPP_DIR}/src
make all
```

## 8. Documentation access

Open:

```text
$DEVEL_HPP_DIR/install/share/doc/hpp-doc/index.html
```

in a web browser to access the documentation of most HPP packages.
