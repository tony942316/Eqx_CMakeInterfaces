cmake_minimum_required(VERSION 3.28)

add_library(Eqx_Optimizations_Regular INTERFACE)

target_compile_definitions(Eqx_Optimizations_Regular INTERFACE NDEBUG)

if (Eqx_GNU OR Eqx_Clang)
    target_compile_options(Eqx_Optimizations_Regular INTERFACE
        -O3)
elseif (Eqx_MSVC)
    message(FATAL_ERROR "TODO")
    target_compile_options(Eqx_Optimizations_Regular INTERFACE
        /O2t)
else()
    message(FATAL_ERROR "Invalid Configuration!")
endif()
