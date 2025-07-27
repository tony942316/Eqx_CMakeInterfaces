cmake_minimum_required(VERSION 3.28)

add_library(Eqx_Sanitizers_ASan INTERFACE)

if (Eqx_GNU OR Eqx_Clang)
    target_compile_options(Eqx_Sanitizers_ASan INTERFACE -fsanitize=address)
    target_link_options(Eqx_Sanitizers_ASan INTERFACE -fsanitize=address)
elseif (Eqx_MSVC)
    target_compile_options(Eqx_Sanitizers_ASan INTERFACE /fsanitize=address
        $<$<CONFIG:Release>:/wd5072> $<$<CONFIG:MinSizeRel>:/wd5072>)
    target_link_options(Eqx_Sanitizers_ASan INTERFACE /INCREMENTAL:NO
        $<$<CONFIG:Release>:/ignore:4302> $<$<CONFIG:MinSizeRel>:/ignore:4302>)
else ()
    message(FATAL_ERROR "Invalid Configuration!")
endif()
