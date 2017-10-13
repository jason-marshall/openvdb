# - Try to find GLFW3
# Once done, this will define
#
#  GLFW3_FOUND - system has GLFW3
#  GLFW3_INCLUDE_DIRS - the GLFW3 include directories
#  GLFW3_LIBRARIES - link these to use GLFW3
# questions: jason.p.marshall at gmail dot com
#

find_path(GLFW3_INCLUDE_DIR GLFW)

find_library(GLFW3_LIBRARY NAMES glfw)

# handle the QUIETLY and REQUIRED arguments and set GLFW3_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GLFW3 DEFAULT_MSG GLFW3_LIBRARY GLFW3_INCLUDE_DIR)

if(GLFW3_FOUND)
  set(GLFW3_LIBRARIES ${GLFW3_LIBRARY})
endif()

mark_as_advanced(GLFW3_INCLUDE_DIR GLFW3_LIBRARY GLFW3_LIBRARIES)