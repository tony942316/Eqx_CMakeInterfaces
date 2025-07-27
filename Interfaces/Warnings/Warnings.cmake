cmake_minimum_required(VERSION 3.28)

include("${CMAKE_CURRENT_LIST_DIR}/Basic.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/Additional.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/Error.cmake")

add_library(Eqx_Warnings INTERFACE)

if (Eqx_GNU OR Eqx_Clang)
    target_link_libraries(Eqx_Warnings INTERFACE
        Eqx_Warnings_Basic Eqx_Warnings_Additional)
elseif (Eqx_MSVC)
    target_link_libraries(Eqx_Warnings INTERFACE
        Eqx_Warnings_Basic)
else()
    message(FATAL_ERROR "Invalid Configuration")
endif()
