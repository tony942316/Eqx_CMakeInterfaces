cmake_minimum_required(VERSION 3.28)

add_library(Eqx_Warnings_Basic INTERFACE)

if (Eqx_GNU OR Eqx_Clang)
    target_compile_options(Eqx_Warnings_Basic INTERFACE
        -Wall -Wextra -Wpedantic -Wconversion)
elseif (Eqx_MSVC)
    message(FATAL_ERROR "TODO")
    target_compile_options(Eqx_Warnings_Basic INTERFACE
        /W4)
else()
    message(FATAL_ERROR "Invalid Configuration")
endif()
