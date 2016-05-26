#
# Copyright (c) 2014 CNRS-LAAS
# Author: Florent Lamiraux
#

FCL_REPO=https://github.com/flexible-collision-library
JRL_REPO=https://github.com/jrl-umi3218
LAAS_REPO=https://github.com/laas
HPP_REPO=https://github.com/humanoid-path-planner
ROS_INDUSTRIAL=https://github.com/ros-industrial

SRC_DIR=${DEVEL_DIR}/src
# Installation prefix. If you change the installation prefix, you should
# also change it in file ../config.sh
INSTALL_DIR=${DEVEL_DIR}/install

BUILD_TYPE=Release
ifeq (${BUILD_TYPE},Debug)
  BUILD_FOLDER=build
else
  BUILD_FOLDER=build-rel
endif

hpp-fcl_branch=isae
hpp-fcl_repository=${HPP_REPO}

hpp-util_branch=isae
hpp-util_repository=${HPP_REPO}

hpp-model_branch=isae
hpp-model_repository=${HPP_REPO}

hpp-model-urdf_branch=isae
hpp-model-urdf_repository=${HPP_REPO}

hpp-statistics_branch=isae
hpp-statistics_repository=${HPP_REPO}

hpp-core_branch=isae
hpp-core_repository=${HPP_REPO}

hpp-template-corba_branch=master
hpp-template-corba_repository=${LAAS_REPO}

hpp-corbaserver_branch=isae
hpp-corbaserver_repository=${HPP_REPO}

qpOASES_branch=master
qpOASES_repository=${HPP_REPO}

hpp-constraints_branch=isae
hpp-constraints_repository=${HPP_REPO}

hpp-walkgen_branch=master
hpp-walkgen_repository=${HPP_REPO}

hpp-wholebody-step_branch=isae
hpp-wholebody-step_repository=${HPP_REPO}

hpp-wholebody-step-corba_branch=master
hpp-wholebody-step-corba_repository=${HPP_REPO}

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

hpp-doc_branch=isae
hpp-doc_repository=${HPP_REPO}

hpp-manipulation_branch=isae
hpp-manipulation_repository=${HPP_REPO}

hpp-manipulation-urdf_branch=isae
hpp-manipulation-urdf_repository=${HPP_REPO}

hpp-manipulation-corba_branch=isae
hpp-manipulation-corba_repository=${HPP_REPO}

robot_state_chain_publisher_branch=master
robot_state_chain_publisher_repository=${HPP_REPO}

iai_maps_branch=master
iai_maps_repository=${HPP_REPO}

hpp_tutorial_branch=master
hpp_tutorial_repository=${HPP_REPO}

hpp_benchmark_branch=master
hpp_benchmark_repository=${HPP_REPO}

collada-dom_branch=master
collada-dom_repository=${HPP_REPO}

gepetto-viewer_branch=isae
gepetto-viewer_repository=${HPP_REPO}

gepetto-viewer-corba_branch=isae
gepetto-viewer-corba_repository=${HPP_REPO}

hpp-gepetto-viewer_branch=isae
hpp-gepetto-viewer_repository=${HPP_REPO}

hpp-gui_branch=devel
hpp-gui_repository=${HPP_REPO}

universal_robot_branch=indigo-devel
universal_robot_repository=${ROS_INDUSTRIAL}

hpp_universal_robot_branch=isae
hpp_universal_robot_repository=${HPP_REPO}

qgv_branch=isae
qgv_repository=${HPP_REPO}

hpp-plot_branch=isae
hpp-plot_repository=${HPP_REPO}

OpenSceneGraph-3.4.0_extra_flags= -DDESIRED_QT_VERSION=4 -DCOLLADA_DYNAMIC_LIBRARY=${INSTALL_DIR}/lib/libcollada14dom.so -DCOLLADA_INCLUDE_DIR=${INSTALL_DIR}/include/collada-dom -DLIB_POSTFIX=""

doxygen-Release_1_8_10_extra_flags= -DCMAKE_BUILD_TYPE=Release

roboptim-core-3.1_extra_flags= -DCMAKE_BUILD_TYPE=Release

roboptim-trajectory-3.1_extra_flags= -DCMAKE_BUILD_TYPE=Release

qpOASES_extra_flags= -DCMAKE_BUILD_TYPE=Release

all: doxygen-Release_1_8_10.install hpp-gepetto-viewer.install \
	hpp-manipulation-corba.install hpp-plot.install hpp-gui.install
	${MAKE} hpp-doc.install

# source $DEVEL_DIR/install/setup.bash before installing hrp2.
hrp2: test-hpp.install

hpp-fcl.configure.dep: eigen3.install hpp-fcl.checkout
eigen3.configure.dep: eigen3.checkout
doxygen-Release_1_8_10.configure.dep: doxygen-Release_1_8_10.checkout
roboptim-core-3.1.configure.dep: eigen3.install roboptim-core-3.1.checkout
roboptim-trajectory-3.1.configure.dep: roboptim-core-3.1.install \
	roboptim-trajectory-3.1.checkout
hpp-walkgen.configure.dep: hpp-util.install hpp-core.install \
	roboptim-trajectory-3.1.install hpp-walkgen.checkout
hpp-util.configure.dep: hpp-util.checkout
hpp-model.configure.dep: hpp-util.install hpp-fcl.install \
	eigen3.install hpp-model.checkout
hpp-model-urdf.configure.dep: hpp-model.install hpp-model-urdf.checkout
hpp-statistics.configure.dep: hpp-statistics.checkout
hpp-core.configure.dep: hpp-constraints.install hpp-statistics.install \
	hpp-core.checkout
qpOASES.configure.dep: qpOASES.checkout
hpp-constraints.configure.dep: qpOASES.install hpp-model.install hpp-constraints.checkout
hpp-wholebody-step.configure.dep: hpp-constraints.install hpp-walkgen.install \
	hpp-wholebody-step.checkout
hpp-manipulation.configure.dep: hpp-core.install hpp-constraints.install \
	hpp-wholebody-step.install hpp-manipulation.checkout
hpp-manipulation-urdf.configure.dep:hpp-manipulation.install \
	hpp-model-urdf.install hpp-manipulation-urdf.checkout
hpp-corbaserver.configure.dep: hpp-model-urdf.install hpp-core.install \
	hpp-constraints.install hpp-corbaserver.checkout
hpp-wholebody-step-corba.configure.dep: hpp-corbaserver.install \
	hpp-wholebody-step.install hpp-template-corba.install \
	hpp-wholebody-step-corba.checkout
hpp-template-corba.configure.dep: hpp-util.install hpp-template-corba.checkout
hpp-manipulation-corba.configure.dep: hpp-manipulation-urdf.install \
	hpp-wholebody-step-corba.install hpp-manipulation.install \
	hpp-manipulation-corba.checkout
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
	hpp-corbaserver.install hpp_tutorial.checkout
hpp_benchmark.configure.dep: hpp_benchmark.checkout
collada-dom.configure.dep: collada-dom.checkout
OpenSceneGraph-3.4.0.configure.dep: collada-dom.install \
	OpenSceneGraph-3.4.0.checkout
gepetto-viewer.configure.dep: OpenSceneGraph-3.4.0.install \
	gepetto-viewer.checkout
gepetto-viewer-corba.configure.dep: gepetto-viewer.install \
	gepetto-viewer-corba.checkout
hpp-gepetto-viewer.configure.dep: gepetto-viewer-corba.install \
	hpp-corbaserver.install \
	hpp-gepetto-viewer.checkout
qgv.configure.dep: qgv.checkout
hpp-plot.configure.dep: hpp-manipulation-corba.install \
	hpp-wholebody-step-corba \
	hpp-corbaserver.install \
	qgv.install \
	hpp-plot.checkout
hpp-gui.configure.dep: gepetto-viewer-corba hpp-manipulation-corba \
	hpp-gui.checkout
universal_robot.configure.dep: universal_robot.checkout
hpp_universal_robot.configure.dep: universal_robot.install \
	hpp_universal_robot.checkout

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
	for d in hpp-util hpp-model hpp-model-urdf hpp-core hpp-template-corba hpp-corbaserver hpp-constraints hpp-wholebody-step hpp-wholebody-step-corba hpp-doc ; do \
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
	git remote rm origin;\
	git remote add origin ${$(@:.update=)_repository}/$(@:.update=);\
	git fetch origin;\
	git checkout -b bce46g origin/${$(@:.update=)_branch};\
	git branch -D ${$(@:.update=)_branch};\
	git checkout -b ${$(@:.update=)_branch} bce46g;\
	git branch -D bce46g;\
	git submodule update

%.configure:%.configure.dep
	cd ${SRC_DIR}/$(@:.configure=);\
	mkdir -p ${BUILD_FOLDER}; \
	cd ${SRC_DIR}/$(@:.configure=)/${BUILD_FOLDER}; \
	cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-g -O3 -DNDEBUG" ${$(@:.configure=)_extra_flags} ..

%.install:%.configure
	cd ${SRC_DIR}/$(@:.install=)/${BUILD_FOLDER};\
	make install

%.uninstall:
	cd ${SRC_DIR}/$(@:.uninstall=)/${BUILD_FOLDER};\
	make uninstall

%.clean:
	cd ${SRC_DIR}/$(@:.clean=)/${BUILD_FOLDER};\
	make clean

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


hpp-doc.configure: hpp-doc.checkout
	cd ${SRC_DIR}/$(@:.configure=);\
	./bootstrap;\
	mkdir -p ${BUILD_FOLDER}; \
	cd ${SRC_DIR}/$(@:.configure=)/${BUILD_FOLDER}; \
	../configure --prefix=${INSTALL_DIR}

eigen3.checkout:
	if [ -d $(@:.checkout=) ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
		wget -O - "http://bitbucket.org/eigen/eigen/get/3.2.4.tar.bz2" | tar -xj; \
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
		wget -O - "https://github.com/roboptim/roboptim-core/releases/download/v3.1/roboptim-core-3.1.tar.bz2" | tar -xj; \
	fi

roboptim-trajectory-3.1.checkout:
	if [ -d $(@:.checkout=) ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
	        wget -O - "https://github.com/roboptim/roboptim-trajectory/releases/download/v3.1/roboptim-trajectory-3.1.tar.bz2" | tar -xj; \
	fi

doxygen-Release_1_8_10.checkout:
	if [ -d $(@:.checkout=) ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
		wget -O - "https://github.com/doxygen/doxygen/archive/Release_1_8_10.tar.gz" | tar -xz;\
	fi

hrp2.configure: hrp2.configure.dep
	. ${INSTALL_DIR}/setup.sh; \
	cd ${SRC_DIR}/hrp2/hrp2_14_description;\
	mkdir -p ${BUILD_FOLDER}; \
	cd ${SRC_DIR}/hrp2/hrp2_14_description/${BUILD_FOLDER}; \
	cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} ..

hrp2.install: hrp2.configure
	cd ${SRC_DIR}/hrp2/hrp2_14_description/${BUILD_FOLDER};\
	make install

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
	cd ${SRC_DIR}/$(@:.install=)/xml_reflection/${BUILD_FOLDER}; \
	make install; \
	cd ${SRC_DIR}/$(@:.install=)/urdf_parser_py/${BUILD_FOLDER}; \
	make install;

OpenSceneGraph-3.4.0.checkout:
	if [ -d $(@:.checkout=) ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
		wget http://www.openscenegraph.org/downloads/stable_releases/OpenSceneGraph-3.4.0/source/OpenSceneGraph-3.4.0.zip;\
		cd ${SRC_DIR}; unzip OpenSceneGraph-3.4.0.zip;\
		rm -f OpenSceneGraph-3.4.0.zip;\
	fi

universal_robot.configure: universal_robot.configure.dep
	cd ${SRC_DIR}/universal_robot/ur_description;\
	mkdir -p ${BUILD_FOLDER}; \
	cd ${SRC_DIR}/universal_robot/ur_description/${BUILD_FOLDER}; \
	cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} ..

universal_robot.install: universal_robot.configure
	cd ${SRC_DIR}/universal_robot/ur_description/${BUILD_FOLDER};\
	make install
