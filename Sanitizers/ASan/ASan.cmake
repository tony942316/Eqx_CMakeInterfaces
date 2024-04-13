cmake_minimum_required(VERSION 3.28)

add_library(EQX-ASan INTERFACE)
target_compile_options(EQX-ASan INTERFACE -fsanitize=address)
target_link_options(EQX-ASan INTERFACE -fsanitize=address)
