cmake_minimum_required(VERSION 3.28)

add_library(Eqx_Optimizations_NoRTTI INTERFACE)

if (Eqx_GNU OR Eqx_Clang)
    target_compile_options(Eqx_Optimizations_NoRTTI INTERFACE
        -fno-rtti)
elseif (Eqx_MSVC)
    target_compile_options(Eqx_Optimizations_NoRTTI INTERFACE
        /GR-)
else()
    message(FATAL_ERROR "Invalid Configuration!")
endif()
