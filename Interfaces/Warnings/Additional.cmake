cmake_minimum_required(VERSION 3.28)

add_library(Eqx_Warnings_Additional INTERFACE)

if (Eqx_GNU OR Eqx_Clang)
    target_compile_options(Eqx_Warnings_Additional INTERFACE
        -Wfloat-equal -Wshadow -Wswitch-enum -Wcast-qual -Wundef -Wunused-macros
        -Wnon-virtual-dtor -Woverloaded-virtual -Wold-style-cast
        -Wdouble-promotion -Wformat=2 -Wformat-overflow -Wformat-truncation)
    if (Eqx_GNU)
        target_compile_options(Eqx_Warnings_Additional INTERFACE
            -Wduplicated-cond -Wduplicated-branches)
    elseif (Eqx_Clang)
        target_compile_options(Eqx_Warnings_Additional INTERFACE
            -Wbad-function-cast)
    endif()
elseif (Eqx_MSVC)
    message(FATAL_ERROR "TODO")
else()
    message(FATAL_ERROR "Invalid Configuration")
endif()
