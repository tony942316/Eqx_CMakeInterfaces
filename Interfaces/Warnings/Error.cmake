cmake_minimum_required(VERSION 3.28)

add_library(Eqx_Warnings_Error INTERFACE)

if (Eqx_GNU OR Eqx_Clang)
    target_compile_options(Eqx_Warnings_Error INTERFACE
        -Werror)
elseif (Eqx_MSVC)
    target_compile_options(Eqx_Warnings_Error INTERFACE
        /WX)
else()
    message(FATAL_ERROR "Invalid Configuration")
endif()
