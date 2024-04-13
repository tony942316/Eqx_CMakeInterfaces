cmake_minimum_required(VERSION 3.28)

add_library(EQX-TSan INTERFACE)
target_compile_options(EQX-TSan INTERFACE -fsanitize=thread)
target_link_options(EQX-TSan INTERFACE -fsanitize=thread)
