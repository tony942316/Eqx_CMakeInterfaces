# Main.cmake

add_executable(Test_Optimizations)
target_sources(Test_Optimizations PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../Simple.cpp)
target_compile_features(Test_Optimizations PRIVATE cxx_std_17)
target_link_libraries(Test_Optimizations PRIVATE
    Eqx_Optimizations)
set_target_properties(Test_Optimizations PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)

set(Main_Opts
    $<TARGET_PROPERTY:Test_Optimizations,COMPILE_OPTIONS>)
set(Main_Expected_Opts)

if (Eqx_GNU OR Eqx_Clang)
    list(APPEND Main_Expected_Opts
        -ffast-math -fno-exceptions -fno-rtti -O3)
elseif (Eqx_MSVC)
    list(APPEND Main_Expected_Opts
        /fp:fast /EHcs /GR- $<IF:$<CONFIG:Debug>,/Od,/O2>)
else()
    message(FATAL_ERROR "FAILURE!")
endif()

file(GENERATE
    OUTPUT $<CONFIG>/Main_Opts.txt
    CONTENT "${Main_Opts}")

file(GENERATE
    OUTPUT $<CONFIG>/Main_Expected_Opts.txt
    CONTENT "$<JOIN:$<FILTER:${Main_Expected_Opts},EXCLUDE,^$>,;>")

add_test(NAME Main_Optimizations
    COMMAND ${CMAKE_COMMAND} -E compare_files
        $<CONFIG>/Main_Opts.txt $<CONFIG>/Main_Expected_Opts.txt)
