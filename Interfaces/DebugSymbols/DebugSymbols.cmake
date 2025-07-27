cmake_minimum_required(VERSION 3.28)

add_library(Eqx_Debug_Symbols INTERFACE)

if (Eqx_GNU OR Eqx_Clang)
    target_compile_options(Eqx_Debug_Symbols INTERFACE
        -g3)
elseif (Eqx_MSVC)
    target_compile_options(Eqx_Debug_Symbols INTERFACE
        /Zi)
else()
    message(FATAL_ERROR "Invalid Configuration")
endif()
