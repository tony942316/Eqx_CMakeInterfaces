cmake_minimum_required(VERSION 3.28)

if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    message("MSVC Does Not Support Leak Sanitizer!!!")
else ()
    add_library(Eqx_LSan INTERFACE)
    target_compile_options(Eqx_LSan INTERFACE -fsanitize=leak)
    target_link_options(Eqx_LSan INTERFACE -fsanitize=leak)
endif()
