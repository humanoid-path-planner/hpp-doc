#
# Copyright (c) 2014 CNRS-LAAS
# Author: Florent Lamiraux
#

FCL_REPO=https://github.com/flexible-collision-library
JRL_REPO=https://github.com/jrl-umi3218
LAAS_REPO=https://github.com/laas
HPP_REPO=https://github.com/humanoid-path-planner

SRC_DIR=${DEVEL_DIR}/src
BUILD_TYPE=Debug

fcl_branch=master
fcl_repository=${FCL_REPO}

jrl-mathtools_branch=master
jrl-mathtools_repository=${JRL_REPO}

hpp-util_branch=master
hpp-util_repository=${HPP_REPO}

roboptim-core_branch=master
roboptim-core_repository=https://github.com/roboptim

roboptim-trajectory_branch=master
roboptim-trajectory_repository=https://github.com/roboptim

hpp-model_branch=master
hpp-model_repository=${HPP_REPO}

hpp-model-urdf_branch=master
hpp-model-urdf_repository=${HPP_REPO}

hpp-core_branch=master
hpp-core_repository=${HPP_REPO}

hpp-template-corba_branch=master
hpp-template-corba_repository=${LAAS_REPO}

hpp-corbaserver_branch=master
hpp-corbaserver_repository=${HPP_REPO}

hpp-constraints_branch=master
hpp-constraints_repository=${HPP_REPO}

hpp-wholebody-step_branch=master
hpp-wholebody-step_repository=${HPP_REPO}

hpp-wholebody-step-corba_branch=master
hpp-wholebody-step-corba_repository=${HPP_REPO}

hpp_ros_branch=master
hpp_ros_repository=${HPP_REPO}

test-hpp_branch=master
test-hpp_repository=${HPP_REPO}

hrp2_branch=groovy
hrp2_repository=${FLORENT_REPO}

robot_capsule_urdf_branch=groovy
robot_capsule_urdf_repository=${LAAS_REPO}

robot_model_py_branch=groovy
robot_model_py_repository=${LAAS_REPO}

hpp-doc_branch=master
hpp-doc_repository=${HPP_REPO}

packages= \
	fcl \
	jrl-mathtools \
	hpp-util \
	roboptim-core \
	roboptim-trajectory \
	hpp-model \
	hpp-model-urdf \
	hpp-core \
	hpp-template-corba \
	hpp-corbaserver \
	hpp-constraints \
	hpp-wholebody-step \
	hpp-wholebody-step-corba \
	hpp_ros \
	test-hpp \
	hpp-doc

install_all=$(packages:=.all)

all: ${install_all}

%.all: %.checkout %.configure %.install
	@echo "\n ***********************************************************\n" \
	"*** finished installing $(@:.all=)\n" \
	"************************************************************\n"

%.checkout:
	if [ -d $(@:.checkout=) ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
		git clone --recursive -b ${$(@:.checkout=)_branch} ${$(@:.checkout=)_repository}/$(@:.checkout=); \
	fi \

%.update:
	cd ${SRC_DIR}/$(@:.update=);\
	git remote set-url origin ${$(@:.update=)_repository}/$(@:.update=);\
	git fetch origin;\
	git checkout -b bce46g origin/${$(@:.update=)_branch};\
	git branch -D ${$(@:.update=)_branch};\
	git checkout -b ${$(@:.update=)_branch} bce46g;\
	git branch -D bce46g;\
	git submodule update

%.configure:
	cd ${SRC_DIR}/$(@:.configure=);\
	mkdir -p build; \
	cd ${SRC_DIR}/$(@:.configure=)/build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} ..

%.install:
	cd ${SRC_DIR}/$(@:.install=)/build;\
	make install

%.uninstall:
	cd ${SRC_DIR}/$(@:.uninstall=)/build;\
	make uninstall

%.clean:
	cd ${SRC_DIR}/$(@:.clean=)/build;\
	make clean

%.status:
	cd ${SRC_DIR}/$(@:.status=); git status

hpp-doc.configure:
	cd ${SRC_DIR}/$(@:.configure=);\
	./bootstrap;\
	mkdir -p build; \
	cd ${SRC_DIR}/$(@:.configure=)/build; \
	../configure --prefix=${DEVEL_DIR}/install

eigen3.checkout:
	wget -O eigen3.tar.bz2 http://bitbucket.org/eigen/eigen/get/3.2.1.tar.bz2;\
	cd ${SRC_DIR}; bunzip2 eigen3.tar.bz2; tar xvf eigen3.tar;\
	rm -f eigen3.tar; mv eigen-eigen-6b38706d90a9 eigen3

hrp2.configure:
	cd ${SRC_DIR}/hrp2/hrp2_14_description;\
	mkdir -p build; \
	cd ${SRC_DIR}/hrp2/hrp2_14_description/build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} ..

hrp2.install:
	cd ${SRC_DIR}/hrp2/hrp2_14_description/build;\
	make install

robot_model_py.configure:
	cd ${SRC_DIR}/$(@:.configure=)/xml_reflection;\
	mkdir -p build; \
	cd build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} ..
	cd ${SRC_DIR}/$(@:.configure=)/urdf_parser_py;\
	mkdir -p build; \
	cd build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} ..
