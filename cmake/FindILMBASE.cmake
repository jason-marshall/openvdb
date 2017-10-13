# - Try to find ILMBase
# Once done, this will define
#
#  ILMBase_FOUND - system has ILMBase
#  ILMBase_INCLUDE_DIRS - the ILMBase include directories
#  ILMBase_LIBRARIES - link these to use ILMBase
# questions: jason.p.marshall at gmail dot com
#

find_path(ILMBase_INCLUDE_DIR OpenEXR)

find_library(ILMBaseHalf_LIBRARY NAMES Half)
find_library(ILMBaseIex_LIBRARY NAMES Iex)
find_library(ILMBaseIexMath_LIBRARY NAMES IexMath)
find_library(ILMBaseIlmImf_LIBRARY NAMES IlmImf)
find_library(ILMBaseIlmThread_LIBRARY NAMES IlmThread)
find_library(ILMBaseImath_LIBRARY NAMES Imath)

# handle the QUIETLY and REQUIRED arguments and set ILMBase_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(ILMBase DEFAULT_MSG ILMBaseHalf_LIBRARY ILMBaseIex_LIBRARY ILMBaseIexMath_LIBRARY ILMBaseIlmImf_LIBRARY ILMBaseIlmThread_LIBRARY ILMBaseImath_LIBRARY ILMBase_INCLUDE_DIR)

if(ILMBase_FOUND)
  set(ILMBase_LIBRARIES ${ILMBaseHalf_LIBRARY} ${ILMBaseIex_LIBRARY} ${ILMBaseIexMath_LIBRARY} ${ILMBaseIlmImf_LIBRARY} ${ILMBaseIlmThread_LIBRARY} ${ILMBaseImath_LIBRARY})
endif()

mark_as_advanced(ILMBase_INCLUDE_DIR ILMBaseHalf_LIBRARY ILMBaseIex_LIBRARY ILMBaseIexMath_LIBRARY ILMBaseIlmImf_LIBRARY ILMBaseIlmThread_LIBRARY ILMBaseImath_LIBRARY ILMBase_LIBRARIES)
