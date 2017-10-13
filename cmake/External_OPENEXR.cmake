# An external project for openexr
set(openexr_prefix "${OPENVDB_TOP_LEVEL_DIR}/dependencies/src/openexr")
set(openexr_md5 b64e931c82aa3790329c21418373db4e)
set(openexr_file "http://download.savannah.nongnu.org/releases/openexr/openexr-2.2.0.tar.gz")

if(USE_SYSTEM_ILMBASE)
  find_package(ILMBASE REQUIRED)
  set(ilmbase_loc "")
else()
  set(ilmbase_loc "--with-ilmbase-prefix=${OPENVDB_TOP_LEVEL_DIR}/dependencies")
endif()

# switch between operating systems
if(WIN32 OR APPLE)

else()
  ExternalProject_Add(openexr
    DEPENDS ${OPENEXR_DEPENDENCIES}
    # specify build location
    PREFIX ${openexr_prefix}
    # downlad stuff
    URL ${openexr_file}
    URL_MD5 ${openexr_md5}
    # install directory
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --disable-ilmbasetest --prefix=${OPENVDB_TOP_LEVEL_DIR}/dependencies ${ilmbase_loc})
endif()
