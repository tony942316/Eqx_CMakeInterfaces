# Piecewise.cmake

add_executable(Test_Optimizations_FastMath)
target_sources(Test_Optimizations_FastMath PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../Simple.cpp)
target_link_libraries(Test_Optimizations_FastMath PRIVATE
    Eqx_Optimizations_FastMath)
set_target_properties(Test_Optimizations_FastMath PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)

add_executable(Test_Optimizations_Regular)
target_sources(Test_Optimizations_Regular PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../Simple.cpp)
target_link_libraries(Test_Optimizations_Regular PRIVATE
    Eqx_Optimizations_Regular)
set_target_properties(Test_Optimizations_Regular PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)

add_executable(Test_Optimizations_NoRTTI)
target_sources(Test_Optimizations_NoRTTI PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../Simple.cpp)
target_link_libraries(Test_Optimizations_NoRTTI PRIVATE
    Eqx_Optimizations_NoRTTI)
set_target_properties(Test_Optimizations_NoRTTI PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)

add_executable(Test_Optimizations_NoExceptions)
target_sources(Test_Optimizations_NoExceptions PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../Simple.cpp)
target_link_libraries(Test_Optimizations_NoExceptions PRIVATE
    Eqx_Optimizations_NoExceptions)
set_target_properties(Test_Optimizations_NoExceptions PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)

set(Piecewise_Opts
    $<TARGET_PROPERTY:Test_Optimizations_FastMath,COMPILE_OPTIONS>
    $<TARGET_PROPERTY:Test_Optimizations_Regular,COMPILE_OPTIONS>
    $<TARGET_PROPERTY:Test_Optimizations_NoRTTI,COMPILE_OPTIONS>
    $<TARGET_PROPERTY:Test_Optimizations_NoExceptions,COMPILE_OPTIONS>)
set(Piecewise_Expected_Opts)

if (Eqx_GNU OR Eqx_Clang)
    list(APPEND Piecewise_Expected_Opts
        -ffast-math -O3 -fno-rtti -fno-exceptions)
elseif (Eqx_MSVC)
    message(FATAL_ERROR "TODO")
else()
    message(FATAL_ERROR "FAILURE!")
endif()

file(GENERATE
    OUTPUT $<CONFIG>/Piecewise_Opts.txt
    CONTENT "${Piecewise_Opts}")

file(GENERATE
    OUTPUT $<CONFIG>/Piecewise_Expected_Opts.txt
    CONTENT "${Piecewise_Expected_Opts}")

add_test(NAME Piecewise_Optimizations
    COMMAND ${CMAKE_COMMAND} -E compare_files
        $<CONFIG>/Piecewise_Opts.txt $<CONFIG>/Piecewise_Expected_Opts.txt)
