# An external project for glfw
set(doxygen_prefix "${OPENVDB_TOP_LEVEL_DIR}/dependencies/src/doxygen")
set(doxygen_file "https://github.com/doxygen/doxygen.git")

# switch between operating systems
if(WIN32 OR APPLE)

else()
  ExternalProject_Add(doxygen
    # specify build location
    PREFIX ${doxygen_prefix}
    # download stuff
    GIT_REPOSITORY ${doxygen_file}
    # install directory and shared library option
    INSTALL_DIR ${OPENVDB_TOP_LEVEL_DIR}/dependencies
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
    )
endif()
