cmake_minimum_required(VERSION 3.28)

project(Eqx_CMakeInterfaces
    VERSION 1.0.1
    DESCRIPTION "Common Flags As CMake Interface Targets"
    LANGUAGES CXX)

include(Interfaces/Interfaces.cmake)

if (CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
    add_subdirectory(ProvingGrounds)
endif()
