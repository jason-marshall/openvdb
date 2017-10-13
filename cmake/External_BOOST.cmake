# An external project for boost
set(boost_prefix "${OPENVDB_TOP_LEVEL_DIR}/dependencies/src/boost")
set(boost_file "http://sourceforge.net/projects/boost/files/boost/1.61.0/boost_1_61_0.zip/download")
set(boost_md5 015ae4afa6f3e597232bfe1dab949ace)

if(WIN32 OR APPLE)
  message("Need to add boost for windows build.")
else()
  ExternalProject_Add(Boost
    # specify build location
    PREFIX ${boost_prefix}
    # download stuff
    URL ${boost_file}
    URL_MD5 ${boost_md5}
    # patch command fix
    PATCH_COMMAND ""
    # build in source
    BUILD_IN_SOURCE 1
    BUILD_COMMAND ""
    # configure command
    INSTALL_DIR ${OPENVDB_TOP_LEVEL_DIR}/dependencies
    CONFIGURE_COMMAND <SOURCE_DIR>/bootstrap.sh --prefix=<INSTALL_DIR> --with-libraries=all
    # install command
    INSTALL_COMMAND <SOURCE_DIR>/b2 install
    )
endif()
