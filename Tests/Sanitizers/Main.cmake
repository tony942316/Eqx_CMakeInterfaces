# Main.cmake

add_executable(Test_Sanitizers)
target_sources(Test_Sanitizers PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../Simple.cpp)
target_link_libraries(Test_Sanitizers PRIVATE
    Eqx_Sanitizers)
set_target_properties(Test_Sanitizers PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)

set(Main_Opts
    $<TARGET_PROPERTY:Test_Sanitizers,COMPILE_OPTIONS>)
set(Main_Expected_Opts)

if (Eqx_GNU OR Eqx_Clang)
    list(APPEND Main_Expected_Opts
    -fsanitize=address -fsanitize=leak -fsanitize=undefined)
elseif (Eqx_MSVC)
    message(FATAL_ERROR "TODO")
else()
    message(FATAL_ERROR "FAILURE!")
endif()

file(GENERATE
    OUTPUT $<CONFIG>/Main_Opts.txt
    CONTENT "${Main_Opts}")

file(GENERATE
    OUTPUT $<CONFIG>/Main_Expected_Opts.txt
    CONTENT "${Main_Expected_Opts}")

add_test(NAME Main_Sanitizers
    COMMAND ${CMAKE_COMMAND} -E compare_files
        $<CONFIG>/Main_Opts.txt $<CONFIG>/Main_Expected_Opts.txt)
