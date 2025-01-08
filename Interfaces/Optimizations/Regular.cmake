cmake_minimum_required(VERSION 3.28)

add_library(Eqx_Regular INTERFACE)

target_compile_definitions(Eqx_Regular INTERFACE NDEBUG)

if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    target_compile_options(Eqx_Regular INTERFACE
        /O2t)
else ()
    target_compile_options(Eqx_Regular INTERFACE
        -O3)
endif()
