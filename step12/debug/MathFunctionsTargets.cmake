# Generated by CMake

if("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" LESS 2.5)
   message(FATAL_ERROR "CMake >= 2.6.0 required")
endif()
cmake_policy(PUSH)
cmake_policy(VERSION 2.6...3.17)
#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

if(CMAKE_VERSION VERSION_LESS 3.0.0)
  message(FATAL_ERROR "This file relies on consumers using CMake 3.0.0 or greater.")
endif()

# Protect against multiple inclusion, which would fail when already imported targets are added once more.
set(_targetsDefined)
set(_targetsNotDefined)
set(_expectedTargets)
foreach(_expectedTarget MathFunctions tutorial_compiler_flags SqrtLibrary)
  list(APPEND _expectedTargets ${_expectedTarget})
  if(NOT TARGET ${_expectedTarget})
    list(APPEND _targetsNotDefined ${_expectedTarget})
  endif()
  if(TARGET ${_expectedTarget})
    list(APPEND _targetsDefined ${_expectedTarget})
  endif()
endforeach()
if("${_targetsDefined}" STREQUAL "${_expectedTargets}")
  unset(_targetsDefined)
  unset(_targetsNotDefined)
  unset(_expectedTargets)
  set(CMAKE_IMPORT_FILE_VERSION)
  cmake_policy(POP)
  return()
endif()
if(NOT "${_targetsDefined}" STREQUAL "")
  message(FATAL_ERROR "Some (but not all) targets in this export set were already defined.\nTargets Defined: ${_targetsDefined}\nTargets not yet defined: ${_targetsNotDefined}\n")
endif()
unset(_targetsDefined)
unset(_targetsNotDefined)
unset(_expectedTargets)


# Create imported target MathFunctions
add_library(MathFunctions SHARED IMPORTED)

set_target_properties(MathFunctions PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "/cppworkspace/testCMake/step12/MathFunctions"
  INTERFACE_LINK_LIBRARIES "tutorial_compiler_flags"
)

# Create imported target tutorial_compiler_flags
add_library(tutorial_compiler_flags INTERFACE IMPORTED)

set_target_properties(tutorial_compiler_flags PROPERTIES
  INTERFACE_COMPILE_FEATURES "cxx_std_11"
  INTERFACE_COMPILE_OPTIONS "\$<\$<COMPILE_LANG_AND_ID:CXX,ARMClang,AppleClang,Clang,GNU>:-Wall;-Wextra;-Wshadow;-Wformat=2;-Wunused>;\$<\$<COMPILE_LANG_AND_ID:CXX,MSVC>:-W3>"
)

# Create imported target SqrtLibrary
add_library(SqrtLibrary STATIC IMPORTED)

set_target_properties(SqrtLibrary PROPERTIES
  INTERFACE_LINK_LIBRARIES "tutorial_compiler_flags"
)

# Import target "MathFunctions" for configuration "Debug"
set_property(TARGET MathFunctions APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(MathFunctions PROPERTIES
  IMPORTED_LOCATION_DEBUG "/cppworkspace/testCMake/step12/debug/libMathFunctions.so"
  IMPORTED_SONAME_DEBUG "libMathFunctions.so"
  )

# Import target "SqrtLibrary" for configuration "Debug"
set_property(TARGET SqrtLibrary APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(SqrtLibrary PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "/cppworkspace/testCMake/step12/debug/libSqrtLibrary.a"
  )

# This file does not depend on other imported targets which have
# been exported from the same project but in a separate export set.

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
cmake_policy(POP)
