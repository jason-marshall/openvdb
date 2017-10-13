# An external project for tbb
set(tbb_prefix "${OPENVDB_TOP_LEVEL_DIR}/dependencies/src/tbb")
set(tbb_file "https://github.com/01org/tbb/archive/2018_U1.tar.gz")

# If Windows we use CMake, otherwise ./configure
if(WIN32)

elseif(APPLE)
  ExternalProject_Add(tbb
    # specify build location
    PREFIX ${tbb_prefix}
    # download stuff
    URL ${tbb_file}
    URL_MD5 ${tbb_md5}
    # configure stuff
    CONFIGURE_COMMAND ""
    # build stuff
    BUILD_IN_SOURCE 1
    BUILD_COMMAND make
    # install stuff
    INSTALL_COMMAND cp -r ${tbb_prefix}/src/tbb/include/tbb ${CMAKE_INSTALL_PREFIX}/include/. && cp -r ${tbb_prefix}/src/tbb/include/serial ${CMAKE_INSTALL_PREFIX}/include/. && sh -c "rm -f ${INSTALL_DIRECTORY}/lib/libtbb* && ln -s ${tbb_prefix}/src/tbb/build/*_release/libtbb.dylib ${INSTALL_DIRECTORY}/lib/libtbb.dylib && ln -s ${tbb_prefix}/src/tbb/build/*_release/libtbbmalloc.dylib ${INSTALL_DIRECTORY}/lib/libtbbmalloc.dylib  && ln -s ${tbb_prefix}/src/tbb/build/*_release/libtbbmalloc_proxy.dylib ${INSTALL_DIRECTORY}/lib/libtbbmalloc_proxy.dylib"
    )
else()
  ExternalProject_Add(tbb
    # specify build location
    PREFIX ${tbb_prefix}
    # download stuff
    URL ${tbb_file}
    # configure stuff
    CONFIGURE_COMMAND ""
    # build stuff
    BUILD_IN_SOURCE 1
    BUILD_COMMAND make
    # install stuff
    INSTALL_COMMAND cp -r ${tbb_prefix}/src/tbb/include/tbb ${OPENVDB_TOP_LEVEL_DIR}/dependencies/include/. && cp -r ${tbb_prefix}/src/tbb/include/serial ${OPENVDB_TOP_LEVEL_DIR}/dependencies/include/. && sh -c "rm -f ${OPENVDB_TOP_LEVEL_DIR}/dependencies/lib/libtbb* && ln -s ${tbb_prefix}/src/tbb/build/*_release/libtbb.so.2 ${OPENVDB_TOP_LEVEL_DIR}/dependencies/lib/libtbb.so.2 && ln -s ${OPENVDB_TOP_LEVEL_DIR}/dependencies/lib/libtbb.so.2 ${OPENVDB_TOP_LEVEL_DIR}/dependencies/lib/libtbb.so && ln -s ${tbb_prefix}/src/tbb/build/*_release/libtbbmalloc.so.2 ${OPENVDB_TOP_LEVEL_DIR}/dependencies/lib/libtbbmalloc.so.2 && ln -s ${OPENVDB_TOP_LEVEL_DIR}/dependencies/lib/libtbbmalloc.so.2 ${OPENVDB_TOP_LEVEL_DIR}/dependencies/lib/libtbbmalloc.so && ln -s ${tbb_prefix}/src/tbb/build/*_release/libtbbmalloc_proxy.so.2 ${OPENVDB_TOP_LEVEL_DIR}/dependencies/lib/libtbbmalloc_proxy.so.2 && ln -s ${OPENVDB_TOP_LEVEL_DIR}/dependencies/lib/libtbbmalloc_proxy.so.2 ${OPENVDB_TOP_LEVEL_DIR}/dependencies/lib/libtbbmalloc_proxy.so"
    )
endif()
