cmake_minimum_required(VERSION 3.28)

add_library(EQX-NoRTTI INTERFACE)

if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    target_compile_options(EQX-NoRTTI INTERFACE
        /GR-)
else ()
    target_compile_options(EQX-NoRTTI INTERFACE
        -fno-rtti)
endif()
