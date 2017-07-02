#
# Copyright (c) 2014 CNRS-LAAS
# Author: Florent Lamiraux
#

FCL_REPO=https://github.com/flexible-collision-library
JRL_REPO=https://github.com/jrl-umi3218
LAAS_REPO=https://github.com/laas
HPP_REPO=https://github.com/humanoid-path-planner
SOT_REPO=https://github.com/stack-of-tasks

SRC_DIR=${DEVEL_DIR}/src
INSTALL_DIR=${DEVEL_DIR}/install

BUILD_TYPE=Release
ifeq (${BUILD_TYPE},Debug)
  BUILD_FOLDER=build
else
  BUILD_FOLDER=build-rel
endif

hpp-fcl_branch=isae-2017
hpp-fcl_repository=${HPP_REPO}
hpp-fcl_extra_flags= -DCMAKE_BUILD_TYPE=Release

hpp-util_branch=isae-2017
hpp-util_repository=${HPP_REPO}

pinocchio_branch=isae-2017
pinocchio_repository=${SOT_REPO}
pinocchio_extra_flags= -DBUILD_PYTHON_INTERFACE=OFF

hpp-pinocchio_branch=isae-2017
hpp-pinocchio_repository=${HPP_REPO}

hpp-statistics_branch=isae-2017
hpp-statistics_repository=${HPP_REPO}

hpp-core_branch=isae-2017
hpp-core_repository=${HPP_REPO}

hpp-template-corba_branch=isae-2017
hpp-template-corba_repository=${LAAS_REPO}

hpp-corbaserver_branch=isae-2017
hpp-corbaserver_repository=${HPP_REPO}

qpOASES_branch=isae-2017
qpOASES_repository=${HPP_REPO}

hpp-constraints_branch=isae-2017
hpp-constraints_repository=${HPP_REPO}

hpp-doc_branch=isae-2017
hpp-doc_repository=${HPP_REPO}

hpp-manipulation_branch=isae-2017
hpp-manipulation_repository=${HPP_REPO}


hpp-manipulation-urdf_branch=isae-2017
hpp-manipulation-urdf_repository=${HPP_REPO}

hpp-manipulation-corba_branch=isae-2017
hpp-manipulation-corba_repository=${HPP_REPO}

urdfdom_headers_branch=isae-2017
urdfdom_headers_repository=${HPP_REPO}

urdfdom_branch=isae-2017
urdfdom_repository=${HPP_REPO}
urdfdom_extra_flags=-DCMAKE_INSTALL_LIBDIR=lib

resource_retriever_branch=isae-2017
resource_retriever_repository=${HPP_REPO}
resource_retriever_extra_flags=-DCMAKE_INSTALL_LIBDIR=lib

urdf_branch=isae-2017
urdf_repository=${HPP_REPO}
urdf_extra_flags=-DCMAKE_INSTALL_LIBDIR=lib

ros-compat_branch=isae-2017
ros-compat_repository=${HPP_REPO}
ros-compat_extra_flags=-DCMAKE_INSTALL_LIBDIR=lib

collada-dom_branch=isae-2017
collada-dom_repository=${HPP_REPO}

gepetto-viewer_branch=isae-2017
gepetto-viewer_repository=${HPP_REPO}

gepetto-viewer-corba_branch=isae-2017
gepetto-viewer-corba_repository=${HPP_REPO}

hpp-gepetto-viewer_branch=isae-2017
hpp-gepetto-viewer_repository=${HPP_REPO}

qgv_branch=isae-2017
qgv_repository=${HPP_REPO}

hpp-practicals_branch=isae-2017
hpp-practicals_repository=${HPP_REPO}

collada-dom_extra_flags=-DBUILD_SHARED_LIBS=YES -DOPT_COLLADA15=OFF
OpenSceneGraph-3.4.0_extra_flags= -DDESIRED_QT_VERSION=4 -DCOLLADA_DYNAMIC_LIBRARY=${DEVEL_DIR}/install/lib/libcollada14dom.so -DCOLLADA_INCLUDE_DIR=${DEVEL_DIR}/install/include/collada-dom -DLIB_POSTFIX=""
doxygen-Release_1_8_10_extra_flags= -DCMAKE_BUILD_TYPE=Release
qpOASES_extra_flags= -DCMAKE_BUILD_TYPE=Release
assimp-3.3.1_extra_flags= -DCMAKE_DEBUG_POSTFIX=""
hpp-manipulation_extra_flags= -DHPP_MANIPULATION_HAS_WHOLEBODY_STEP=FALSE
hpp-manipulation-corba_extra_flags= -DHPP_MANIPULATION_HAS_WHOLEBODY_STEP=FALSE

all: doxygen-Release_1_8_10.install hpp-practicals.install \
	hpp-gepetto-viewer.install
	${MAKE} hpp-doc.install

# source $DEVEL_DIR/install/setup.bash before installing hrp2.
hrp2: test-hpp.install

hpp-fcl.configure.dep: eigen3.install assimp-3.3.1.install hpp-fcl.checkout
eigen3.configure.dep: eigen3.checkout
doxygen-Release_1_8_10.configure.dep: doxygen-Release_1_8_10.checkout
hpp-util.configure.dep: hpp-util.checkout
pinocchio.configure.dep: eigen3.install hpp-fcl.install urdfdom.install \
	pinocchio.checkout
hpp-pinocchio.configure.dep: pinocchio.install hpp-util.install \
	resource_retriever.install hpp-pinocchio.checkout
hpp-statistics.configure.dep: hpp-statistics.checkout
hpp-core.configure.dep: hpp-constraints.install hpp-statistics.install \
	hpp-core.checkout
qpOASES.configure.dep: qpOASES.checkout
hpp-constraints.configure.dep: qpOASES.install \
	hpp-pinocchio.install hpp-constraints.checkout
urdfdom_headers.configure.dep: ros-compat.install urdfdom_headers.checkout
urdfdom.configure.dep:urdfdom_headers.install urdfdom.checkout
resource_retriever.configure.dep: urdfdom.install resource_retriever.checkout
urdf.configure.dep: urdfdom.install urdfdom_headers.install urdf.checkout
ros-compat.configure.dep: ros-compat.checkout
hpp-manipulation.configure.dep: hpp-core.install hpp-constraints.install \
	hpp-manipulation.checkout
hpp-manipulation-urdf.configure.dep:hpp-manipulation.install \
	hpp-manipulation-urdf.checkout
hpp-corbaserver.configure.dep: hpp-core.install \
	hpp-constraints.install omniORBpy-4.2.1.install \
	hpp-corbaserver.checkout
hpp-practicals.configure.dep: hpp-manipulation-corba.install \
	hpp-practicals.checkout
hpp-template-corba.configure.dep: hpp-util.install hpp-template-corba.checkout
hpp-manipulation-corba.configure.dep: hpp-manipulation-urdf.install \
	hpp-manipulation.install  hpp-corbaserver.install \
	hpp-template-corba.install hpp-manipulation-corba.checkout
collada-dom.configure.dep: collada-dom.checkout
OpenSceneGraph-3.4.0.configure.dep: collada-dom.install \
	OpenSceneGraph-3.4.0.checkout
gepetto-viewer.configure.dep: OpenSceneGraph-3.4.0.install  urdfdom.install\
	gepetto-viewer.checkout
gepetto-viewer-corba.configure.dep: gepetto-viewer.install \
	omniORBpy-4.2.1.install gepetto-viewer-corba.checkout
omniORBpy-4.2.1.configure.dep: omniORB-4.2.1.install omniORBpy-4.2.1.checkout
omniORB-4.2.1.configure.dep: omniORB-4.2.1.checkout
hpp-gepetto-viewer.configure.dep: gepetto-viewer-corba.install \
	hpp-corbaserver.install \
	hpp-gepetto-viewer.checkout
hpp-baxter.configure.dep: hpp-corbaserver.install hpp-baxter.checkout
assimp-3.3.1.configure.dep: assimp-3.3.1.checkout
qgv.configure.dep: qgv.checkout
hpp-plot.configure.dep: qgv.install hpp-plot.checkout
hpp-doc.configure.dep: hpp-doc.checkout

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
	for d in hpp-util hpp-pinocchio hpp-core hpp-template-corba hpp-corbaserver hpp-constraints hpp-doc ; do \
	echo "Updating $$d";\
	${MAKE} $$d.update; done

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

%.configure:%.configure.dep %.confthis
	: # Do nothing else

%.confthis:%.checkout
	if [ -d ${SRC_DIR}/$(@:.confthis=) ]; then \
		mkdir -p ${SRC_DIR}/$(@:.confthis=)/${BUILD_FOLDER}; \
		cd ${SRC_DIR}/$(@:.confthis=)/${BUILD_FOLDER}; \
		cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \ -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-g -O3 -DNDEBUG" ${$(@:.confthis=)_extra_flags} ..; \
	else \
		echo "Package $(@:.confthis=) is not checked out."; \
	fi

%.install:%.configure
	${MAKE} -C ${SRC_DIR}/$(@:.install=)/${BUILD_FOLDER}; \
	${MAKE} -C ${SRC_DIR}/$(@:.install=)/${BUILD_FOLDER} install

%.instthis:%.confthis
	${MAKE} -C ${SRC_DIR}/$(@:.instthis=)/${BUILD_FOLDER}; \
	${MAKE} -C ${SRC_DIR}/$(@:.instthis=)/${BUILD_FOLDER} install

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


hpp-doc.confthis: hpp-doc.checkout
	cd ${SRC_DIR}/$(@:.confthis=);\
	./bootstrap;\
	mkdir -p ${BUILD_FOLDER}; \
	cd ${SRC_DIR}/$(@:.confthis=)/${BUILD_FOLDER}; \
	../configure --prefix=${INSTALL_DIR}

eigen3.checkout:
	if [ -d $(@:.checkout=) ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
		wget -O - "http://bitbucket.org/eigen/eigen/get/3.2.4.tar.bz2" | tar -xj; \
		mv eigen-eigen-10219c95fe65 eigen3;\
	fi

eigen3.confthis: eigen3.checkout
	cd ${SRC_DIR}/eigen3;\
	mkdir -p ${BUILD_FOLDER}; \
	cd ${SRC_DIR}/eigen3/${BUILD_FOLDER}; \
	cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} -DCMAKE_INSTALL_LIBDIR=lib -Dpkg_config_libdir=${INSTALL_DIR}/lib ..

doxygen-Release_1_8_10.checkout:
	if [ -d $(@:.checkout=) ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
		wget -O - "https://github.com/doxygen/doxygen/archive/Release_1_8_10.tar.gz" | tar -xz;\
	fi

OpenSceneGraph-3.4.0.checkout:
	if [ -d $(@:.checkout=) ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
		wget http://www.openscenegraph.org/downloads/stable_releases/OpenSceneGraph-3.4.0/source/OpenSceneGraph-3.4.0.zip;\
		cd ${SRC_DIR}; unzip OpenSceneGraph-3.4.0.zip;\
		rm -f OpenSceneGraph-3.4.0.zip;\
	fi

omniORB-4.2.1.checkout:
	if [ -d $(@:.checkout=) ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
		wget http://downloads.sourceforge.net/sourceforge/omniorb/omniORB-4.2.1-2.tar.bz2;\
		cd ${SRC_DIR}; bunzip2 omniORB-4.2.1-2.tar.bz2;\
		cd ${SRC_DIR}; tar xf omniORB-4.2.1-2.tar;\
		rm -f omniORB-4.2.1-2.tar;\
		mkdir -p $(@:.checkout=)/include/omniORB4;\
		ln -s /usr/include/omniORB4/internal $(@:.checkout=)/include/omniORB4/internal;\
	fi

omniORB-4.2.1.confthis: omniORB-4.2.1.checkout
	cd ${SRC_DIR}/$(@:.confthis=);\
	if [ ! -d ${INSTALL_DIR}/lib64 ]; then \
		ln -s ${INSTALL_DIR}/lib ${INSTALL_DIR}/lib64;\
	else \
		echo "directory ${INSTALL_DIR}/lib64 already exists"; \
	fi; \
	mkdir -p ${BUILD_FOLDER}; \
	mkdir -p ${BUILD_FOLDER}/src/services/mklib/stublib/static; \
	mkdir -p ${BUILD_FOLDER}/src/services/mklib/stublib/shared; \
	mkdir -p ${BUILD_FOLDER}/src/services/mklib/dynstublib/static; \
	mkdir -p ${BUILD_FOLDER}/src/services/mklib/dynstublib/shared; \
	cd ${SRC_DIR}/$(@:.confthis=)/${BUILD_FOLDER}; \
	../configure --prefix=${INSTALL_DIR}

omniORBpy-4.2.1.checkout:
	if [ -d $(@:.checkout=) ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
		wget http://downloads.sourceforge.net/sourceforge/omniorb/omniORBpy-4.2.1-2.tar.bz2;\
		cd ${SRC_DIR}; bunzip2 omniORBpy-4.2.1-2.tar.bz2;\
		cd ${SRC_DIR}; tar xf omniORBpy-4.2.1-2.tar;\
		rm -f omniORBpy-4.2.1-2.tar;\
	fi

omniORBpy-4.2.1.confthis: omniORBpy-4.2.1.checkout \
	omniORBpy-4.2.1.checkout
	cd ${SRC_DIR}/$(@:.confthis=);\
	mkdir -p ${BUILD_FOLDER}; \
	cd ${SRC_DIR}/$(@:.confthis=)/${BUILD_FOLDER}; \
	../configure --prefix=${INSTALL_DIR} --libdir=${INSTALL_DIR}/lib

assimp-3.3.1.checkout:
	if [ -d $(@:.checkout=) ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
		wget https://github.com/assimp/assimp/archive/v3.3.1.tar.gz; \
		cd ${SRC_DIR}; tar xzf v3.3.1.tar.gz; \
		rm -f v3.3.1.tar.gz; \
		mkdir -p ${SRC_DIR}/$(@:.checkout=)/${BUILD_FOLDER}; \
	fi

hpp-plot.checkout:
	if [ -d $(@:.checkout=) ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
		cd ${SRC_DIR}; tar xzf hpp-plot-0.1.0.tar.gz; \
		mv ${SRC_DIR}/hpp-plot-0.1.0 ${SRC_DIR}/hpp-plot; \
	fi

