# Binary installation on Ubuntu 24.04 64 bit

To install HPP packages on Ubuntu 24.04 LTS 64 bit, follow these steps.

## 1. Install basic tools

```bash
sudo apt-get install git cmake curl doxygen lsb-release make wget
```

## 2. Install robotpkg

Install robotpkg by following [the robotpkg installation website](http://robotpkg.openrobots.org/debian.html).

## 3. Install HPP

```bash
pyver=312
sudo apt-get install robotpkg-py${pyver}-hpp-python \
robotpkg-py${pyver}-qt5-hpp-gepetto-viewer
```

## 4. Install optional extra packages for demonstrations

### Tutorials

```bash
sudo apt-get install robotpkg-py${pyver}-hpp-tutorial
```

### Robot descriptions

```bash
sudo apt-get install robotpkg-py${pyver}-hpp-environments \
robotpkg-romeo-description
```

## 5. Choose a directory for the documentation

Define the environment variable <code class="env-variable">DEVEL_HPP_DIR</code> with the full path to this directory.

* The documentation will be cloned into <code class="env-variable">&#36;DEVEL_HPP_DIR/src</code>.
* The documentation will be installed into <code class="env-variable">&#36;DEVEL_HPP_DIR/install</code>.

It is recommended to set <code class="env-variable">DEVEL_HPP_DIR</code> in your <code class="env-variable">.bashrc</code> for future use.

```bash
mkdir -p $DEVEL_HPP_DIR/src
```

## 6. Copy configuration files

```bash
wget -O $DEVEL_HPP_DIR/config.sh https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/stable/doc/config/ubuntu-24.04.sh

wget -O $DEVEL_HPP_DIR/src/Makefile https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/stable/makefiles/devel.mk
```

## 7. Configure the environment

Go to <code class="env-variable">&#36;DEVEL_HPP_DIR</code> and source the configuration file:

```bash
cd ${DEVEL_HPP_DIR}
source config.sh
```

## 8. Build the documentation

Go to the source directory and install the documentation:

```bash
cd ${DEVEL_HPP_DIR}/src
make hpp-doc.install hpp-practicals.checkout hpp_tutorial.checkout
```

## 9. Documentation access

Open:

```text
$DEVEL_HPP_DIR/install/share/doc/hpp-doc/index.html
```

in a web browser to access the documentation of most HPP packages.

# Binary installation on Ubuntu 22.04 64 bit

To install HPP packages on Ubuntu 22.04 LTS 64 bit, follow these steps.

## 1. Install robotpkg

Install robotpkg by following [the robotpkg installation website](http://robotpkg.openrobots.org/debian.html).

## 2. Install HPP

```bash
pyver=310
sudo apt-get install robotpkg-py${pyver}-hpp-python \
robotpkg-py${pyver}-qt5-hpp-gepetto-viewer
```

## 3. Install optional extra packages for demonstrations

### Tutorials

```bash
sudo apt-get install robotpkg-py${pyver}-hpp-tutorial
```

### Robot descriptions

```bash
sudo apt-get install robotpkg-py${pyver}-hpp-environments \
robotpkg-romeo-description
```

### Documentation

```bash
sudo apt-get install robotpkg-hpp-doc
```

## 4. Setup environment variables

Add the following lines to your <code class="env-variable">.bashrc</code> file (adjust the Python version if necessary):

```bash
export PATH=/opt/openrobots/bin${PATH:+:}${PATH}
export LD_LIBRARY_PATH=/opt/openrobots/lib${LD_LIBRARY_PATH:+:}${LD_LIBRARY_PATH}
export PYTHONPATH=/opt/openrobots/lib/python3.10/site-packages${PYTHONPATH:+:}${PYTHONPATH}
export ROS_PACKAGE_PATH=/opt/openrobots/share${ROS_PACKAGE_PATH:+:}${ROS_PACKAGE_PATH}

export CMAKE_PREFIX_PATH=/opt/openrobots${CMAKE_PREFIX_PATH:+:}${CMAKE_PREFIX_PATH}
export PKG_CONFIG_PATH=/opt/openrobots${PKG_CONFIG_PATH:+:}${PKG_CONFIG_PATH}
```

## 5. Documentation access

Open:

```text
/opt/openrobots/share/doc/hpp-doc/index.html
```

in a web browser to access the documentation of most HPP packages.
