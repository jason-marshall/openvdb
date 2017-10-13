# An external project for blosc
set(blosc_prefix "${OPENVDB_TOP_LEVEL_DIR}/dependencies/src/blosc")
set(blosc_md5 487d0cb7635862a8435c67b9fe01abfa)
set(blosc_file "https://github.com/Blosc/c-blosc/archive/v1.5.2.tar.gz")
set(blosc_install "${OPENVDB_TOP_LEVEL_DIR}/dependencies")

# switch between operating systems
if(WIN32 OR APPLE)

else()
  ExternalProject_Add(blosc
    # specify location
    PREFIX ${blosc_prefix}
    # download
    URL ${blosc_file}
    URL_MD5 ${blosc_md5}
    # install location
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=${blosc_install}
    )
  
endif()
