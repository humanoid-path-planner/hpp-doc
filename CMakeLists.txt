cmake_minimum_required(VERSION 2.8)

SET(INSTALL_DOCUMENTATION OFF)
include(cmake/base.cmake)

# These variables have to be defined before running setup_project
set(PROJECT_NAME hpp-doc)
set(PROJECT_DESCRIPTION "Documentation for HPP")
set(PROJECT_URL https://humanoid-path-planner.github.io/hpp-doc/index.html)

setup_project()

# Arguments are:
# - (required) package name
# - (optional) git url
# - (optional) robotpkg name
MACRO(ADD_PKG pkg)
  SET (OPT_ARGS ${ARGN})
  LIST(APPEND SETUP_DOC_PKG ${pkg})
  LIST(LENGTH OPT_ARGS N_OPT_ARGS)
  IF(${N_OPT_ARGS} GREATER 0)
    LIST(GET OPT_ARGS 0 ${pkg}_giturl)
  ENDIF(${N_OPT_ARGS} GREATER 0)
  IF(${N_OPT_ARGS} GREATER 1)
    LIST(GET OPT_ARGS 1 ${pkg}_robotpkg_package)
  ENDIF(${N_OPT_ARGS} GREATER 1)
ENDMACRO(ADD_PKG)

MACRO(ADD_HPP_PKG pkg)
  ADD_PKG(${pkg} git://github.com:humanoid-path-planner/${pkg})
ENDMACRO(ADD_HPP_PKG)

SET(SETUP_DOC_PKG)

ADD_HPP_PKG(hpp-fcl)
ADD_HPP_PKG(hpp-util)
ADD_HPP_PKG(pinocchio)
ADD_HPP_PKG(hpp-pinocchio)
ADD_HPP_PKG(hpp-core)
ADD_HPP_PKG(hpp-corbaserver)
ADD_HPP_PKG(hpp-constraints)
ADD_HPP_PKG(hpp-wholebody-step)
ADD_HPP_PKG(hpp-wholebody-step-corba)
ADD_HPP_PKG(hpp-manipulation)
ADD_HPP_PKG(hpp-manipulation-urdf)
ADD_HPP_PKG(hpp-manipulation-corba)
ADD_HPP_PKG(gepetto-viewer)
ADD_HPP_PKG(gepetto-viewer-corba)
ADD_HPP_PKG(hpp-gepetto-viewer)
ADD_HPP_PKG(hpp_tutorial)

FOREACH(PKG ${SETUP_DOC_PKG})
  ADD_OPTIONAL_DEPENDENCY(${PKG})

  STRING(REGEX REPLACE "[^a-zA-Z0-9]" "_" PREFIX "${PKG}")
  STRING(TOUPPER ${PREFIX} PREFIX)
  STRING(REGEX REPLACE "[^a-zA-Z0-9]" "" DOC_VAR "${PKG}")
  STRING(TOUPPER ${DOC_VAR} DOC_VAR)
  IF(${PREFIX}_FOUND)
    IF(DEFINED ${PREFIX}_DOXYGENDOCDIR)
      SET(DOC_PREFIX ${${PREFIX}_DOXYGENDOCDIR})
    ELSEIF(DEFINED ${PREFIX}_DOCDIR)
      SET(DOC_PREFIX ${${PREFIX}_DOCDIR})
    ELSE(DEFINED ${PREFIX}_DOCDIR)
      SET(DOC_PREFIX ${${PREFIX}_PREFIX}/share/doc/${PKG}/doxygen-html)
    ENDIF(DEFINED ${PREFIX}_DOXYGENDOCDIR)
    STRING(REPLACE ${CMAKE_INSTALL_PREFIX}/share/doc .. DOC_PREFIX "${DOC_PREFIX}")
    IF (EXISTS ${DOC_PREFIX}/main.html)
      SET(${DOC_VAR}_LINK ${DOC_PREFIX}/main.html)
    ELSE (EXISTS ${DOC_PREFIX}/main.html)
      SET(${DOC_VAR}_LINK ${DOC_PREFIX}/index.html)
    ENDIF (EXISTS ${DOC_PREFIX}/main.html)
  ELSE(${PREFIX}_FOUND)
    SET(${DOC_VAR}_LINK ${PKG}-missing.html)

    SET(PACKAGE_NAME ${PKG})
    SET(STEPS)
    IF(DEFINED ${PKG}_giturl)
      SET(STEPS "${STEPS} <li>
      to get the source code through <code>git</code>:
      <code>git clone ${${PKG}_giturl}</code>,
      then configure, compile and install the package.</code></li>")
    ENDIF(DEFINED ${PKG}_giturl)
    IF(DEFINED ${PKG}_robotpkg_package)
      SET(STEPS "${STEPS} <li>
      install it through <code>robotpkg</code>:
      <code>cd robotpkg/${${PKG}_robotpkg_package};
      make update</code></li>")
    ENDIF(DEFINED ${PKG}_robotpkg_package)
    CONFIGURE_FILE(doc/missing.html.in ${CMAKE_BINARY_DIR}/doc/${PKG}-missing.html @ONLY)

    INSTALL(FILES ${CMAKE_BINARY_DIR}/doc/${PKG}-missing.html
      DESTINATION ${CMAKE_INSTALL_DOCDIR})
  ENDIF(${PREFIX}_FOUND)
ENDFOREACH(PKG ${SETUP_DOC_PKG})

SET(EXTRA_HTML_FILES
  doc/corba.html
  doc/algorithm.html
  doc/gui.html
  doc/main.html
  doc/index.html
  doc/tree.html)
CONFIG_FILES(${EXTRA_HTML_FILES})
FOREACH(HTML_FILE ${EXTRA_HTML_FILES})
  INSTALL(FILES ${CMAKE_BINARY_DIR}/${HTML_FILE} DESTINATION ${CMAKE_INSTALL_DOCDIR})
ENDFOREACH(HTML_FILE ${EXTRA_HTML_FILES})

ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/graphDep.dot
  COMMAND ${CMAKE_SOURCE_DIR}/scripts/packageDep --quiet --output ${CMAKE_BINARY_DIR}/graphDep.dot ${SETUP_DOC_PKG}
  COMMAND sed -i 's/size = \"12,15\"//' ${CMAKE_BINARY_DIR}/graphDep.dot)
ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/dependencies.png
  COMMAND dot -o ${CMAKE_BINARY_DIR}/dependencies.png -Tpng ${CMAKE_BINARY_DIR}/graphDep.dot
  DEPENDS graphDep.dot)
ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/graphDep.html
  COMMAND dot -o ${CMAKE_BINARY_DIR}/graphDep.html -Tcmapx ${CMAKE_BINARY_DIR}/graphDep.dot
  DEPENDS graphDep.dot)
ADD_CUSTOM_COMMAND(OUTPUT graph-dependency.html
  COMMAND cat ${CMAKE_SOURCE_DIR}/doc/graph-dependency.html.head
  ${CMAKE_BINARY_DIR}/graphDep.html
  ${CMAKE_SOURCE_DIR}/doc/graph-dependency.html.foot
  > ${CMAKE_BINARY_DIR}/graph-dependency.html
  DEPENDS ${CMAKE_BINARY_DIR}/graphDep.html ${CMAKE_BINARY_DIR}/dependencies.png)
ADD_CUSTOM_TARGET(generate-html ALL
  DEPENDS graph-dependency.html)

INSTALL(FILES
  doc/custom.css
  doc/doxygen.css
  doc/tabs.css
  ${CMAKE_BINARY_DIR}/graph-dependency.html
  DESTINATION ${CMAKE_INSTALL_DOCDIR})
INSTALL(FILES
  ${CMAKE_BINARY_DIR}/dependencies.png
  DESTINATION ${CMAKE_INSTALL_DOCDIR}/images)
INSTALL(DIRECTORY
  doc/images
  doc/figures
  DESTINATION ${CMAKE_INSTALL_DOCDIR})

setup_project_finalize()
