cmake_minimum_required(VERSION 3.28)

include("${CMAKE_CURRENT_LIST_DIR}/Vars/Vars.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/DebugSymbols/DebugSymbols.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/Optimizations/Optimizations.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/Sanitizers/Sanitizers.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/Warnings/Warnings.cmake")

add_library(Eqx_Typical INTERFACE)
target_link_libraries(Eqx_Typical INTERFACE
    Eqx_Warnings
    $<$<CONFIG:Debug>:Eqx_Debug_Symbols;Eqx_Sanitizers>
    $<$<CONFIG:Release>:Eqx_Optimizations>
    $<$<CONFIG:RelWithDebInfo>:Eqx_Debug_Symbols;Eqx_Optimizations>)
