cmake_minimum_required(VERSION 3.28)

include("${CMAKE_CURRENT_LIST_DIR}/DebugSymbols.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/Optimizations/Optimizations.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/Sanitizers/Sanitizers.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/Warnings.cmake")

add_library(Eqx_Typical INTERFACE)
target_link_libraries(Eqx_Typical INTERFACE Eqx_Warnings)
if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    target_link_libraries(Eqx_Typical INTERFACE
        "$<$<CONFIG:Debug>:Eqx_DebugSymbols;Eqx_Sanitizers>"
        "$<$<CONFIG:Release>:Eqx_Optimizations>")
else ()
    target_link_libraries(Eqx_Typical INTERFACE
        Eqx_DebugSymbols Eqx_Sanitizers)
endif()
