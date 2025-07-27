cmake_minimum_required(VERSION 3.28)

add_library(Eqx_Sanitizers_LSan INTERFACE)

if (Eqx_GNU OR Eqx_Clang)
    target_compile_options(Eqx_Sanitizers_LSan INTERFACE -fsanitize=leak)
    target_link_options(Eqx_Sanitizers_LSan INTERFACE -fsanitize=leak)
elseif (Eqx_MSVC)
else ()
    message(FATAL_ERROR "Invalid Configuration!")
endif()
