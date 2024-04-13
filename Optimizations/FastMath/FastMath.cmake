cmake_minimum_required(VERSION 3.28)

add_library(EQX-FastMath INTERFACE)

if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    target_compile_options(EQX-FastMath INTERFACE
        /fp:fast)
else ()
    target_compile_options(EQX-FastMath INTERFACE
        -ffast-math)
endif()
