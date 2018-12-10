#
# Copyright (c) 2014 CNRS-LAAS
# Author: Florent Lamiraux
#

FCL_REPO=https://github.com/flexible-collision-library
LAAS_REPO=https://github.com/laas
HPP_REPO=https://github.com/humanoid-path-planner
SOT_REPO=https://github.com/stack-of-tasks
GEPETTO_REPO=https://github.com/Gepetto
RETHINK_ROBOTICS_REPO=https://github.com/RethinkRobotics
TRAC_REPO=ssh://trac.laas.fr/git/jrl/robots/ros-hrp2

SRC_DIR=${DEVEL_HPP_DIR}/src
ifndef INSTALL_HPP_DIR
INSTALL_HPP_DIR=${DEVEL_HPP_DIR}/install
endif

# Whether to compute humanoid specific part
HUMANOID=TRUE

BUILD_TYPE=Release
ifeq (${BUILD_TYPE},Debug)
  BUILD_FOLDER=build
else
  BUILD_FOLDER=build-rel
endif

OSG_PACKAGE=osg-dae
#OSG_PACKAGE=OpenSceneGraph-3.4.0

WGET=wget --quiet
UNZIP=unzip -qq
TAR=tar
GIT_QUIET=--quiet
# Qt version should be either 4 or 5
QT_VERSION=4
INSTALL_DOCUMENTATION=ON

hpp-fcl_branch=master
hpp-fcl_repository=${HPP_REPO}
hpp-fcl_extra_flags= -DCMAKE_BUILD_TYPE=Release

roboptim-core_branch=master
roboptim-core_repository=${ROBOPTIM_REPO}
roboptim-core_extra_flags= -DCMAKE_BUILD_TYPE=Release -DCXX_DISABLE_WERROR=ON

roboptim-trajectory_branch=master
roboptim-trajectory_repository=${ROBOPTIM_REPO}
roboptim-trajectory_extra_flags= -DCMAKE_BUILD_TYPE=Release -DCXX_DISABLE_WERROR=ON

hpp-util_branch=master
hpp-util_repository=${HPP_REPO}

pinocchio_branch=hpp
pinocchio_repository=${SOT_REPO}
pinocchio_extra_flags= -DBUILD_PYTHON_INTERFACE=OFF

hpp-pinocchio_branch=master
hpp-pinocchio_repository=${HPP_REPO}
hpp-pinocchio_extra_flags=-DDISABLE_TESTS=ON

hpp-statistics_branch=master
hpp-statistics_repository=${HPP_REPO}

hpp-core_branch=master
hpp-core_repository=${HPP_REPO}
hpp-core_extra_flags=-DDISABLE_TESTS=ON

hpp-template-corba_branch=master
hpp-template-corba_repository=${HPP_REPO}

hpp-corbaserver_branch=master
hpp-corbaserver_repository=${HPP_REPO}

qpOASES_branch=master
qpOASES_repository=${HPP_REPO}

hpp-constraints_branch=master
hpp-constraints_repository=${HPP_REPO}
hpp-constraints_extra_flags=-DDISABLE_TESTS=ON

hpp-walkgen_branch=master
hpp-walkgen_repository=${HPP_REPO}

hpp-wholebody-step_branch=master
hpp-wholebody-step_repository=${HPP_REPO}

hpp-wholebody-step-corba_branch=master
hpp-wholebody-step-corba_repository=${HPP_REPO}

test-hpp_branch=master
test-hpp_repository=${HPP_REPO}

hrp2-14-description_branch=master
hrp2-14-description_repository=${TRAC_REPO}

hpp-hrp2_branch=master
hpp-hrp2_repository=${HPP_REPO}

robot_capsule_urdf_branch=groovy
robot_capsule_urdf_repository=${LAAS_REPO}

robot_model_py_branch=groovy
robot_model_py_repository=${LAAS_REPO}

hpp-doc_branch=master
hpp-doc_repository=${HPP_REPO}

hpp-manipulation_branch=master
hpp-manipulation_repository=${HPP_REPO}


hpp-manipulation-urdf_branch=master
hpp-manipulation-urdf_repository=${HPP_REPO}

hpp-manipulation-corba_branch=master
hpp-manipulation-corba_repository=${HPP_REPO}

iai_maps_branch=master
iai_maps_repository=${HPP_REPO}

hpp_tutorial_branch=master
hpp_tutorial_repository=${HPP_REPO}

hpp_benchmark_branch=master
hpp_benchmark_repository=${HPP_REPO}

collada-dom_branch=master
collada-dom_repository=${HPP_REPO}

osg-dae_branch=master
osg-dae_repository=${GEPETTO_REPO}

gepetto-viewer_branch=master
gepetto-viewer_repository=${GEPETTO_REPO}

gepetto-viewer-corba_branch=master
gepetto-viewer-corba_repository=${GEPETTO_REPO}
ifeq (${QT_VERSION}, 5)
  gepetto-viewer-corba_extra_flags= -DUSE_QT4=OFF
endif

hpp-gepetto-viewer_branch=master
hpp-gepetto-viewer_repository=${HPP_REPO}

pythonqt_branch=qt${QT_VERSION}
pythonqt_repository=${HPP_REPO}
pythonqt_extra_flags= -DPythonQt_Wrap_QtAll=ON -DPythonQt_Extensions=ON

qgv_branch=master
qgv_repository=${HPP_REPO}

hpp-plot_branch=master
hpp-plot_repository=${HPP_REPO}

hpp-gui_branch=master
hpp-gui_repository=${HPP_REPO}

hpp-environments_branch=master
hpp-environments_repository=${HPP_REPO}

universal_robot_branch=kinetic
universal_robot_repository=${HPP_REPO}

hpp_universal_robot_branch=master
hpp_universal_robot_repository=${HPP_REPO}

baxter_common_branch=master
baxter_common_repository=${RETHINK_ROBOTICS_REPO}

hpp-baxter_branch=master
hpp-baxter_repository=${HPP_REPO}

hpp_romeo_branch=master
hpp_romeo_repository=${HPP_REPO}

romeo_branch=master
romeo_repository=${HPP_REPO}

osg-dae_extra_flags= -DCOLLADA_DYNAMIC_LIBRARY=${INSTALL_HPP_DIR}/lib/libcollada14dom.so -DCOLLADA_INCLUDE_DIR=${INSTALL_HPP_DIR}/include/collada-dom
OpenSceneGraph-3.4.0_extra_flags= -DDESIRED_QT_VERSION=${QT_VERSION} -DCOLLADA_DYNAMIC_LIBRARY=${INSTALL_HPP_DIR}/lib/libcollada14dom.so -DCOLLADA_INCLUDE_DIR=${INSTALL_HPP_DIR}/include/collada-dom -DLIB_POSTFIX=""

collada-dom_extra_flags=-DBUILD_SHARED_LIBS=TRUE -DOPT_COLLADA15=FALSE

ifeq (${HUMANOID}, TRUE)
  hpp-manipulation_extra_flags=-DHPP_MANIPULATION_HAS_WHOLEBODY_STEP=TRUE
  hpp-manipulation-corba_extra_flags=-DHPP_MANIPULATION_HAS_WHOLEBODY_STEP=TRUE
else
  hpp-manipulation_extra_flags=-DHPP_MANIPULATION_HAS_WHOLEBODY_STEP=FALSE
  hpp-manipulation-corba_extra_flags=-DHPP_MANIPULATION_HAS_WHOLEBODY_STEP=FALSE
endif

all: hpp_tutorial.install hpp-gepetto-viewer.install
	${MAKE} hpp-doc.install

# For test on gepgitlab, install robot packages first
test-ci: baxter_common.install romeo.install universal_robot.install \
	hpp-environments.install
	${MAKE} hpp_tutorial.install hpp-gepetto-viewer.install \
	hpp-universal-robot.install && \
	${MAKE} hpp-doc.install

# For benchmark, install robot packages first
benchmark: baxter_common.install romeo.install universal_robot.install \
	hpp-environments.install hrp2-14-description.install
	${MAKE} hpp_tutorial.install hpp-gepetto-viewer.install; \
	${MAKE} hpp-baxter.install hpp_romeo.install \
	hpp-universal-robot.install hpp-plot.install hpp-gui.install; \
	${MAKE} hpp_benchmark.checkout; \
	${MAKE} hpp-doc.install

hpp-doc.configure.dep: hpp-doc.checkout
hpp-fcl.configure.dep: hpp-fcl.checkout
hpp-walkgen.configure.dep: hpp-util.install hpp-core.install \
	hpp-walkgen.checkout
hpp-util.configure.dep: hpp-util.checkout
hpp-model-urdf.configure.dep: hpp-model.install hpp-model-urdf.checkout
pinocchio.configure.dep: hpp-fcl.install pinocchio.checkout
hpp-pinocchio.configure.dep: pinocchio.install hpp-util.install \
	hpp-pinocchio.checkout
hpp-statistics.configure.dep: hpp-util.install hpp-statistics.checkout
hpp-core.configure.dep: hpp-constraints.install hpp-statistics.install \
	hpp-core.checkout
hpp-constraints.configure.dep: hpp-pinocchio.install hpp-statistics.install \
	hpp-constraints.checkout
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
hpp-hrp2.configure.dep: hrp2-14-description.install hpp-corbaserver.install \
	hpp-hrp2.checkout
hrp2-14-description.configure.dep: robot_capsule_urdf.install \
	robot_model_py.install hrp2-14-description.checkout
test-hpp.configure.dep: hpp-wholebody-step-corba.install \
	hpp-gepetto-viewer.install hpp-hrp2.install test-hpp.checkout
iai_maps.configure.dep: iai_maps.checkout
hpp_tutorial.configure.dep: hpp-gepetto-viewer.install iai_maps.install \
	hpp-manipulation-corba.install hpp_tutorial.checkout
hpp_benchmark.configure.dep: hpp_benchmark.checkout
collada-dom.configure.dep: collada-dom.checkout
osg-dae.configure.dep: collada-dom.install \
	osg-dae.checkout
OpenSceneGraph-3.4.0.configure.dep: collada-dom.install \
	OpenSceneGraph-3.4.0.checkout
gepetto-viewer.configure.dep: ${OSG_PACKAGE}.install \
	gepetto-viewer.checkout
gepetto-viewer-corba.configure.dep: gepetto-viewer.install \
	pythonqt.install gepetto-viewer-corba.checkout
hpp-gepetto-viewer.configure.dep: gepetto-viewer-corba.install \
	hpp-corbaserver.install \
	hpp-gepetto-viewer.checkout
hpp-gui.configure.dep: hpp-gui.checkout
universal_robot.configure.dep: universal_robot.checkout
hpp-universal-robot.configure.dep: universal_robot.install \
	hpp-universal-robot.checkout
hpp-environments.configure.dep: hpp-environments.checkout
baxter_common.configure.dep: baxter_common.checkout
hpp-baxter.configure.dep: baxter_common.install hpp-baxter.checkout
hpp_romeo.configure.dep: romeo.install hpp_romeo.checkout
romeo.configure.dep: romeo.checkout

status:
	@for child_dir in $$(ls ${SRC_DIR}); do \
		test -d "$$child_dir" || continue; \
		test -d "$$child_dir/.git" || continue; \
		${MAKE} "$$child_dir".status; \
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
		git checkout -q --detach;\
		git branch -f ${$(@:.update=)_branch} origin/${$(@:.update=)_branch};\
		git checkout -q ${$(@:.update=)_branch};\
		git submodule update; \
	fi


%.configure: %.configure.dep
	${MAKE} $(@:.configure=).configure_nodep

%.configure_nodep:%.checkout
	mkdir -p ${SRC_DIR}/$(@:.configure_nodep=)/${BUILD_FOLDER}; \
	cd ${SRC_DIR}/$(@:.configure_nodep=)/${BUILD_FOLDER}; \
	cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_HPP_DIR} -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
			-DINSTALL_DOCUMENTATION=${INSTALL_DOCUMENTATION} \
			-DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-g -O3 -DNDEBUG" \
			${$(@:.configure_nodep=)_extra_flags} ..

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
	@cd ${SRC_DIR}/$(@:.status=); \
	echo \
	"\033[1;36m------- Folder $(@:.status=) ---------------\033[0m"; \
	git --no-pager -c status.showUntrackedFiles=no status --short --branch;\

%.log:
	@cd ${SRC_DIR}/$(@:.log=); \
	if [ -f .git/refs/heads/${$(@:.log=)_branch} ]; then \
		echo -n "$(@:.log=): "; \
		cat .git/refs/heads/${$(@:.log=)_branch}; \
	fi

OpenSceneGraph-3.4.0.checkout:
	if [ -d $(@:.checkout=) ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
		wget http://www.openscenegraph.org/downloads/stable_releases/OpenSceneGraph-3.4.0/source/OpenSceneGraph-3.4.0.zip;\
		cd ${SRC_DIR}; unzip OpenSceneGraph-3.4.0.zip;\
		rm -f OpenSceneGraph-3.4.0.zip;\
	fi

robot_model_py.configure: robot_model_py.configure.dep
	cd ${SRC_DIR}/$(@:.configure=)/xml_reflection;\
	mkdir -p ${BUILD_FOLDER}; \
	cd ${BUILD_FOLDER}; \
	cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_HPP_DIR} -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} ..
	cd ${SRC_DIR}/$(@:.configure=)/urdf_parser_py;\
	mkdir -p ${BUILD_FOLDER}; \
	cd ${BUILD_FOLDER}; \
	cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_HPP_DIR} -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} ..

robot_model_py.install: robot_model_py.configure
	${MAKE} -C ${SRC_DIR}/$(@:.install=)/xml_reflection/${BUILD_FOLDER} install; \
	${MAKE} -C ${SRC_DIR}/$(@:.install=)/urdf_parser_py/${BUILD_FOLDER} install;

universal_robot.configure_nodep:
	mkdir -p ${SRC_DIR}/$(@:.configure_nodep=)/ur_description/${BUILD_FOLDER}; \
	cd ${SRC_DIR}/$(@:.configure_nodep=)/ur_description/${BUILD_FOLDER}; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_HPP_DIR}/install -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-g -O3 -DNDEBUG" ${$(@:.configure_nodep=)_extra_flags} ..

universal_robot.install_nodep:universal_robot.configure_nodep
	cd ${SRC_DIR}/$(@:.install_nodep=)/ur_description/${BUILD_FOLDER};\
	make install

universal_robot.install:universal_robot.configure
	cd ${SRC_DIR}/$(@:.install=)/ur_description/${BUILD_FOLDER};\
	make install

baxter_common.configure_nodep:
	mkdir -p ${SRC_DIR}/$(@:.configure_nodep=)/baxter_description/${BUILD_FOLDER}; \
	cd ${SRC_DIR}/$(@:.configure_nodep=)/baxter_description/${BUILD_FOLDER}; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_HPP_DIR}/install -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-g -O3 -DNDEBUG" ${$(@:.configure_nodep=)_extra_flags} ..; \
	mkdir -p ${SRC_DIR}/$(@:.configure_nodep=)/rethink_ee_description/${BUILD_FOLDER}; \
	cd ${SRC_DIR}/$(@:.configure_nodep=)/rethink_ee_description/${BUILD_FOLDER}; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_HPP_DIR}/install -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-g -O3 -DNDEBUG" ${$(@:.configure_nodep=)_extra_flags} ..

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
	. ${INSTALL_HPP_DIR}/setup.sh; \
	cd ${SRC_DIR}/romeo/romeo_description;\
	mkdir -p ${BUILD_FOLDER}; \
	cd ${SRC_DIR}/romeo/romeo_description/${BUILD_FOLDER}; \
	cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_HPP_DIR} -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} ..

romeo.install: romeo.configure
	${MAKE} -C ${SRC_DIR}/romeo/romeo_description/${BUILD_FOLDER} install
