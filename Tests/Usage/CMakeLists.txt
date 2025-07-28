cmake_minimum_required(VERSION 3.28)

add_executable(Main)
target_sources(Main PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/Main.cpp)
target_compile_features(Main PRIVATE cxx_std_20)
target_link_libraries(Main PRIVATE
    Eqx_Warnings Eqx_Warnings_Error Eqx_Optimizations Eqx_Sanitizers
    Eqx_Debug_Symbols)
set_target_properties(Main PROPERTIES
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

if (Eqx_MSVC)
    add_custom_command(TARGET Main POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
            ${CMAKE_SOURCE_DIR}/clang_rt.asan_dynamic-x86_64.dll
            $<TARGET_FILE_DIR:Main>)

    add_custom_command(TARGET Typical POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
            ${CMAKE_SOURCE_DIR}/clang_rt.asan_dynamic-x86_64.dll
            $<TARGET_FILE_DIR:Typical>)
elseif (Eqx_Clang OR Eqx_GNU)

else()
    message(FATAL_ERROR "Invalid Configuration!")
endif()

add_test(NAME Main_Usage
    COMMAND $<TARGET_FILE:Main>)
add_test(NAME Typical_Usage
    COMMAND $<TARGET_FILE:Typical>)
