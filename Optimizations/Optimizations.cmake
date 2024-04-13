cmake_minimum_required(VERSION 3.28)

include("${CMAKE_CURRENT_LIST_DIR}/FastMath/FastMath.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/NoExceptions/NoExceptions.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/NoRTTI/NoRTTI.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/Regular/Regular.cmake")

add_library(EQX-Optimizations INTERFACE)
target_link_libraries(EQX-Optimizations INTERFACE
    EQX-FastMath EQX-NoExceptions EQX-NoRTTI EQX-Regular)
