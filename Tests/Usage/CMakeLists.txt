cmake_minimum_required(VERSION 3.28)

add_executable(Basic)
target_sources(Basic PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/Main.cpp)
target_compile_features(Basic PRIVATE cxx_std_20)
target_link_libraries(Basic PRIVATE
    Eqx_Warnings Eqx_Warnings_Error Eqx_Optimizations Eqx_Sanitizers
    Eqx_Debug_Symbols)
set_target_properties(Basic PROPERTIES
    CXX_EXTENSIONS Off
    CXX_STANDARD_REQUIRED On
    EXPORT_COMPILE_COMMANDS On)

add_executable(Typical)
target_sources(Typical PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/Main.cpp)
target_compile_features(Typical PRIVATE cxx_std_20)
target_link_libraries(Typical PRIVATE
    Eqx_Typical)
set_target_properties(Typical PROPERTIES
    CXX_EXTENSIONS Off
    CXX_STANDARD_REQUIRED On
    EXPORT_COMPILE_COMMANDS On)

add_test(NAME Smoke_Basic
    COMMAND $<TARGET_FILE:Basic>)
add_test(NAME Smoke_Typical
    COMMAND $<TARGET_FILE:Typical>)
