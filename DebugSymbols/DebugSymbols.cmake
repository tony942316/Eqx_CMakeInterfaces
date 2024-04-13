cmake_minimum_required(VERSION 3.28)

add_library(EQX-DebugSymbols INTERFACE)

if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    target_compile_options(EQX-DebugSymbols INTERFACE
        /Zi)
else ()
    target_compile_options(EQX-DebugSymbols INTERFACE
        -g3)
endif()
