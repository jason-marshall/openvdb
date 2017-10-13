# - Try to find OpenEXR
# Once done, this will define
#
#  OpenEXR_FOUND - system has OpenEXR
#  OpenEXR_INCLUDE_DIRS - the OpenEXR include directories
# questions: jason.p.marshall at gmail dot com
#

find_path(OpenEXR_INCLUDE_DIR OpenEXR)

# handle the QUIETLY and REQUIRED arguments and set OpenEXR_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(OpenEXR DEFAULT_MSG OpenEXR_INCLUDE_DIR)

mark_as_advanced(OpenEXR_INCLUDE_DIR)
