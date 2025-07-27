cmake_minimum_required(VERSION 3.28)

add_library(Eqx_Optimizations_FastMath INTERFACE)

if (Eqx_GNU OR Eqx_Clang)
    target_compile_options(Eqx_Optimizations_FastMath INTERFACE
        -ffast-math)
elseif (Eqx_MSVC)
    target_compile_options(Eqx_Optimizations_FastMath INTERFACE
        /fp:fast)
else ()
    message(FATAL_ERROR "Invalid Configuration!")
endif()
