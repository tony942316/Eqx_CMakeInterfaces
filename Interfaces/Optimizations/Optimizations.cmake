cmake_minimum_required(VERSION 3.28)

include("${CMAKE_CURRENT_LIST_DIR}/FastMath.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/NoExceptions.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/NoRTTI.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/Regular.cmake")

add_library(Eqx_Optimizations INTERFACE)
target_link_libraries(Eqx_Optimizations INTERFACE
    Eqx_Optimizations_FastMath Eqx_Optimizations_NoExceptions
    Eqx_Optimizations_NoRTTI Eqx_Optimizations_Regular)
