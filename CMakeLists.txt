cmake_minimum_required(VERSION 3.28)

project(Eqx_CMakeInterfaces
    VERSION 2.0.0.0
    DESCRIPTION "Common Flags As CMake Interface Targets"
    HOMEPAGE_URL "https://github.com/tony942316/Eqx_CMakeInterfaces"
    LANGUAGES CXX)

include(Interfaces/Interfaces.cmake)

if (CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
    enable_testing()
    add_subdirectory(Tests/)
endif()
