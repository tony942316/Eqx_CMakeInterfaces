cmake_minimum_required(VERSION 3.28)

add_executable(Main)
target_sources(Main PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/Main.cpp)
target_link_libraries(Main PRIVATE
    Eqx_Warnings Eqx_Warnings_Error Eqx_Optimizations Eqx_Sanitizers
    Eqx_Debug_Symbols)
target_compile_features(Main PRIVATE cxx_std_20)
set_target_properties(Main PROPERTIES
    CXX_EXTENSIONS Off
    CXX_STANDARD_REQUIRED On
    EXPORT_COMPILE_COMMANDS On)
