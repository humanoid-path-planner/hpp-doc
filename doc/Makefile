#
# Copyright (c) 2014, 2015 CNRS-LAAS
# Author: Florent Lamiraux
#

SVN_USERNAME=
SVN_PASSWORD=

JRL_REPO=https://github.com/jrl-umi3218
LAAS_REPO=https://github.com/laas
HPP_REPO=https://github.com/humanoid-path-planner
DLR_REPO=https://svn.dlr.de/euroc_c2
SRC_DIR=${DEVEL_DIR}/src
BUILD_TYPE=Debug

hpp-fcl_branch=euroc
hpp-fcl_repository=${HPP_REPO}

hpp-util_branch=euroc
hpp-util_repository=${HPP_REPO}

hpp-model_branch=euroc
hpp-model_repository=${HPP_REPO}

hpp-model-urdf_branch=euroc
hpp-model-urdf_repository=${HPP_REPO}

hpp-statistics_branch=euroc
hpp-statistics_repository=${HPP_REPO}

hpp-core_branch=euroc
hpp-core_repository=${HPP_REPO}

hpp-template-corba_branch=master
hpp-template-corba_repository=${LAAS_REPO}

hpp-corbaserver_branch=euroc
hpp-corbaserver_repository=${HPP_REPO}

hpp-constraints_branch=euroc
hpp-constraints_repository=${HPP_REPO}

hpp-wholebody-step_branch=euroc
hpp-wholebody-step_repository=${HPP_REPO}

hpp-wholebody-step-corba_branch=euroc
hpp-wholebody-step-corba_repository=${HPP_REPO}

test-hpp_branch=devel
test-hpp_repository=${HPP_REPO}

robot_capsule_urdf_branch=groovy
robot_capsule_urdf_repository=${LAAS_REPO}

robot_model_py_branch=groovy
robot_model_py_repository=${LAAS_REPO}

hpp-doc_branch=euroc
hpp-doc_repository=${HPP_REPO}

hpp-manipulation_branch=euroc
hpp-manipulation_repository=${HPP_REPO}

hpp-manipulation-urdf_branch=euroc
hpp-manipulation-urdf_repository=${HPP_REPO}

hpp-manipulation-corba_branch=euroc
hpp-manipulation-corba_repository=${HPP_REPO}

robot_state_chain_publisher_branch=euroc
robot_state_chain_publisher_repository=${HPP_REPO}

iai_maps_branch=euroc
iai_maps_repository=${HPP_REPO}

hpp_tutorial_branch=euroc
hpp_tutorial_repository=${HPP_REPO}

hpp_benchmark_branch=master
hpp_benchmark_repository=${HPP_REPO}

collada-dom_branch=euroc
collada-dom_repository=${HPP_REPO}

gepetto-viewer_branch=euroc
gepetto-viewer_repository=${HPP_REPO}

gepetto-viewer-corba_branch=euroc
gepetto-viewer-corba_repository=${HPP_REPO}

hpp-gepetto-viewer_branch=euroc
hpp-gepetto-viewer_repository=${HPP_REPO}

hpp-plot_branch=euroc
hpp-plot_repository=${HPP_REPO}

qgv_branch=euroc
qgv_repository=${HPP_REPO}

hpp-dlr-miiwa_branch=euroc
hpp-dlr-miiwa_repository=${HPP_REPO}

doxygen-Release_1_8_10_extra_flags= -DCMAKE_BUILD_TYPE=Release

dlr-miiwa-version=0_1_0
dlr_miiwa_urdf_model_branch=devel
dlr_miiwa_urdf_model_repository=${TRAC_REPO}

OpenSceneGraph-3.4.0_extra_flags= -DCOLLADA_DYNAMIC_LIBRARY=${DEVEL_DIR}/install/lib/libcollada14dom.so -DCOLLADA_INCLUDE_DIR=${DEVEL_DIR}/install/include/collada-dom -DLIB_POSTFIX=""

hpp-plot_extra_flags= -DQGV_INCLUDE_DIR=${DEVEL_DIR}/install/include/qgv

all: hpp_tutorial.install hpp-manipulation-corba.install \
	hpp-dlr-miiwa.install hpp-gepetto-viewer.install \
	hpp-plot.install
	${MAKE} hpp-doc.install

hpp-fcl.configure.dep: doxygen-Release_1_8_10.install hpp-fcl.checkout
eigen3.configure.dep: eigen3.checkout
doxygen-Release_1_8_10.configure.dep: doxygen-Release_1_8_10.checkout
roboptim-core-3.1.configure.dep: eigen3.install roboptim-core-3.1.checkout
roboptim-trajectory-3.1.configure.dep: roboptim-core-3.1.install \
	roboptim-trajectory-3.1.checkout
hpp-walkgen.configure.dep: hpp-util.install hpp-core.install \
	roboptim-trajectory-3.1.install hpp-walkgen.checkout
hpp-util.configure.dep: doxygen-Release_1_8_10.install hpp-util.checkout
hpp-model.configure.dep: hpp-util.install hpp-fcl.install \
	eigen3.install hpp-model.checkout
hpp-model-urdf.configure.dep: hpp-model.install hpp-model-urdf.checkout
hpp-statistics.configure.dep: doxygen-Release_1_8_10.install hpp-statistics.checkout
hpp-core.configure.dep: hpp-constraints.install hpp-statistics.install \
	hpp-core.checkout
qpOASES.configure.dep: qpOASES.checkout
hpp-constraints.configure.dep: qpOASES.install hpp-model.install hpp-constraints.checkout
hpp-wholebody-step.configure.dep: hpp-constraints.install hpp-walkgen.install \
	hpp-wholebody-step.checkout
hpp-manipulation.configure.dep: hpp-core.install hpp-constraints.install \
	hpp-manipulation.checkout
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
robot_state_chain_publisher.configure.dep: robot_state_chain_publisher.checkout
iai_maps.configure.dep: robot_state_chain_publisher.install iai_maps.checkout
hpp_tutorial.configure.dep: hpp-gepetto-viewer.install iai_maps.install \
	hpp-manipulation-corba.install dlr-miiwa-model.install \
	hpp_tutorial.checkout
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
hpp-plot.configure.dep: hpp-manipulation-corba.install qgv.install \
	hpp-plot.checkout
qgv.configure.dep: qgv.checkout
dlr-miiwa-model.configure.dep: dlr-miiwa-model.checkout
hpp-dlr-miiwa.configure.dep: dlr-miiwa-model.install hpp-dlr-miiwa.checkout

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
	mkdir -p build; \
	cd ${SRC_DIR}/$(@:.configure=)/build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-g -O3 -DNDEBUG" ${$(@:.configure=)_extra_flags} ..

%.install:%.configure
	cd ${SRC_DIR}/$(@:.install=)/build;\
	make install

%.uninstall:
	cd ${SRC_DIR}/$(@:.uninstall=)/build;\
	make uninstall

%.clean:
	cd ${SRC_DIR}/$(@:.clean=)/build;\
	make clean

%.very-clean:
	rm -rf ${SRC_DIR}/$(@:.very-clean=)/build/*

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
	mkdir -p build; \
	cd ${SRC_DIR}/$(@:.configure=)/build; \
	../configure --prefix=${DEVEL_DIR}/install

eigen3.checkout:
	if [ -d $(@:.checkout=) ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
		wget -O - "http://bitbucket.org/eigen/eigen/get/3.2.4.tar.bz2" | tar -xj; \
		mv eigen-eigen-10219c95fe65 eigen3;\
	fi

eigen3.configure: eigen3.configure.dep
	cd ${SRC_DIR}/eigen3;\
	mkdir -p build; \
	cd ${SRC_DIR}/eigen3/build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_INSTALL_LIBDIR=lib -Dpkg_config_libdir=${DEVEL_DIR}/install/lib ..

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

OpenSceneGraph-3.4.0.checkout:
	if [ -d $(@:.checkout=) ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
		wget http://www.openscenegraph.org/downloads/stable_releases/OpenSceneGraph-3.4.0/source/OpenSceneGraph-3.4.0.zip;\
		cd ${SRC_DIR}; unzip OpenSceneGraph-3.4.0.zip;\
		rm -f OpenSceneGraph-3.4.0.zip;\
	fi

dlr-miiwa-model.checkout:
	if [ -d euroc_c2 ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
		svn checkout --username=${SVN_USERNAME} \
		--password=${SVN_PASSWORD} ${DLR_REPO}; \
	fi

dlr-miiwa-model.configure: dlr-miiwa-model.checkout
	. ${DEVEL_DIR}/install/setup.sh; \
	echo "configuring for miiwa"
	cd ${SRC_DIR}/euroc_c2/models/miiwa; \
	mkdir -p build; \
	cd ${SRC_DIR}/euroc_c2/models/miiwa/build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_BUILD_TYPE=${BUILD_TYPE} .. ; \
	echo "configuring for schunk_adapter"
	cd ${SRC_DIR}/euroc_c2/models/schunk_adapter; \
	mkdir -p build; \
	cd ${SRC_DIR}/euroc_c2/models/schunk_adapter/build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_BUILD_TYPE=${BUILD_TYPE} .. ; \
	echo "configuring for schunk_pw70"
	cd ${SRC_DIR}/euroc_c2/models/schunk_pw70; \
	mkdir -p build; \
	cd ${SRC_DIR}/euroc_c2/models/schunk_pw70/build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_BUILD_TYPE=${BUILD_TYPE} .. ; \
	echo "configuring for schunk_wsg50"
	cd ${SRC_DIR}/euroc_c2/models/schunk_wsg50; \
	mkdir -p build; \
	cd ${SRC_DIR}/euroc_c2/models/schunk_wsg50/build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_BUILD_TYPE=${BUILD_TYPE} .. ; \
	echo "configuring for dlr_miiwa"
	cd ${SRC_DIR}/euroc_c2/models/dlr_miiwa; \
	mkdir -p build; \
	cd ${SRC_DIR}/euroc_c2/models/dlr_miiwa/build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_BUILD_TYPE=${BUILD_TYPE} .. ; \
	echo "configuring for mako_3d"
	cd ${SRC_DIR}/euroc_c2/models/mako_3d; \
	mkdir -p build; \
	cd ${SRC_DIR}/euroc_c2/models/mako_3d/build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_BUILD_TYPE=${BUILD_TYPE} .. ; \
	echo "configuring for lbr_iiwa_launch"
	cd ${SRC_DIR}/euroc_c2/models/lbr_iiwa/lbr_iiwa_launch; \
	mkdir -p build; \
	cd ${SRC_DIR}/euroc_c2/models/lbr_iiwa/lbr_iiwa_launch/build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_BUILD_TYPE=${BUILD_TYPE} .. ; \
	echo "configuring for lbr_iiwa_gazebo"
	cd ${SRC_DIR}/euroc_c2/models/lbr_iiwa/lbr_iiwa_gazebo; \
	mkdir -p build; \
	cd ${SRC_DIR}/euroc_c2/models/lbr_iiwa/lbr_iiwa_gazebo/build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_BUILD_TYPE=${BUILD_TYPE} .. ; \
	echo "configuring for lbr_iiwa_description"
	cd ${SRC_DIR}/euroc_c2/models/lbr_iiwa/lbr_iiwa_description; \
	mkdir -p build; \
	cd ${SRC_DIR}/euroc_c2/models/lbr_iiwa/lbr_iiwa_description/build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_BUILD_TYPE=${BUILD_TYPE} .. ; \
	echo "configuring for lbr_iiwa_control"
	cd ${SRC_DIR}/euroc_c2/models/lbr_iiwa/lbr_iiwa_control; \
	mkdir -p build; \
	cd ${SRC_DIR}/euroc_c2/models/lbr_iiwa/lbr_iiwa_control/build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_BUILD_TYPE=${BUILD_TYPE} .. ;
	echo "configuring for manta"
	cd ${SRC_DIR}/euroc_c2/models/manta; \
	mkdir -p build; \
	cd ${SRC_DIR}/euroc_c2/models/manta/build; \
	cmake -DCMAKE_INSTALL_PREFIX=${DEVEL_DIR}/install -DCMAKE_BUILD_TYPE=${BUILD_TYPE} .. ;

dlr-miiwa-model.install: dlr-miiwa-model.configure
	echo "making for miiwa"; \
	cd ${SRC_DIR}/euroc_c2/models/miiwa/build; \
	${MAKE} install; \
	echo "making for schunk_adapter" ; \
	cd ${SRC_DIR}/euroc_c2/models/schunk_adapter/build; \
	${MAKE} install; \
	echo "making for schunk_pw70" ; \
	cd ${SRC_DIR}/euroc_c2/models/schunk_pw70/build; \
	${MAKE} install; \
	echo "making for schunk_wsg50" ; \
	cd ${SRC_DIR}/euroc_c2/models/schunk_wsg50/build; \
	${MAKE} install; \
	echo "making for dlr_miiwa" ; \
	cd ${SRC_DIR}/euroc_c2/models/dlr_miiwa/build; \
	${MAKE} install; \
	echo "making for mako_3d" ; \
	cd ${SRC_DIR}/euroc_c2/models/mako_3d/build; \
	${MAKE} install; \
	echo "making for lbr_iiwa_launch" ; \
	cd ${SRC_DIR}/euroc_c2/models/lbr_iiwa/lbr_iiwa_launch/build; \
	${MAKE} install; \
	echo "making for lbr_iiwa_gazebo" ; \
	cd ${SRC_DIR}/euroc_c2/models/lbr_iiwa/lbr_iiwa_gazebo/build; \
	${MAKE} install; \
	echo "making for lbr_iiwa_description" ; \
	cd ${SRC_DIR}/euroc_c2/models/lbr_iiwa/lbr_iiwa_description/build; \
	${MAKE} install; \
	echo "making for lbr_iiwa_control" ; \
	cd ${SRC_DIR}/euroc_c2/models/lbr_iiwa/lbr_iiwa_control/build; \
	${MAKE} install;
	echo "making for manta" ; \
	cd ${SRC_DIR}/euroc_c2/models/manta/build; \
	${MAKE} install;
