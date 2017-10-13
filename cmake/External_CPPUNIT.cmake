set(cppunit_prefix "${OPENVDB_TOP_LEVEL_DIR}/dependencies/src/cppunit")
set(cppunit_file "http://dev-www.libreoffice.org/src/cppunit-1.14.0.tar.gz")

# switch between operating systems
if(WIN32 OR APPLE)

else()
  ExternalProject_Add(cppunit
    # specify build location
    PREFIX ${cppunit_prefix}
    # download stuff
    URL ${cppunit_file}
    PATCH_COMMAND ""
    UPDATE_COMMAND ""
    # install directory
    INSTALL_DIR ${OPENVDB_TOP_LEVEL_DIR}/dependencies
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=<INSTALL_DIR>
    )
endif()
