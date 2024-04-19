cmake_minimum_required(VERSION 3.28)

if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    message("MSVC Does Not Support Leak Sanitizer!!!")
endif()

add_library(EQX-LSan INTERFACE)
target_compile_options(EQX-LSan INTERFACE -fsanitize=leak)
target_link_options(EQX-LSan INTERFACE -fsanitize=leak)
