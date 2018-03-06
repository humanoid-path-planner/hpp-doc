#
# Copyright (c) 2014 CNRS-LAAS
# Author: Florent Lamiraux
#

FCL_REPO=https://github.com/flexible-collision-library
JRL_REPO=https://github.com/jrl-umi3218
LAAS_REPO=https://github.com/laas
HPP_REPO=https://github.com/humanoid-path-planner
SOT_REPO=https://github.com/stack-of-tasks
RETHINK_ROBOTICS_REPO=https://github.com/RethinkRobotics

SRC_DIR=${DEVEL_DIR}/src
INSTALL_DIR=${DEVEL_DIR}/install

# Whether to compute humanoid specific part
HUMANOID=TRUE

BUILD_TYPE=Release
ifeq (${BUILD_TYPE},Debug)
  BUILD_FOLDER=build
else
  BUILD_FOLDER=build-rel
endif

#OSG_PACKAGE=OpenSceneGraph-dae-plugin
OSG_PACKAGE=OpenSceneGraph-3.4.0

WGET=wget --quiet
UNZIP=unzip -qq
TAR=tar
GIT_QUIET=--quiet
# Qt version should be either 4 or 5
QT_VERSION=4

hpp-fcl_branch=devel
hpp-fcl_repository=${HPP_REPO}
hpp-fcl_extra_flags= -DCMAKE_BUILD_TYPE=Release

hpp-util_branch=devel
hpp-util_repository=${HPP_REPO}

pinocchio_branch=devel
pinocchio_repository=${SOT_REPO}
pinocchio_extra_flags= -DBUILD_PYTHON_INTERFACE=OFF -DBUILD_UNIT_TESTS=OFF

hpp-pinocchio_branch=devel
hpp-pinocchio_repository=${HPP_REPO}
hpp-pinocchio_extra_flags=-DDISABLE_TESTS=ON

hpp-statistics_branch=devel
hpp-statistics_repository=${HPP_REPO}

hpp-core_branch=devel
hpp-core_repository=${HPP_REPO}
hpp-core_extra_flags=-DDISABLE_TESTS=ON

hpp-template-corba_branch=devel
hpp-template-corba_repository=${LAAS_REPO}

hpp-corbaserver_branch=devel
hpp-corbaserver_repository=${HPP_REPO}

qpOASES_branch=devel
qpOASES_repository=${HPP_REPO}

hpp-constraints_branch=devel
hpp-constraints_repository=${HPP_REPO}
hpp-constraints_extra_flags=-DDISABLE_TESTS=ON

hpp-walkgen_branch=devel
hpp-walkgen_repository=${HPP_REPO}

hpp-wholebody-step_branch=devel
hpp-wholebody-step_repository=${HPP_REPO}

hpp-wholebody-step-corba_branch=devel
hpp-wholebody-step-corba_repository=${HPP_REPO}

test-hpp_branch=devel
test-hpp_repository=${HPP_REPO}

hrp2_branch=groovy
hrp2_repository=${JRL_REPO}

hpp-hrp2_branch=devel
hpp-hrp2_repository=${HPP_REPO}

robot_capsule_urdf_branch=groovy
robot_capsule_urdf_repository=${LAAS_REPO}

robot_model_py_branch=groovy
robot_model_py_repository=${LAAS_REPO}

hpp-doc_branch=devel
hpp-doc_repository=${HPP_REPO}

hpp-manipulation_branch=devel
hpp-manipulation_repository=${HPP_REPO}

hpp-manipulation-urdf_branch=devel
hpp-manipulation-urdf_repository=${HPP_REPO}

hpp-manipulation-corba_branch=devel
hpp-manipulation-corba_repository=${HPP_REPO}

robot_state_chain_publisher_branch=master
robot_state_chain_publisher_repository=${HPP_REPO}

iai_maps_branch=devel
iai_maps_repository=${HPP_REPO}

hpp_tutorial_branch=devel
hpp_tutorial_repository=${HPP_REPO}

hpp_benchmark_branch=master
hpp_benchmark_repository=${HPP_REPO}

collada-dom_branch=master
collada-dom_repository=${HPP_REPO}

OpenSceneGraph-dae-plugin_branch=master
OpenSceneGraph-dae-plugin_repository=${HPP_REPO}

gepetto-viewer_branch=devel
gepetto-viewer_repository=${HPP_REPO}

gepetto-viewer-corba_branch=devel
gepetto-viewer-corba_repository=${HPP_REPO}
ifeq (${QT_VERSION}, 5)
  gepetto-viewer-corba_extra_flags= -DUSE_QT4=OFF
endif

hpp-gepetto-viewer_branch=devel
hpp-gepetto-viewer_repository=${HPP_REPO}

pythonqt_branch=qt${QT_VERSION}
pythonqt_repository=${HPP_REPO}
pythonqt_extra_flags= -DPythonQt_Wrap_QtAll=ON -DPythonQt_Extensions=ON

qgv_branch=devel
qgv_repository=${HPP_REPO}

hpp-environments_branch=devel
hpp-environments_repository=${HPP_REPO}

universal_robot_branch=indigo-devel
universal_robot_repository=${HPP_REPO}

hpp_universal_robot_branch=devel
hpp_universal_robot_repository=${HPP_REPO}

baxter_common_branch=master
baxter_common_repository=${RETHINK_ROBOTICS_REPO}

hpp-baxter_branch=master
hpp-baxter_repository=${HPP_REPO}

hpp_romeo_branch=master
hpp_romeo_repository=${HPP_REPO}

romeo_branch=master
romeo_repository=${HPP_REPO}

OpenSceneGraph-dae-plugin_extra_flags= -DCOLLADA_DYNAMIC_LIBRARY=${INSTALL_DIR}/lib/libcollada14dom.so -DCOLLADA_INCLUDE_DIR=${INSTALL_DIR}/include/collada-dom
OpenSceneGraph-3.4.0_extra_flags= -DDESIRED_QT_VERSION=${QT_VERSION} -DCOLLADA_DYNAMIC_LIBRARY=${INSTALL_DIR}/lib/libcollada14dom.so -DCOLLADA_INCLUDE_DIR=${INSTALL_DIR}/include/collada-dom -DLIB_POSTFIX=""

collada-dom_extra_flags=-DBUILD_SHARED_LIBS=TRUE -DOPT_COLLADA15=FALSE

roboptim-core-3.1_extra_flags= -DCMAKE_BUILD_TYPE=Release -DCXX_DISABLE_WERROR=ON

roboptim-trajectory-3.1_extra_flags= -DCMAKE_BUILD_TYPE=Release -DCXX_DISABLE_WERROR=ON

qpOASES_extra_flags= -DCMAKE_BUILD_TYPE=Release

ifeq (${HUMANOID}, TRUE)
  hpp-manipulation_extra_flags=-DHPP_MANIPULATION_HAS_WHOLEBODY_STEP=TRUE
  hpp-manipulation-corba_extra_flags=-DHPP_MANIPULATION_HAS_WHOLEBODY_STEP=TRUE
else
  hpp-manipulation_extra_flags=-DHPP_MANIPULATION_HAS_WHOLEBODY_STEP=FALSE
  hpp-manipulation-corba_extra_flags=-DHPP_MANIPULATION_HAS_WHOLEBODY_STEP=FALSE
endif

all: hpp_tutorial.install hpp-gepetto-viewer.install
	${MAKE} hpp-doc.install

# source $DEVEL_DIR/install/setup.bash before installing hrp2.
hrp2: test-hpp.install

hpp-doc.configure.dep: hpp-doc.checkout
hpp-fcl.configure.dep: eigen3.install hpp-fcl.checkout
eigen3.configure.dep: eigen3.checkout
roboptim-core-3.1.configure.dep: eigen3.install roboptim-core-3.1.checkout
roboptim-trajectory-3.1.configure.dep: roboptim-core-3.1.install \
	roboptim-trajectory-3.1.checkout
hpp-walkgen.configure.dep: hpp-util.install hpp-core.install \
        roboptim-trajectory-3.1.install hpp-walkgen.checkout
hpp-util.configure.dep: hpp-util.checkout
hpp-model.configure.dep: hpp-util.install hpp-fcl.install \
	eigen3.install hpp-model.checkout
hpp-model-urdf.configure.dep: hpp-model.install hpp-model-urdf.checkout
pinocchio.configure.dep: eigen3.install hpp-fcl.install pinocchio.checkout
hpp-pinocchio.configure.dep: pinocchio.install hpp-util.install \
	hpp-pinocchio.checkout
hpp-statistics.configure.dep: hpp-util.install hpp-statistics.checkout
hpp-core.configure.dep: hpp-constraints.install hpp-statistics.install \
	hpp-core.checkout
qpOASES.configure.dep: qpOASES.checkout
hpp-constraints.configure.dep: qpOASES.install \
	hpp-pinocchio.install hpp-statistics.install hpp-constraints.checkout
hpp-wholebody-step.configure.dep: hpp-constraints.install hpp-walkgen.install \
	hpp-wholebody-step.checkout
ifeq (${HUMANOID}, TRUE)
hpp-manipulation.configure.dep: hpp-core.install hpp-constraints.install \
	hpp-wholebody-step.install hpp-manipulation.checkout
hpp-manipulation-corba.configure.dep: hpp-manipulation-urdf.install \
	hpp-wholebody-step-corba.install hpp-manipulation.install \
	hpp-manipulation-corba.checkout
hpp-plot.configure.dep: hpp-corbaserver.install hpp-manipulation-corba.install \
	hpp-wholebody-step-corba.install qgv.install \
	hpp-plot.checkout
else
hpp-manipulation.configure.dep: hpp-core.install hpp-constraints.install \
	hpp-manipulation.checkout
hpp-manipulation-corba.configure.dep: hpp-manipulation-urdf.install \
	hpp-manipulation.install hpp-corbaserver.install \
	hpp-template-corba.install hpp-manipulation-corba.checkout
hpp-plot.configure.dep: hpp-corbaserver.install hpp-manipulation-corba.install \
	qgv.install hpp-plot.checkout
endif
hpp-manipulation-urdf.configure.dep:hpp-manipulation.install \
	hpp-manipulation-urdf.checkout
hpp-corbaserver.configure.dep: hpp-core.install \
	hpp-constraints.install hpp-corbaserver.checkout
hpp-wholebody-step-corba.configure.dep: hpp-corbaserver.install \
	hpp-wholebody-step.install hpp-template-corba.install \
	hpp-wholebody-step-corba.checkout
hpp-template-corba.configure.dep: hpp-util.install hpp-template-corba.checkout
qgv.configure.dep: qgv.checkout
pythonqt.configure.dep: pythonqt.checkout
robot_model_py.configure.dep: robot_model_py.checkout
robot_capsule_urdf.configure.dep: robot_model_py.install \
	robot_capsule_urdf.checkout
hpp-hrp2.configure.dep: hrp2.install hpp-corbaserver.install hpp-hrp2.checkout
hrp2.configure.dep: robot_capsule_urdf.install robot_model_py.install \
	hrp2.checkout
test-hpp.configure.dep: hpp-wholebody-step-corba.install \
	hpp-gepetto-viewer.install hpp-hrp2.install test-hpp.checkout
robot_state_chain_publisher.configure.dep: robot_state_chain_publisher.checkout
iai_maps.configure.dep: robot_state_chain_publisher.install iai_maps.checkout
hpp_tutorial.configure.dep: hpp-gepetto-viewer.install iai_maps.install \
	hpp-manipulation-corba.install hpp_tutorial.checkout
hpp_benchmark.configure.dep: hpp_benchmark.checkout
collada-dom.configure.dep: collada-dom.checkout
OpenSceneGraph-dae-plugin.configure.dep: collada-dom.install \
	OpenSceneGraph-dae-plugin.checkout
OpenSceneGraph-3.4.0.configure.dep: collada-dom.install \
	OpenSceneGraph-3.4.0.checkout
gepetto-viewer.configure.dep: ${OSG_PACKAGE}.install \
	gepetto-viewer.checkout
gepetto-viewer-corba.configure.dep: gepetto-viewer.install \
	gepetto-viewer-corba.checkout
hpp-gepetto-viewer.configure.dep: gepetto-viewer-corba.install \
	hpp-corbaserver.install \
	hpp-gepetto-viewer.checkout
universal_robot.configure.dep: universal_robot.install \
	universal_robot.checkout
hpp_universal_robot.configure.dep: universal_robot.install \
	hpp_universal_robot.checkout
hpp-environments.configure.dep: hpp-environments.checkout
baxter_common.configure.dep: baxter_common.checkout
hpp-baxter.configure.dep: baxter_common.install hpp-baxter.checkout
pythonqt.configure.dep: pythonqt.checkout
hpp_romeo.configure.dep: romeo.install hpp_romeo.checkout
romeo.configure.dep: romeo.checkout

status:
	@for child_dir in $$(ls ${SRC_DIR}); do \
		test -d "$$child_dir" || continue; \
		test -d "$$child_dir/.git" || continue; \
		cd "$$child_dir";\
		echo \
		"\033[1;36m------- Folder $$child_dir ---------------\033[0m"; \
		git --no-pager -c status.showUntrackedFiles=no status --short --branch; \
		cd ..; \
	done

log:
	@for child_dir in $$(ls ${SRC_DIR}); do \
		test -d "$$child_dir" || continue; \
		test -d "$$child_dir/.git" || continue; \
		${MAKE} "$$child_dir".log; \
	done

update:
	@for child_dir in $$(ls ${SRC_DIR}); do \
		test -d "$$child_dir" || continue; \
		test -d "$$child_dir/.git" || continue; \
		${MAKE} "$$child_dir".update; \
	done

%.checkout:
	if [ -d $(@:.checkout=) ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
		git clone ${GIT_QUIET} --recursive -b ${$(@:.checkout=)_branch} ${$(@:.checkout=)_repository}/$(@:.checkout=); \
	fi \

%.update:
	if [ "${$(@:.update=)_repository}" = "" ]; then \
		echo "$(@:.update=) is not referenced"; \
	else \
		cd ${SRC_DIR}/$(@:.update=);\
		git remote rm origin;\
		git remote add origin ${$(@:.update=)_repository}/$(@:.update=);\
		git fetch origin;\
		git checkout -b bce46g origin/${$(@:.update=)_branch};\
		git branch -D ${$(@:.update=)_branch};\
		git checkout -b ${$(@:.update=)_branch} bce46g;\
		git branch -D bce46g;\
		git submodule update; \
	fi


%.configure: %.configure.dep
	${MAKE} $(@:.configure=).configure_nodep

%.configure_nodep:%.checkout
	mkdir -p ${SRC_DIR}/$(@:.configure_nodep=)/${BUILD_FOLDER}; \
	cd ${SRC_DIR}/$(@:.configure_nodep=)/${BUILD_FOLDER}; \
	cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \ -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-g -O3 -DNDEBUG" ${$(@:.configure_nodep=)_extra_flags} ..

%.install:%.configure
	${MAKE} -C ${SRC_DIR}/$(@:.install=)/${BUILD_FOLDER} install

%.install_nodep:%.configure_nodep
	${MAKE} -C ${SRC_DIR}/$(@:.install_nodep=)/${BUILD_FOLDER} install

%.uninstall:
	${MAKE} -C ${SRC_DIR}/$(@:.uninstall=)/${BUILD_FOLDER} uninstall

%.clean:
	${MAKE} -C ${SRC_DIR}/$(@:.clean=)/${BUILD_FOLDER} clean

%.very-clean:
	rm -rf ${SRC_DIR}/$(@:.very-clean=)/${BUILD_FOLDER}/*

%.status:
	cd ${SRC_DIR}/$(@:.status=); git status

%.log:
	@cd ${SRC_DIR}/$(@:.log=); \
	if [ -f .git/refs/heads/${$(@:.log=)_branch} ]; then \
		echo -n "$(@:.log=): "; \
		cat .git/refs/heads/${$(@:.log=)_branch}; \
	fi

eigen3.checkout:
	if [ -d $(@:.checkout=) ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
		${WGET} -O - "http://bitbucket.org/eigen/eigen/get/3.2.4.tar.bz2" | ${TAR} -xj; \
		mv eigen-eigen-10219c95fe65 eigen3;\
	fi

eigen3.configure: eigen3.configure.dep
	cd ${SRC_DIR}/eigen3;\
	mkdir -p ${BUILD_FOLDER}; \
	cd ${SRC_DIR}/eigen3/${BUILD_FOLDER}; \
	cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} -DCMAKE_INSTALL_LIBDIR=lib -Dpkg_config_libdir=${INSTALL_DIR}/lib ..

roboptim-core-3.1.checkout:
	if [ -d $(@:.checkout=) ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
		${WGET} -O - "https://github.com/roboptim/roboptim-core/releases/download/v3.1/roboptim-core-3.1.tar.bz2" | ${TAR} -xj; \
	fi

OpenSceneGraph-3.4.0.checkout:
	if [ -d $(@:.checkout=) ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
		wget http://www.openscenegraph.org/downloads/stable_releases/OpenSceneGraph-3.4.0/source/OpenSceneGraph-3.4.0.zip;\
		cd ${SRC_DIR}; unzip OpenSceneGraph-3.4.0.zip;\
		rm -f OpenSceneGraph-3.4.0.zip;\
	fi

roboptim-trajectory-3.1.checkout:
	if [ -d $(@:.checkout=) ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
	  ${WGET} -O - "https://github.com/roboptim/roboptim-trajectory/releases/download/v3.1/roboptim-trajectory-3.1.tar.bz2" | ${TAR} -xj; \
	fi

hrp2.configure: hrp2.configure.dep
	. ${INSTALL_DIR}/setup.sh; \
	cd ${SRC_DIR}/hrp2/hrp2_14_description;\
	mkdir -p ${BUILD_FOLDER}; \
	cd ${SRC_DIR}/hrp2/hrp2_14_description/${BUILD_FOLDER}; \
	cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} ..

hrp2.install: hrp2.configure
	${MAKE} -C ${SRC_DIR}/hrp2/hrp2_14_description/${BUILD_FOLDER} install

robot_model_py.configure: robot_model_py.configure.dep
	cd ${SRC_DIR}/$(@:.configure=)/xml_reflection;\
	mkdir -p ${BUILD_FOLDER}; \
	cd ${BUILD_FOLDER}; \
	cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} ..
	cd ${SRC_DIR}/$(@:.configure=)/urdf_parser_py;\
	mkdir -p ${BUILD_FOLDER}; \
	cd ${BUILD_FOLDER}; \
	cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} ..

robot_model_py.install: robot_model_py.configure
	${MAKE} -C ${SRC_DIR}/$(@:.install=)/xml_reflection/${BUILD_FOLDER} install; \
	${MAKE} -C ${SRC_DIR}/$(@:.install=)/urdf_parser_py/${BUILD_FOLDER} install;

universal_robot.configure_nodep:
	mkdir -p ${SRC_DIR}/$(@:.configure_nodep=)/ur_description/${BUILD_FOLDER}; \
	cd ${SRC_DIR}/$(@:.configure_nodep=)/ur_description/${BUILD_FOLDER}; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-g -O3 -DNDEBUG" ${$(@:.configure_nodep=)_extra_flags} ..

universal_robot.install_nodep:universal_robot.configure_nodep
	cd ${SRC_DIR}/$(@:.install_nodep=)/ur_description/${BUILD_FOLDER};\
	make install

universal_robot.install:universal_robot.configure
	cd ${SRC_DIR}/$(@:.install=)/ur_description/${BUILD_FOLDER};\
	make install

baxter_common.configure_nodep:
	mkdir -p ${SRC_DIR}/$(@:.configure_nodep=)/baxter_description/${BUILD_FOLDER}; \
	cd ${SRC_DIR}/$(@:.configure_nodep=)/baxter_description/${BUILD_FOLDER}; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-g -O3 -DNDEBUG" ${$(@:.configure_nodep=)_extra_flags} ..; \
	mkdir -p ${SRC_DIR}/$(@:.configure_nodep=)/rethink_ee_description/${BUILD_FOLDER}; \
	cd ${SRC_DIR}/$(@:.configure_nodep=)/rethink_ee_description/${BUILD_FOLDER}; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-g -O3 -DNDEBUG" ${$(@:.configure_nodep=)_extra_flags} ..

baxter_common.install_nodep:baxter_common.configure_nodep
	cd ${SRC_DIR}/$(@:.install_nodep=)/baxter_description/${BUILD_FOLDER};\
	make install; \
	cd ${SRC_DIR}/$(@:.install_nodep=)/rethink_ee_description/${BUILD_FOLDER};\
	make install

baxter_common.install:baxter_common.configure
	cd ${SRC_DIR}/$(@:.install=)/baxter_description/${BUILD_FOLDER};\
	make install; \
	cd ${SRC_DIR}/$(@:.install=)/rethink_ee_description/${BUILD_FOLDER};\
	make install

romeo.configure: romeo.configure.dep
	. ${INSTALL_DIR}/setup.sh; \
	cd ${SRC_DIR}/romeo/romeo_description;\
	mkdir -p ${BUILD_FOLDER}; \
	cd ${SRC_DIR}/romeo/romeo_description/${BUILD_FOLDER}; \
	cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} ..

romeo.install: romeo.configure
	${MAKE} -C ${SRC_DIR}/romeo/romeo_description/${BUILD_FOLDER} install
