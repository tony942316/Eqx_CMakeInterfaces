cmake_minimum_required(VERSION 3.28)

add_library(Eqx_Optimizations_NoExceptions INTERFACE)

if (Eqx_GNU OR Eqx_Clang)
    target_compile_options(Eqx_Optimizations_NoExceptions INTERFACE
        -fno-exceptions)
elseif (Eqx_MSVC)
    message(FATAL_ERROR "TODO")
    target_compile_options(Eqx_Optimizations_NoExceptions INTERFACE
        /EHcs)
else ()
    message(FATAL_ERROR "Invalid Configuration!")
endif()
