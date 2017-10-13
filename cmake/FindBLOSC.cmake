# - Try to find BLOSC
# Once done, this will define
#
#  BLOSC_FOUND - system has BLOSC
#  BLOSC_INCLUDE_DIR - the BLOSC include directories
#  BLOSC_LIBRARIES - link these to use BLOSC
# questions: jason.p.marshall at gmail dot com
#

find_path(BLOSC_INCLUDE_DIR blosc.h)

find_library(BLOSC_LIBRARY NAMES blosc)

# handle the QUIETLY and REQUIRED arguments and set BLOSC_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(BLOSC DEFAULT_MSG BLOSC_LIBRARY BLOSC_INCLUDE_DIR)

if(BLOSC_FOUND)
  set(BLOSC_LIBRARIES ${BLOSC_LIBRARY})
endif()

mark_as_advanced(BLOSC_INCLUDE_DIR BLOSC_LIBRARY BLOSC_LIBRARIES)
