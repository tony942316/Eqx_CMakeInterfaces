cmake_minimum_required(VERSION 3.28)

add_library(EQX-Warnings INTERFACE)

if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    target_compile_options(EQX-Warnings INTERFACE
        /W4)
else ()
    target_compile_options(EQX-Warnings INTERFACE
        -Wall -Wextra -Wpedantic -Wconversion)
endif()
