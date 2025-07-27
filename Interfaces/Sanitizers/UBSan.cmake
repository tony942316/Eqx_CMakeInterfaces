cmake_minimum_required(VERSION 3.28)

add_library(Eqx_Sanitizers_UBSan INTERFACE)

if (Eqx_GNU OR Eqx_Clang)
    target_compile_options(Eqx_Sanitizers_UBSan INTERFACE -fsanitize=undefined)
    target_link_options(Eqx_Sanitizers_UBSan INTERFACE -fsanitize=undefined)
elseif (Eqx_MSVC)
    message(FATAL_ERROR "TODO")
else ()
    message(FATAL_ERROR "Invalid Configuration!")
endif()
