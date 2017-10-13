# - Try to find TBB
# Once done, this will define
#
#  TBB_FOUND - system has TBB
#  TBB_INCLUDE_DIRS - the TBB include directories
#  TBB_LIBRARIES - link these to use TBB
# questions: jason.p.marshall at gmail dot com
#

find_path(TBB_INCLUDE_DIR tbb)

find_library(TBB_LIBRARY NAMES tbb)
find_library(TBBMALLOC_LIBRARY NAMES tbbmalloc)
find_library(TBBMALLOCPROXY_LIBRARY NAMES tbbmalloc_proxy)

# handle the QUIETLY and REQUIRED arguments and set TBB_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(TBB DEFAULT_MSG TBB_LIBRARY TBBMALLOC_LIBRARY TBBMALLOCPROXY_LIBRARY TBB_INCLUDE_DIR)

if(TBB_FOUND)
  set(TBB_LIBRARIES ${TBB_LIBRARY} ${TBBMALLOC_LIBRARY} ${TBBMALLOCPROXY_LIBRARY})
endif()

mark_as_advanced(TBB_INCLUDE_DIR TBB_LIBRARY TBB_LIBRARIES)
