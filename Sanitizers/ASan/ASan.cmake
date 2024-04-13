cmake_minimum_required(VERSION 3.28)

add_library(EQX-ASan INTERFACE)

if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    target_compile_options(EQX-ASan INTERFACE /fsanitize=address)
else ()
    target_compile_options(EQX-ASan INTERFACE -fsanitize=address)
    target_link_options(EQX-ASan INTERFACE -fsanitize=address)
endif()
