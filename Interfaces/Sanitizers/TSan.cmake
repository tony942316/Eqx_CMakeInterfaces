cmake_minimum_required(VERSION 3.28)

if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    message("MSVC Does Not Support Thread Sanitizer!!!")
else ()
    add_library(Eqx_TSan INTERFACE)
    target_compile_options(Eqx_TSan INTERFACE -fsanitize=thread)
    target_link_options(Eqx_TSan INTERFACE -fsanitize=thread)
endif()

