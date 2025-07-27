cmake_minimum_required(VERSION 3.28)

include("${CMAKE_CURRENT_LIST_DIR}/Basic.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/Additional.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/Error.cmake")

add_library(Eqx_Warnings INTERFACE)
target_link_libraries(Eqx_Warnings INTERFACE
    Eqx_Warnings_Basic Eqx_Warnings_Additional)
