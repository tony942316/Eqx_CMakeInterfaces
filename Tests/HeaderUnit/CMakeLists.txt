# CMakeLists.txt

cmake_minimum_required(VERSION 3.28)

include(FetchContent)

FetchContent_Declare(googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG v1.14.0)

set(INSTALL_GTEST OFF CACHE BOOL "" FORCE)

FetchContent_MakeAvailable(googletest)

target_compile_definitions(gtest_main PRIVATE
    _DISABLE_STRING_ANNOTATION _DISABLE_VECTOR_ANNOTATION)
target_compile_definitions(gtest PRIVATE
    _DISABLE_STRING_ANNOTATION _DISABLE_VECTOR_ANNOTATION)

include(${CMAKE_CURRENT_SOURCE_DIR}/fs.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/gtest.cmake)
