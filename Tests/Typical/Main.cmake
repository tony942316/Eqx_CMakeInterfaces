# Main.cmake

add_executable(Test_Typical)
target_sources(Test_Typical PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../Simple.cpp)
target_compile_features(Test_Typical PRIVATE cxx_std_17)
target_link_libraries(Test_Typical PRIVATE
    Eqx_Typical)
set_target_properties(Test_Typical PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)

set(Main_Opts $<TARGET_PROPERTY:Test_Typical,COMPILE_OPTIONS>)
set(Main_Expected_Opts
    $<TARGET_PROPERTY:Eqx_Warnings,INTERFACE_COMPILE_OPTIONS>
    $<$<CONFIG:Debug>:$<TARGET_PROPERTY:Eqx_Debug_Symbols,INTERFACE_COMPILE_OPTIONS>;$<TARGET_PROPERTY:Eqx_Sanitizers,INTERFACE_COMPILE_OPTIONS>>
    $<$<CONFIG:Release>:$<TARGET_PROPERTY:Eqx_Optimizations,INTERFACE_COMPILE_OPTIONS>>
    $<$<CONFIG:RelWithDebInfo>:$<TARGET_PROPERTY:Eqx_Debug_Symbols,INTERFACE_COMPILE_OPTIONS>;$<TARGET_PROPERTY:Eqx_Optimizations,INTERFACE_COMPILE_OPTIONS>>)

file(GENERATE
    OUTPUT $<CONFIG>/Main_Opts.txt
    CONTENT "$<JOIN:$<FILTER:${Main_Opts},EXCLUDE,^$>,;>")

file(GENERATE
    OUTPUT $<CONFIG>/Main_Expected_Opts.txt
    CONTENT "$<JOIN:$<FILTER:${Main_Expected_Opts},EXCLUDE,^$>,;>")

add_test(NAME Main_Typical
    COMMAND ${CMAKE_COMMAND} -E compare_files
        $<CONFIG>/Main_Opts.txt $<CONFIG>/Main_Expected_Opts.txt)
