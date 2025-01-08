cmake_minimum_required(VERSION 3.28)

add_library(Eqx_ASan INTERFACE)

if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    target_compile_options(Eqx_ASan INTERFACE /fsanitize=address)
    target_link_options(Eqx_ASan INTERFACE /INCREMENTAL:NO)
else ()
    target_compile_options(Eqx_ASan INTERFACE -fsanitize=address)
    target_link_options(Eqx_ASan INTERFACE -fsanitize=address)
    if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
        target_link_options(Eqx_ASan INTERFACE -static-libasan)
    endif()
endif()
