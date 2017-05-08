## Installation on centos 7

To install all the packages on centos 7, you should do the following steps:

  1. install by yum the following packages

    ```bash
sudo yum install boost-devel.x86_64 autoconf.noarch cmake-gui.x86_64 flex.x86_64 bison.x86_64 asciidoc.noarch source-highlight.x86_64 git.x86_64 python-devel.x86_64 libxml2-devel libXrandr-devel freeglut mesa-libGLU-devel avahi-qt4-devel libcurl-devel numpy
    ```

  2. download and install the following binay packages

    ```bash
  wget http://dl.fedoraproject.org/pub/epel/7/x86_64/t/tinyxml-2.6.2-3.el7.x86_64.rpm
  wget http://dl.fedoraproject.org/pub/epel/7/x86_64/t/tinyxml-devel-2.6.2-3.el7.x86_64.rpm
  sudo yum install tinyxml-2.6.2-3.el7.x86_64.rpm
  sudo yum install tinyxml-devel-2.6.2-3.el7.x86_64.rpm
    ```

  3. Choose a directory on you file system and define the environment
     variable `DEVEL_DIR` with the full path to this directory.
     - the packages will be cloned into `$DEVEL_DIR/src`,
     - the packages will be installed in `$DEVEL_DIR/install`.
     It is recommanded to set variable `DEVEL_DIR` in your `.bashrc` for future use.

  4. Copy Config and Makefile

    ```bash
wget -O $DEVEL_DIR/config.sh https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/isae-2017/doc/config.sh
wget -O $DEVEL_DIR/src/Makefile https://raw.githubusercontent.com/humanoid-path-planner/hpp-doc/isae-2017/doc/Makefile
    ```

  5. cd into `$DEVEL_DIR` and type

    ```bash
cd ${DEVEL_DIR}
source config.sh
    ```

  6. cd into `$DEVEL_DIR/src` and type

    ```bash
cd ${DEVEL_DIR}/src
make robot_state_chain_publisher.install;
source ../config.sh;
make all
    ```

##Documentation

  Open `$DEVEL_DIR/install/share/doc/hpp-doc/index.html` in a web brower and you
  will have access to the documentation of most packages.
