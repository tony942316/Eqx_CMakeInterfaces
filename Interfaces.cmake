cmake_minimum_required(VERSION 3.28)

include("${CMAKE_CURRENT_LIST_DIR}/DebugSymbols/DebugSymbols.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/Optimizations/Optimizations.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/Sanitizers/Sanitizers.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/Warnings/Warnings.cmake")

add_library(EQX-Typical INTERFACE)
target_link_libraries(EQX-Typical INTERFACE EQX-Warnings)
if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    target_link_libraries(EQX-Typical INTERFACE
        "$<$<CONFIG:Debug>:EQX-DebugSymbols;EQX-Sanitizers>"
        "$<$<CONFIG:Release>:EQX-Optimizations>")
else ()
    target_link_libraries(EQX-Typical INTERFACE
        EQX-DebugSymbols EQX-Sanitizers)
endif()
