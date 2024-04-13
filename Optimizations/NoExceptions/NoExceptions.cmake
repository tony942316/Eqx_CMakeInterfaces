cmake_minimum_required(VERSION 3.28)

add_library(EQX-NoExceptions INTERFACE)

if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    target_compile_options(EQX-NoExceptions INTERFACE
        /EHcs)
else ()
    target_compile_options(EQX-NoExceptions INTERFACE
        -fno-exceptions)
endif()
