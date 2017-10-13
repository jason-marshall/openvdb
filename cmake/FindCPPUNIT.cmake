# - Try to find CPPUNIT
# Once done, this will define
#
#  CPPUNIT_FOUND - system has CPPUNIT
#  CPPUNIT_INCLUDE_DIR - the CPPUNIT include directories
#  CPPUNIT_LIBRARIES - link these to use CPPUNIT
# questions: jason.p.marshall at gmail dot com
#

find_path(CPPUNIT_INCLUDE_DIR cppunit/Test.h)

find_library(CPPUNIT_LIBRARY NAMES libcppunit.so)

# handle the QUIETLY and REQUIRED arguments and set BLOSC_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(CPPUNIT DEFAULT_MSG CPPUNIT_LIBRARY CPPUNIT_INCLUDE_DIR)

if(CPPUNIT_FOUND)
  set(CPPUNIT_LIBRARIES ${CPPUNIT_LIBRARY})
endif()

mark_as_advanced(CPPUNIT_INCLUDE_DIR CPPUNIT_LIBRARY CPPUNIT_LIBRARIES)
