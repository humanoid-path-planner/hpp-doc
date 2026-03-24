#
# Copyright (c) 2014 CNRS-LAAS
# Author: Florent Lamiraux
#

COAL_REPO=https://github.com/coal-library
LAAS_REPO=https://github.com/laas
HPP_REPO=https://github.com/humanoid-path-planner
SOT_REPO=https://github.com/stack-of-tasks
GEPETTO_REPO=https://github.com/Gepetto
LOCO3D_REPO=https://github.com/loco-3d
SIMPLE_ROBOTICS_REPO=https://github.com/Simple-Robotics
JRL_REPO=https://github.com/jrl-umi3218

SRC_DIR=${DEVEL_HPP_DIR}/src
ifndef INSTALL_HPP_DIR
INSTALL_HPP_DIR=${DEVEL_HPP_DIR}/install
endif

BUILD_TYPE?=Release
BUILD_TESTING?=ON
ifeq (${BUILD_TYPE},Debug)
  BUILD_FOLDER=build
else
  BUILD_FOLDER=build-rel
  BUILD_TESTING=OFF
endif

WGET=wget --quiet
UNZIP=unzip -qq
TAR=tar
GIT_QUIET=--quiet
# Qt version should be either 4 or 5
QT_VERSION=5
INSTALL_DOCUMENTATION=OFF
BUILD_JOBS=4

##################################
# {{{ Dependencies

jrl-cmakemodules_branch=master
jrl-cmakemodules_repository=${JRL_REPO}

coal_branch=devel
coal_repository=${COAL_REPO}
coal_extra_flags= -DCOAL_HAS_QHULL=ON -DCOAL_BACKWARD_COMPATIBILITY_WITH_HPP_FCL=ON -DINSTALL_DOCUMENTATION=OFF -DCOAL_DISABLE_HPP_FCL_WARNINGS=ON

eigenpy_branch=devel
eigenpy_repository=${SOT_REPO}

pinocchio_branch=devel
pinocchio_repository=${SOT_REPO}
pinocchio_extra_flags= -DBUILD_UNIT_TESTS=OFF -DBUILD_WITH_COLLISION_SUPPORT=ON -DINSTALL_DOCUMENTATION=OFF -DCOAL_DISABLE_HPP_FCL_WARNINGS=ON
pinocchio_jobs=2

# }}}
##################################
# {{{ Packages supporting HPP_VERSION

# Either a version tag (e.g. v4.3.0), stable or devel
HPP_VERSION=devel
HPP_EXTRA_FLAGS= -DBUILD_TESTING=${BUILD_TESTING} -DAUTO_UNINSTALL=OFF -DDOXYGEN_GENERATE_XML=YES

hpp-util_branch=${HPP_VERSION}
hpp-util_repository=${HPP_REPO}
hpp-util_extra_flags=${HPP_EXTRA_FLAGS}

hpp-statistics_branch=${HPP_VERSION}
hpp-statistics_repository=${HPP_REPO}
hpp-statistics_extra_flags=${HPP_EXTRA_FLAGS}

hpp-pinocchio_branch=${HPP_VERSION}
hpp-pinocchio_repository=${HPP_REPO}
hpp-pinocchio_extra_flags=${HPP_EXTRA_FLAGS}

hpp-constraints_branch=${HPP_VERSION}
hpp-constraints_repository=${HPP_REPO}
hpp-constraints_extra_flags=${HPP_EXTRA_FLAGS} -DUSE_QPOASES=OFF

hpp-core_branch=${HPP_VERSION}
hpp-core_repository=${HPP_REPO}
hpp-core_extra_flags=${HPP_EXTRA_FLAGS}

hpp-python_branch=${HPP_VERSION}
hpp-python_repository=${HPP_REPO}
hpp-python_extra_flags=${HPP_EXTRA_FLAGS} -DPYTHON_STANDARD_LAYOUT=ON

hpp-doc_branch=${HPP_VERSION}
hpp-doc_repository=${HPP_REPO}

hpp-manipulation_branch=${HPP_VERSION}
hpp-manipulation_repository=${HPP_REPO}
hpp-manipulation_extra_flags= ${HPP_EXTRA_FLAGS}

hpp-manipulation-urdf_branch=${HPP_VERSION}
hpp-manipulation-urdf_repository=${HPP_REPO}

hpp_tutorial_branch=${HPP_VERSION}
hpp_tutorial_repository=${HPP_REPO}
hpp_tutorial_extra_flags=${HPP_EXTRA_FLAGS} -DPYTHON_STANDARD_LAYOUT=ON

hpp-practicals_branch=${HPP_VERSION}
hpp-practicals_repository=${HPP_REPO}
hpp-practicals_extra_flags=${HPP_EXTRA_FLAGS} -DPYTHON_STANDARD_LAYOUT=ON

hpp-gepetto-viewer_branch=${HPP_VERSION}
hpp-gepetto-viewer_repository=${HPP_REPO}
hpp-gepetto-viewer_extra_flags= -DINSTALL_DOCUMENTATION=OFF -DUSE_HPP_PYTHON=ON \
	-DPYTHON_STANDARD_LAYOUT=ON

hpp-plot_branch=${HPP_VERSION}
hpp-plot_repository=${HPP_REPO}
hpp-plot_extra_flags= -DINSTALL_DOCUMENTATION=OFF

# }}}
##################################
# {{{ Robot specific package + test packages

proxsuite_branch = devel
proxsuite_repository=${SIMPLE_ROBOTICS_REPO}
proxsuite_extra_flags= -DBUILD_WITH_VECTORIZATION_SUPPORT=OFF -DBUILD_TESTING=OFF

example-robot-data_branch=devel
example-robot-data_repository=${GEPETTO_REPO}

hpp_benchmark_branch=devel
hpp_benchmark_repository=${HPP_REPO}

hpp-environments_branch=${HPP_VERSION}
hpp-environments_repository=${HPP_REPO}

hpp-baxter_branch=${HPP_VERSION}
hpp-baxter_repository=${HPP_REPO}

hpp_romeo_branch=${HPP_VERSION}
hpp_romeo_repository=${HPP_REPO}

# }}}
##################################
# {{{ Packages for gepetto-gui

hpp-tools_branch=${HPP_VERSION}
hpp-tools_repository=${HPP_REPO}
hpp-tools_extra_flags=

# }}}
##################################
# {{{ High-level targets

all: hpp_tutorial.install hpp-gepetto-viewer.install hpp-plot.install hpp-python.install
	${MAKE} hpp-doc.install

# For test on gepgitlab, install robot packages first
test-ci: example-robot-data.install  hpp-environments.install \
	hpp-baxter.install
	${MAKE} hpp_tutorial.install hpp-gepetto-viewer.install \
	${MAKE} hpp-doc.install

# For benchmark, install robot packages first
benchmark: example-robot-data.install hpp-environments.install
	${MAKE} hpp_tutorial.install hpp-gepetto-viewer.install; \
	${MAKE} hpp-baxter.install hpp_romeo.install hpp-plot.install; \
	${MAKE} hpp_benchmark.checkout; \
	${MAKE} hpp-doc.install

# }}}
##################################
# {{{ Dependencies declaration

hpp-doc.configure.dep: hpp-doc.checkout \
	jrl-cmakemodules.install
jrl-cmakemodules.configure.dep: jrl-cmakemodules.checkout
eigenpy.configure.dep: eigenpy.checkout \
	jrl-cmakemodules.install
coal.configure.dep: coal.checkout
coal.configure-py.dep: coal.install \
	eigenpy.install
hpp-util.configure.dep: hpp-util.checkout \
	jrl-cmakemodules.install
pinocchio.configure.dep: pinocchio.checkout \
	coal.install example-robot-data.install
pinocchio.configure-py.dep: pinocchio.install \
	eigenpy.install coal.install-py
hpp-pinocchio.configure.dep: hpp-pinocchio.checkout \
	hpp-util.install hpp-environments.install
hpp-statistics.configure.dep: hpp-statistics.checkout \
	hpp-util.install
hpp-core.configure.dep: hpp-core.checkout \
	hpp-constraints.install hpp-statistics.install
hpp-constraints.configure.dep: hpp-constraints.checkout \
	hpp-pinocchio.install hpp-statistics.install hpp-environments.install
hpp-manipulation.configure.dep: hpp-manipulation.checkout \
	hpp-core.install hpp-constraints.install
hpp-plot.configure.dep: hpp-plot.checkout hpp-manipulation.install
hpp-manipulation-urdf.configure.dep: hpp-manipulation-urdf.checkout \
	hpp-manipulation.install
hpp-python.configure.dep: hpp-python.checkout \
	hpp-manipulation.install hpp-manipulation-urdf.install
qgv.configure.dep: qgv.checkout \
	jrl-cmakemodules.install
hpp_tutorial.configure.dep: hpp_tutorial.checkout \
	hpp-gepetto-viewer.install hpp-python.install hpp-manipulation.install
hpp-practicals.configure.dep: hpp-practicals.checkout \
	jrl-cmakemodules.install
hpp_benchmark.configure.dep: hpp_benchmark.checkout \
	hpp_tutorial.install
hpp-gepetto-viewer.configure.dep: hpp-gepetto-viewer.checkout \
	hpp-python.install
proxsuite.configure.dep: proxsuite.checkout \
	jrl-cmakemodules.install
example-robot-data.configure.dep: example-robot-data.checkout \
	jrl-cmakemodules.install
example-robot-data.configure-py.dep: example-robot-data.install \
	pinocchio.install-py
hpp-environments.configure.dep: hpp-environments.checkout
hpp-baxter.configure.dep: hpp-baxter.checkout
hpp_romeo.configure.dep: hpp_romeo.checkout \
	jrl-cmakemodules.install
hpp-tools.configure.dep: hpp-tools.checkout \
	jrl-cmakemodules.install

# }}}
##################################
# {{{ Targets

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

fetch:
	@for child_dir in $$(ls ${SRC_DIR}); do \
		test -d "$$child_dir" || continue; \
		test -d "$$child_dir/.git" || continue; \
		${MAKE} "$$child_dir".fetch; \
	done

update:
	@for child_dir in $$(ls ${SRC_DIR}); do \
		test -d "$$child_dir" || continue; \
		test -d "$$child_dir/.git" || continue; \
		${MAKE} "$$child_dir".update; \
	done

test:
	@for child_dir in $$(ls ${SRC_DIR}); do \
		test -d "$$child_dir" || continue; \
		test -d "$$child_dir/.git" || continue; \
		${MAKE} "$$child_dir".test; \
	done

%.checkout:
	if [ -d $(@:.checkout=)/.git ]; then \
		echo "$(@:.checkout=) already checkout out."; \
	else \
		git clone ${GIT_QUIET} -b ${$(@:.checkout=)_branch} ${$(@:.checkout=)_repository}/$(@:.checkout=); \
	fi \

%.fetch:
	if [ "${$(@:.fetch=)_repository}" = "" ]; then \
		echo "$(@:.fetch=) is not referenced"; \
	else \
		cd ${SRC_DIR}/$(@:.fetch=);\
		git fetch ${GIT_QUIET} origin; \
		git fetch ${GIT_QUIET} origin --tags; \
	fi

%.update:
	if [ "${$(@:.update=)_repository}" = "" ]; then \
		echo "$(@:.update=) is not referenced"; \
	else \
		cd ${SRC_DIR}/$(@:.update=);\
		git remote rm origin;\
		git remote add origin ${$(@:.update=)_repository}/$(@:.update=);\
		git fetch origin;\
		git fetch origin --tags;\
		git checkout -q --detach;\
		git branch -f ${$(@:.update=)_branch} origin/${$(@:.update=)_branch};\
		git checkout -q ${$(@:.update=)_branch}; \
	fi


%.configure: %.configure.dep
	${MAKE} $(@:.configure=).configure_nodep

%.configure-py: %.configure-py.dep
	${MAKE} $(@:.configure-py=).configure_nodep-py

%.configure_nodep:%.checkout
	cmake \
		-DAUTO_UNINSTALL=OFF \
		-DBUILD_PYTHON_INTERFACE=OFF \
		-DCMAKE_INSTALL_PREFIX=${INSTALL_HPP_DIR} \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
		-DENFORCE_MINIMAL_CXX_STANDARD=ON \
		-DINSTALL_DOCUMENTATION=${INSTALL_DOCUMENTATION} \
		-DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-g -O3 -DNDEBUG" \
		${$(@:.configure_nodep=)_extra_flags} \
		-B ${SRC_DIR}/$(@:.configure_nodep=)/${BUILD_FOLDER} \
		-S ${SRC_DIR}/$(@:.configure_nodep=)

%.configure_nodep-py:%.checkout
	cmake \
		-DAUTO_UNINSTALL=OFF \
		-DBUILD_PYTHON_INTERFACE=ON \
		-DBUILD_STANDALONE_PYTHON_INTERFACE=ON \
		-DCMAKE_INSTALL_PREFIX=${INSTALL_HPP_DIR} \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
		-DENFORCE_MINIMAL_CXX_STANDARD=ON \
		-DINSTALL_DOCUMENTATION=${INSTALL_DOCUMENTATION} \
		-DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-g -O3 -DNDEBUG" \
		${$(@:.configure_nodep-py=)_extra_flags} \
		-B ${SRC_DIR}/$(@:.configure_nodep-py=)/${BUILD_FOLDER}-py \
		-S ${SRC_DIR}/$(@:.configure_nodep-py=)


%.build:%.configure
	cmake --build ${SRC_DIR}/$(@:.build=)/${BUILD_FOLDER} -j $(or $($(@:.build=)_jobs),${BUILD_JOBS})

%.build-py:%.configure-py
	cmake --build ${SRC_DIR}/$(@:.build-py=)/${BUILD_FOLDER}-py -j $(or $($(@:.build-py=)_jobs),${BUILD_JOBS})

%.test:%.build
	cmake --build ${SRC_DIR}/$(@:.test=)/${BUILD_FOLDER} -t test

%.test-py:%.build-py
	cmake --build ${SRC_DIR}/$(@:.test-py=)/${BUILD_FOLDER}-py -t test

%.install:%.build
	cmake --build ${SRC_DIR}/$(@:.install=)/${BUILD_FOLDER} -t install

%.install-py:%.build-py
	cmake --build ${SRC_DIR}/$(@:.install-py=)/${BUILD_FOLDER}-py -t install

%.install_nodep:%.configure_nodep
	cmake --build ${SRC_DIR}/$(@:.install_nodep=)/${BUILD_FOLDER} -t install

%.install_nodep-py:%.configure_nodep-py
	cmake --build ${SRC_DIR}/$(@:.install_nodep-py=)/${BUILD_FOLDER}-py -t install

%.uninstall:
	cmake --build ${SRC_DIR}/$(@:.uninstall=)/${BUILD_FOLDER} -t uninstall

%.uninstall-py:
	cmake --build ${SRC_DIR}/$(@:.uninstall-py=)/${BUILD_FOLDER}-py -t uninstall

%.clean:
	cmake --build ${SRC_DIR}/$(@:.clean=)/${BUILD_FOLDER} -t clean

%.clean-py:
	cmake --build ${SRC_DIR}/$(@:.clean-py=)/${BUILD_FOLDER}-py -t clean

%.very-clean:
	rm -rf ${SRC_DIR}/$(@:.very-clean=)/${BUILD_FOLDER}/*

%.very-clean-py:
	rm -rf ${SRC_DIR}/$(@:.very-clean-py=)/${BUILD_FOLDER}-py/*

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


# }}}

# vim: foldmethod=marker foldlevel=0
