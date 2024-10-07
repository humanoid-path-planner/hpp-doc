cmake_minimum_required(VERSION 3.10)

# These variables have to be defined before running setup_project
set(PROJECT_NAME hpp-doc)
set(PROJECT_DESCRIPTION "Documentation for HPP")
set(PROJECT_URL https://humanoid-path-planner.github.io/hpp-doc/index.html)

# Check if the submodule cmake have been initialized
set(JRL_CMAKE_MODULES "${CMAKE_CURRENT_LIST_DIR}/cmake")
if(EXISTS "${JRL_CMAKE_MODULES}/base.cmake")
  message(STATUS "JRL cmakemodules found in 'cmake/' git submodule")
else()
  find_package(jrl-cmakemodules QUIET CONFIG)
  if(jrl-cmakemodules_FOUND)
    get_property(
      JRL_CMAKE_MODULES
      TARGET jrl-cmakemodules::jrl-cmakemodules
      PROPERTY INTERFACE_INCLUDE_DIRECTORIES)
    message(STATUS "JRL cmakemodules found on system at ${JRL_CMAKE_MODULES}")
  elseif(${CMAKE_VERSION} VERSION_LESS "3.14.0")
    message(
      FATAL_ERROR
        "\nCan't find jrl-cmakemodules. Please either:\n"
        "  - use git submodule: 'git submodule update --init'\n"
        "  - or install https://github.com/jrl-umi3218/jrl-cmakemodules\n"
        "  - or upgrade your CMake version to >= 3.14 to allow automatic fetching\n"
    )
  else()
    message(STATUS "JRL cmakemodules not found. Let's fetch it.")
    include(FetchContent)
    FetchContent_Declare(
      "jrl-cmakemodules"
      GIT_REPOSITORY "https://github.com/jrl-umi3218/jrl-cmakemodules.git")
    FetchContent_MakeAvailable("jrl-cmakemodules")
    FetchContent_GetProperties("jrl-cmakemodules" SOURCE_DIR JRL_CMAKE_MODULES)
  endif()
endif()

include("${JRL_CMAKE_MODULES}/hpp.cmake")

compute_project_args(PROJECT_ARGS LANGUAGES CXX)
project(${PROJECT_NAME} ${PROJECT_ARGS})

# Arguments are: - (required) package name - (optional) git url - (optional)
# robotpkg name
macro(ADD_PKG pkg)
  set(OPT_ARGS ${ARGN})
  list(APPEND SETUP_DOC_PKG ${pkg})
  list(LENGTH OPT_ARGS N_OPT_ARGS)
  if(${N_OPT_ARGS} GREATER 0)
    list(GET OPT_ARGS 0 ${pkg}_giturl)
  endif(${N_OPT_ARGS} GREATER 0)
  if(${N_OPT_ARGS} GREATER 1)
    list(GET OPT_ARGS 1 ${pkg}_robotpkg_package)
  endif(${N_OPT_ARGS} GREATER 1)
endmacro(ADD_PKG)

macro(ADD_HPP_PKG pkg)
  add_pkg(${pkg} git+https://github.com:humanoid-path-planner/${pkg})
endmacro(ADD_HPP_PKG)

set(SETUP_DOC_PKG)

add_hpp_pkg(hpp-fcl)
add_hpp_pkg(hpp-util)
add_hpp_pkg(hpp-statistics)
add_hpp_pkg(pinocchio)
add_hpp_pkg(hpp-pinocchio)
add_hpp_pkg(hpp-core)
add_hpp_pkg(hpp-corbaserver)
add_hpp_pkg(hpp-constraints)
add_hpp_pkg(hpp-manipulation)
add_hpp_pkg(hpp-manipulation-urdf)
add_hpp_pkg(hpp-manipulation-corba)
add_hpp_pkg(gepetto-viewer)
add_hpp_pkg(gepetto-viewer-corba)
add_hpp_pkg(hpp-gepetto-viewer)
add_hpp_pkg(hpp_tutorial)

foreach(PKG ${SETUP_DOC_PKG})
  add_project_dependency(${PKG})

  set(PREFIX "${PKG}")
  set(DOC_VAR "${PKG}")
  list(APPEND LOGGING_WATCHED_VARIABLES ${PREFIX}_FOUND)
  if(${PREFIX}_FOUND)
    if(DEFINED ${PREFIX}_DOXYGENDOCDIR)
      set(DOC_PREFIX ${${PREFIX}_DOXYGENDOCDIR})
    elseif(DEFINED ${PREFIX}_DOCDIR)
      set(DOC_PREFIX ${${PREFIX}_DOCDIR})
    else(DEFINED ${PREFIX}_DOCDIR)
      set(DOC_PREFIX ${${PREFIX}_PREFIX}/share/doc/${PKG}/doxygen-html)
    endif(DEFINED ${PREFIX}_DOXYGENDOCDIR)
    string(REPLACE ${CMAKE_INSTALL_PREFIX}/share/doc ../.. DOC_PREFIX
                   "${DOC_PREFIX}")
    if(EXISTS ${DOC_PREFIX}/main.html)
      set(${DOC_VAR}_URL ${DOC_PREFIX}/main.html)
    else(EXISTS ${DOC_PREFIX}/main.html)
      set(${DOC_VAR}_URL ${DOC_PREFIX}/index.html)
    endif(EXISTS ${DOC_PREFIX}/main.html)
    set(${DOC_VAR}_LINK "<a href='${${DOC_VAR}_URL}'>${PKG}</a>")
  else(${PREFIX}_FOUND)
    set(PACKAGE_NAME ${PKG})
    set(DOC_PKG_NAME "hpp_doc_missing_${DOC_VAR}")
    set(${DOC_VAR}_LINK "\\ref ${DOC_PKG_NAME}")
    set(${DOC_VAR}_URL ${${DOC_VAR}_LINK})
    set(STEPS)
    if(DEFINED ${PKG}_giturl)
      set(STEPS
          "${STEPS}\\li get the source code through \\c git:
\\code git clone --recursive ${${PKG}_giturl} \\endcode
Then configure, compile and install the package.\n")
    endif(DEFINED ${PKG}_giturl)
    if(DEFINED ${PKG}_robotpkg_package)
      set(STEPS
          "${STEPS}\\li install it through \\c robotpkg :
\\code
cd robotpkg/${${PKG}_robotpkg_package}
make update
\\endcode")
    endif(DEFINED ${PKG}_robotpkg_package)
    configure_file(doc/missing.dox.in
                   ${CMAKE_BINARY_DIR}/doc/${PKG}-missing.dox @ONLY)
  endif(${PREFIX}_FOUND)
  list(APPEND LOGGING_WATCHED_VARIABLES ${DOC_VAR}_URL ${DOC_VAR}_LINK)

endforeach(PKG ${SETUP_DOC_PKG})

config_files(doc/main.dox doc/doxygenLayout.xml)

add_custom_command(
  OUTPUT ${CMAKE_BINARY_DIR}/graphDep.dot
  COMMAND ${CMAKE_SOURCE_DIR}/scripts/packageDep --quiet --output
          ${CMAKE_BINARY_DIR}/graphDep.dot ${SETUP_DOC_PKG})
add_custom_target(generate-html ALL DEPENDS graphDep.dot)

install(FILES doc/index.html doc/jquery-3.3.1.min.js
              ${CMAKE_BINARY_DIR}/doc/main.dox
        DESTINATION ${CMAKE_INSTALL_DOCDIR})
install(DIRECTORY doc/figures DESTINATION ${CMAKE_INSTALL_DOCDIR})
if(NOT DEFINED INSTALL_DOCUMENTATION OR ${INSTALL_DOCUMENTATION})
  install(FILES ${CMAKE_CURRENT_BINARY_DIR}/doc/doxygen-xml/index.xml
          DESTINATION ${CMAKE_INSTALL_DOCDIR}/doxygen-html)
endif()
