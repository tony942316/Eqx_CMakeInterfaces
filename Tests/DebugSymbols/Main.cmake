# Main.cmake

add_executable(Test_Debug_Symbols)
target_sources(Test_Debug_Symbols PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../Simple.cpp)
target_compile_features(Test_Debug_Symbols PRIVATE cxx_std_17)
target_link_libraries(Test_Debug_Symbols PRIVATE
    Eqx_Debug_Symbols)
set_target_properties(Test_Debug_Symbols PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)

set(Main_Opts $<TARGET_PROPERTY:Test_Debug_Symbols,COMPILE_OPTIONS>)
set(Main_Expected_Opts)

if (Eqx_GNU OR Eqx_Clang)
    list(APPEND Main_Expected_Opts -g3)
elseif (Eqx_MSVC)
    list(APPEND Main_Expected_Opts /Zi)
else()
    message(FATAL_ERROR "Failure!")
endif()

file(GENERATE
    OUTPUT $<CONFIG>/Main_Opts.txt
    CONTENT "${Main_Opts}")

file(GENERATE
    OUTPUT $<CONFIG>/Main_Expected_Opts.txt
    CONTENT "$<JOIN:$<FILTER:${Main_Expected_Opts},EXCLUDE,^$>,;>")

add_test(NAME Main_Debug_Symbols
    COMMAND ${CMAKE_COMMAND} -E compare_files
        $<CONFIG>/Main_Opts.txt $<CONFIG>/Main_Expected_Opts.txt)
