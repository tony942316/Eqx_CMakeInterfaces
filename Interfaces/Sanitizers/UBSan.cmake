cmake_minimum_required(VERSION 3.28)

if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    message("MSVC Does Not Support Undefined Behavior Sanitizer!!!")
else ()
    add_library(Eqx_UBSan INTERFACE)
    target_compile_options(Eqx_UBSan INTERFACE -fsanitize=undefined)
    target_link_options(Eqx_UBSan INTERFACE -fsanitize=undefined)
    if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
        target_link_options(Eqx_UBSan INTERFACE -static-libubsan)
    endif()
endif()

