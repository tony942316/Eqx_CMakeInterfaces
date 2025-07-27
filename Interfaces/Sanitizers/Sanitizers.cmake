cmake_minimum_required(VERSION 3.28)

include("${CMAKE_CURRENT_LIST_DIR}/ASan.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/LSan.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/TSan.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/UBSan.cmake")

add_library(Eqx_Sanitizers INTERFACE)

if (Eqx_GNU OR Eqx_Clang)
    target_link_libraries(Eqx_Sanitizers INTERFACE
        Eqx_Sanitizers_ASan Eqx_Sanitizers_LSan Eqx_Sanitizers_UBSan)
elseif (Eqx_MSVC)
    target_link_libraries(Eqx_Sanitizers INTERFACE
        Eqx_Sanitizers_ASan)
else()
    message(FATAL_ERROR "Invalid Configuration!")
endif()
