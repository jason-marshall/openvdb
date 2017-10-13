# Copyright (c) 2012-2016 DreamWorks Animation LLC
#
# All rights reserved. This software is distributed under the
# Mozilla Public License 2.0 ( http://www.mozilla.org/MPL/2.0/ )
#
# Redistributions of source code must retain the above copyright
# and license notice and the following restrictions and disclaimer.
#
# *     Neither the name of DreamWorks Animation nor the names of
# its contributors may be used to endorse or promote products derived
# from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# IN NO EVENT SHALL THE COPYRIGHT HOLDERS' AND CONTRIBUTORS' AGGREGATE
# LIABILITY FOR ALL CLAIMS REGARDLESS OF THEIR BASIS EXCEED US$250.00.
#

# yue.nicholas@gmail.com
CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

PROJECT ( OpenVDB )

ENABLE_TESTING()

OPTION ( OPENVDB_BUILD_UNITTESTS "Build the OpenVDB unit tests" ON )
OPTION ( OPENVDB_BUILD_DOCS "Build the OpenVDB documentation" ON )
OPTION ( OPENVDB_BUILD_PYTHON_MODULE "Build the pyopenvdb Python module" ON )
OPTION ( OPENVDB_BUILD_HOUDINI_SOPS "Build the Houdini SOPs" OFF )
OPTION ( OPENVDB_BUILD_MAYA_PLUGIN "Build the Maya plugin" OFF )
OPTION ( OPENVDB_BUILD_CORE "Build the OpenVDB core" ON )
OPTION ( OPENVDB_ENABLE_RPATH "Build with RPATH information" ON )
OPTION ( OPENVDB_ENABLE_3_ABI_COMPATIBLE "Build with OpenVDB v3 ABI" OFF )
OPTION ( OPENVDB_DISABLE_BOOST_IMPLICIT_LINKING "Disable the implicit linking of Boost libraries on Windows" ON )

IF (OPENVDB_BUILD_HOUDINI_SOPS)
  SET ( OPENVDB_BUILD_PYTHON_MODULE OFF )
ENDIF ()

IF ( APPLE )
  IF ( OPENVDB_BUILD_HOUDINI_SOPS AND OPENVDB_BUILD_MAYA_PLUGIN )
    MESSAGE ( FATAL_ERROR "On OSX, Houdini linked with libc++ whereas Maya is linked with libstdc++, the different runtimes are not mutually compatible, build them Houdini SOPs and Maya plugins separately with the requisite DCC's compiler" )
  ENDIF ()
ENDIF ()

LIST(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

SET ( OPENVDB_TOP_LEVEL_DIR ${PROJECT_SOURCE_DIR} CACHE PATH "OpenVDB Top Level Directory to share among sub projects" )

INCLUDE_DIRECTORIES ( ${OPENVDB_TOP_LEVEL_DIR} ) # To make sure we pick up headers from this version of OpenVDB we are building

IF ( OPENVDB_ENABLE_3_ABI_COMPATIBLE )
  ADD_DEFINITIONS ( -DOPENVDB_3_ABI_COMPATIBLE )
ENDIF ()

IF ( OPENVDB_BUILD_CORE )
  # include external projects
  include(ExternalProject)

  # initialize dependencies
  set(OPENVDB_CORE_DEPENDENCIES "")
  set(OPENEXR_DEPENDENCIES "")
  
  # build blosc?
  OPTION (USE_SYSTEM_BLOSC "Should we use the system BLOSC?" OFF) 
  if(USE_SYSTEM_BLOSC)
    find_package(BLOSC REQUIRED)
  else()
    include(External_BLOSC)
    list(APPEND OPENVDB_CORE_DEPENDENCIES blosc)
  endif()

  # build boost?
  option(USE_SYSTEM_BOOST "Should we use the system BOOST version > 1.57?" OFF)
  set(boost_version_min "1.52")
  if(USE_SYSTEM_BOOST)
    find_package(Boost ${boost_version_min} REQUIRED COMPONENTS iostreams system thread ${OPENVDB_BOOST_PYTHON_LIBRARY_COMPONENT_NAME})
  else()
    include(External_BOOST)
    list(APPEND OPENVDB_CORE_DEPENDENCIES Boost)
  endif()

  # build cppunit?
  if(OPENVDB_BUILD_UNITTESTS)
    option(USE_SYSTEM_CPPUNIT "Should we use the system cppunit?" OFF)
    if(USE_SYSTEM_CPPUNIT)
      find_package(CPPUnit REQUIRED)
    else()
      include(External_CPPUNIT)
      list(APPEND OPENVDB_CORE_DEPENDENCIES cppunit)
    endif()
  endif()

  # build doxygen?
  if(OPENVDB_BUILD_DOCS)
    option(USE_SYSTEM_DOXYGEN "Should we use the system doxygen?" OFF)
    if(USE_SYSTEM_DOXYGEN)
      find_package(Doxygen REQUIRED)
    else()
      include(External_DOXYGEN)
      list(APPEND OPENVDB_CORE_DEPENDENCIES doxygen)
    endif()
  endif()

  # build glfw3?
  option(USE_SYSTEM_GLFW3 "Should we use the system glfw3?" OFF)
  if(USE_SYSTEM_GLFW3)
    find_package(GLFW3 REQUIRED)
  else()
    include(External_GLFW3)
    list(APPEND OPENVDB_CORE_DEPENDENCIES glfw3)
  endif()

  # build ILMBase?
  option(USE_SYSTEM_ILMBASE "Should we use the system ILMBase?" OFF)
  if(USE_SYSTEM_ILMBASE)
    find_package(ILMBASE REQUIRED)
  else()
    include(External_ILMBASE)
    list(APPEND OPENVDB_CORE_DEPENDENCIES ilmbase)
    list(APPEND OPENEXR_DEPENDENCIES ilmbase)
  endif()

  # build OpenEXR?
  option(USE_SYSTEM_OPENEXR "Should we use the system OpenEXR?" OFF)
  if(USE_SYSTEM_OPENEXR)
    find_package(OPENEXR REQUIRED)
  else()
    include(External_OPENEXR)
    list(APPEND OPENVDB_CORE_DEPENDENCIES openexr)
  endif()

  # build TBB?
  option(USE_SYSTEM_TBB "Should we use the system TBB?" OFF)
  if(USE_SYSTEM_TBB)
    find_package(TBB REQUIRED)
  else()
    include(External_TBB)
    list(APPEND OPENVDB_CORE_DEPENDENCIES tbb)
  endif()

  # build ZLIB?
  option(USE_SYSTEM_ZLIB "Should we use the system ZLIB?" OFF)
  if(USE_SYSTEM_ZLIB)
    find_package(ZLIB REQUIRED)
  else()
    include(External_ZLIB)
    list(APPEND OPENVDB_CORE_DEPENDENCIES zlib)
  endif()

  # build openvdb core
  include(External_OPENVDB)
  
ENDIF ()
return()
IF (OPENVDB_BUILD_PYTHON_MODULE)
  ADD_SUBDIRECTORY ( openvdb/python )
ENDIF ()

IF ( OPENVDB_BUILD_HOUDINI_SOPS )
  ADD_SUBDIRECTORY ( openvdb_houdini )
ENDIF ()

IF ( OPENVDB_BUILD_MAYA_PLUGIN )
  ADD_SUBDIRECTORY ( openvdb_maya )
ENDIF ()
