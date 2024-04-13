cmake_minimum_required(VERSION 3.28)

add_library(EQX-LSan INTERFACE)
target_compile_options(EQX-LSan INTERFACE -fsanitize=leak)
target_link_options(EQX-LSan INTERFACE -fsanitize=leak)
