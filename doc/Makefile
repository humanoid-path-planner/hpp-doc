#
# Copyright (c) 2014 CNRS-LAAS
# Author: Florent Lamiraux
#

FCL_REPO=https://github.com/flexible-collision-library
JRL_REPO=git@github.com:jrl-umi3218
LAAS_REPO=git@github.com:laas
HPP_REPO=git@github.com:humanoid-path-planner

SRC_DIR=${DEVEL_DIR}/src
BUILD_TYPE=Debug

fcl_branch=master
fcl_repository=${FCL_REPO}

jrl-mathtools_branch=master
jrl-mathtools_repository=${HPP_REPO}

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
hrp2_repository=${JRL_REPO}

hpp-hrp2_branch=master
hpp-hrp2_repository=${HPP_REPO}

robot_capsule_urdf_branch=groovy
robot_capsule_urdf_repository=${LAAS_REPO}

robot_model_py_branch=groovy
robot_model_py_repository=${LAAS_REPO}

hpp-doc_branch=master
hpp-doc_repository=${HPP_REPO}

hpp-manipulation_branch=master
hpp-manipulation_repository=ssh://trac.laas.fr/git/jrl/algo

hpp-manipulation-corba_branch=master
hpp-manipulation-corba_repository=ssh://trac.laas.fr/git/jrl/corba

airbus_ros_branch=master
airbus_ros_repository=ssh://trac.laas.fr/git/jrl/ros

airbus_environment_branch=master
airbus_environment_repository=ssh://trac.laas.fr/git/jrl/data

all: hpp_ros.install hpp-wholebody-step-corba.install
	${MAKE} hpp-doc.install
# source $DEVEL_DIR/install/setup.bash before installing hrp2.
hrp2: test-hpp.install

fcl.configure.dep: fcl.checkout
eigen3.configure.dep: eigen3.checkout
jrl-mathtools.configure.dep: jrl-mathtools.checkout
hpp-util.configure.dep: hpp-util.checkout
roboptim-core.configure.dep: eigen3.install roboptim-core.checkout
roboptim-trajectory.configure.dep: roboptim-core.install \
	roboptim-trajectory.checkout
hpp-model.configure.dep: jrl-mathtools.install hpp-util.install fcl.install \
	eigen3.install hpp-model.checkout
hpp-model-urdf.configure.dep: hpp-model.install hpp-model-urdf.checkout
hpp-core.configure.dep: hpp-model.install roboptim-trajectory.install \
	hpp-core.checkout
hpp-constraints.configure.dep: hpp-core.install hpp-constraints.checkout
hpp-wholebody-step.configure.dep: hpp-constraints.install \
	hpp-wholebody-step.checkout
hpp-manipulation.configure.dep: hpp-core.install hpp-constraints.install \
	hpp-manipulation.checkout
hpp-corbaserver.configure.dep: hpp-model-urdf.install hpp-core.install \
	hpp-constraints.install hpp-corbaserver.checkout
hpp-wholebody-step-corba.configure.dep: hpp-corbaserver.install \
	hpp-wholebody-step.install hpp-template-corba.install \
	hpp-wholebody-step-corba.checkout
hpp-template-corba.configure.dep: hpp-util.install hpp-template-corba.checkout
hpp-manipulation-corba.configure.dep: hpp-manipulation.install \
	hpp-wholebody-step-corba.install hpp-manipulation.install \
	hpp-manipulation-corba.checkout
robot_model_py.configure.dep: robot_model_py.checkout
robot_capsule_urdf.configure.dep: robot_model_py.install \
	robot_capsule_urdf.checkout
hpp-hrp2.configure.dep: hrp2.install hpp-corbaserver.install hpp-hrp2.checkout
hrp2.configure.dep: robot_capsule_urdf.install robot_model_py.install \
	hrp2.checkout
hpp_ros.configure.dep: hpp-corbaserver.install hpp_ros.checkout
test-hpp.configure.dep: hpp-wholebody-step-corba.install \
	hpp_ros.install hpp-hrp2.install test-hpp.checkout
airbus_ros.configure.dep: airbus_environment.install \
	hpp-manipulation-corba.install airbus_ros.checkout
airbus_environment.configure.dep: hpp_ros.install airbus_environment.checkout

status:
	for d in eigen3 fcl jrl-mathtools hpp-util roboptim-core roboptim-trajectory hpp-model hpp-model-urdf hpp-core hpp-template-corba hpp-corbaserver hpp-constraints hpp-wholebody-step hpp-wholebody-step-corba hpp_ros hpp-manipulation hpp-manipulation-corba airbus_ros airbus_environment hpp-doc ; do \
	cd ${SRC_DIR}/$$d;\
	echo "---------------------------------------------------------------";\
	echo $$d;\
	echo "---------------------------------------------------------------";\
	git status; done

update:
	for d in hpp-util hpp-model hpp-model-urdf hpp-core hpp-template-corba hpp-corbaserver hpp-constraints hpp-wholebody-step hpp-wholebody-step-corba hpp_ros hpp-manipulation hpp-manipulation-corba airbus_ros airbus_environment hpp-doc ; do \
	echo "Updating $$d";\
	make $$d.update; done

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

%.configure:%.configure.dep
	cd ${SRC_DIR}/$(@:.configure=);\
	mkdir -p build; \
	cd ${SRC_DIR}/$(@:.configure=)/build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} ..

%.install:%.configure
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

hpp-doc.configure: hpp-doc.checkout
	cd ${SRC_DIR}/$(@:.configure=);\
	./bootstrap;\
	mkdir -p build; \
	cd ${SRC_DIR}/$(@:.configure=)/build; \
	../configure --prefix=${DEVEL_DIR}/install

eigen3.checkout:
	if [ -d $(@:.checkout=) ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
		wget -O eigen3.tar.bz2 \
		http://bitbucket.org/eigen/eigen/get/3.2.1.tar.bz2;\
		cd ${SRC_DIR}; bunzip2 eigen3.tar.bz2; tar xvf eigen3.tar;\
		rm -f eigen3.tar; mv eigen-eigen-6b38706d90a9 eigen3;\
	fi

eigen3.configure: eigen3.configure.dep
	cd ${SRC_DIR}/eigen3;\
	mkdir -p build; \
	cd ${SRC_DIR}/eigen3/build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_INSTALL_LIBDIR=lib -Dpkg_config_libdir=${DEVEL_DIR}/install/lib ..

hrp2.configure: hrp2.configure.dep
	. ${DEVEL_DIR}/install/setup.sh; \
	cd ${SRC_DIR}/hrp2/hrp2_14_description;\
	mkdir -p build; \
	cd ${SRC_DIR}/hrp2/hrp2_14_description/build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} ..

hrp2.install: hrp2.configure
	cd ${SRC_DIR}/hrp2/hrp2_14_description/build;\
	make install

robot_model_py.configure: robot_model_py.configure.dep
	cd ${SRC_DIR}/$(@:.configure=)/xml_reflection;\
	mkdir -p build; \
	cd build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} ..
	cd ${SRC_DIR}/$(@:.configure=)/urdf_parser_py;\
	mkdir -p build; \
	cd build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} ..

robot_model_py.install: robot_model_py.configure
	cd ${SRC_DIR}/$(@:.install=)/xml_reflection/build; \
	make install; \
	cd ${SRC_DIR}/$(@:.install=)/urdf_parser_py/build; \
	make install;
