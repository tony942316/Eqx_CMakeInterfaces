cmake_minimum_required(VERSION 3.28)

project(EQX-CMakeInterfaces
    VERSION 0.1.0
    DESCRIPTION "Common Flags As CMake Interface Targets"
    LANGUAGES CXX)

include(Interfaces.cmake)

add_executable(Main)
target_sources(Main PRIVATE Main.cpp)
target_link_libraries(Main PRIVATE EQX-Warnings)
if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    target_link_libraries(Main PRIVATE
        "$<$<CONFIG:Debug>:EQX-DebugSymbols;EQX-Sanitizers>"
        "$<$<CONFIG:Release>:EQX-Optimizations>")
else ()
    target_link_libraries(Main PRIVATE
        EQX-DebugSymbols EQX-Sanitizers)
endif()

set_target_properties(Main PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)
