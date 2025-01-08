cmake_minimum_required(VERSION 3.28)

add_executable(Main)
target_sources(Main PRIVATE Main.cpp)
target_link_libraries(Main PRIVATE Eqx_Typical)

set_target_properties(Main PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)
