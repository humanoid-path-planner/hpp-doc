# Development sources on Ubuntu 24.04 64 bit

To install the development version of HPP from source on Ubuntu 24.04 LTS 64 bit, follow these steps.

## 1. Install dependencies

Install robotpkg by following [the robotpkg installation website](http://robotpkg.openrobots.org/debian.html).

## 2. Install by apt-get
```bash
  sudo apt-get update && sudo apt-get install \
  assimp-utils cmake coinor-libipopt-dev coinor-libipopt1v5 cython3 doxygen \
  git ffmpeg gcovr gfortran graphviz libassimp-dev libboost-all-dev \
  libbullet-dev libccd-dev libcdd-dev libconsole-bridge-dev libeigen3-dev \
  libglpk-dev libgraphviz-dev libgtest-dev liblapack-dev liblog4cxx-dev \
  libltdl-dev liboctomap-dev libopencv-dev libpcl-dev \
  libtinyxml2-dev libtinyxml-dev libtool-bin \
  liburdfdom-dev liburdfdom-headers-dev libyaml-cpp-dev llvm m4 nodejs npm \
  pkg-config psmisc python3-defusedxml \
  python3-dev python3-empy python3-gnupg python3-matplotlib python3-venv \
  python3-netifaces python3-nose python3-numpy python3-paramiko \
  python3-pydot python3-scipy python3-setuptools \
  python3-sphinx python3-yaml python3-pip python-is-python3 \
  texlive-latex-extra wget \
  robotpkg-example-robot-data \
  robotpkg-romeo-description robotpkg-py312-eigenpy robotpkg-py312-coal \
  robotpkg-py312-pinocchio robotpkg-py312-proxsuite
  ```

## 3. Choose a directory on your file system

- Define the environment variable <code class="env-variable">DEVEL_HPP_DIR</code> with the full path to this directory.
- the packages will be cloned into <code class="env-variable">&#36;DEVEL_HPP_DIR/src</code>,
- the packages will be installed in  <code class="env-variable">&#36;DEVEL_HPP_DIR/install</code>.

It is recommended to set <code class="env-variable">DEVEL_HPP_DIR</code> in your <code class="env-variable">.bashrc</code> for future use.

```bash
mkdir -p $DEVEL_HPP_DIR/src
  ```
## 4. Copy Config and Makefile

```bash
  wget -O $DEVEL_HPP_DIR/config.sh https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/stable/doc/config/ubuntu-24.04.sh
  wget -O $DEVEL_HPP_DIR/src/Makefile https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/stable/makefiles/devel.mk
```
## 5. cd into `$DEVEL_HPP_DIR` and type

```bash
  cd $DEVEL_HPP_DIR
  source config.sh
```

## 6. install some dependencies via pip

```bash
  python -m venv $INSTALL_PIP_DIR
  $INSTALL_PIP_DIR/bin/pip install "numpy==1.26.4" trimesh pycollada viser
```

## 7. cd into `$DEVEL_HPP_DIR/src` and type

```bash
  cd ${DEVEL_HPP_DIR}/src
  make all
```

## 8. Documentation access

Open <code class="env-variable">&#36;DEVEL_HPP_DIR/install/share/doc/hpp-doc/index.html</code> in a web browser and you will have access to the documentation of most packages.
