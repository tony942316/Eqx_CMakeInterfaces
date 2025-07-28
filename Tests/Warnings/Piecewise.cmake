# Piecewise.cmake

add_executable(Test_Warnings_Basic)
target_sources(Test_Warnings_Basic PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../Simple.cpp)
target_compile_features(Test_Warnings_Basic PRIVATE cxx_std_17)
target_link_libraries(Test_Warnings_Basic PRIVATE Eqx_Warnings_Basic)
set_target_properties(Test_Warnings_Basic PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)

add_executable(Test_Warnings_Error)
target_sources(Test_Warnings_Error PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../Simple.cpp)
target_compile_features(Test_Warnings_Error PRIVATE cxx_std_17)
target_link_libraries(Test_Warnings_Error PRIVATE Eqx_Warnings_Error)
set_target_properties(Test_Warnings_Error PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)

add_executable(Test_Warnings_Additional)
target_sources(Test_Warnings_Additional PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../Simple.cpp)
target_compile_features(Test_Warnings_Additional PRIVATE cxx_std_17)
target_link_libraries(Test_Warnings_Additional PRIVATE Eqx_Warnings_Additional)
set_target_properties(Test_Warnings_Additional PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)

set(Piecewise_Opts
    $<TARGET_PROPERTY:Test_Warnings_Basic,COMPILE_OPTIONS>
    $<TARGET_PROPERTY:Test_Warnings_Error,COMPILE_OPTIONS>
    $<TARGET_PROPERTY:Test_Warnings_Additional,COMPILE_OPTIONS>)
set(Piecewise_Expected_Opts)

if (Eqx_GNU OR Eqx_Clang)
    list(APPEND Piecewise_Expected_Opts -Wall -Wextra -Wpedantic -Wconversion
        -Werror -Wfloat-equal -Wshadow -Wswitch-enum -Wcast-qual -Wundef
        -Wunused-macros -Wnon-virtual-dtor -Woverloaded-virtual
        -Wold-style-cast -Wdouble-promotion -Wformat=2 -Wformat-overflow
        -Wformat-truncation)
    if (Eqx_GNU)
        list(APPEND Piecewise_Expected_Opts -Wduplicated-cond
            -Wduplicated-branches)
    elseif (Eqx_Clang)
        list(APPEND Piecewise_Expected_Opts -Wbad-function-cast)
    endif()
elseif (Eqx_MSVC)
    list(APPEND Piecewise_Expected_Opts /W4 /WX)
else()
    message(FATAL_ERROR "Failure!")
endif()

#message(FATAL_ERROR "${Piecewise_Expected_Opts}")

file(GENERATE
    OUTPUT $<CONFIG>/Piecewise_Opts.txt
    CONTENT "$<JOIN:$<FILTER:${Piecewise_Opts},EXCLUDE,^$>,;>")

file(GENERATE
    OUTPUT $<CONFIG>/Piecewise_Expected_Opts.txt
    CONTENT "$<JOIN:$<FILTER:${Piecewise_Expected_Opts},EXCLUDE,^$>,;>")

add_test(NAME Piecewise_Warnings
    COMMAND ${CMAKE_COMMAND} -E compare_files
        $<CONFIG>/Piecewise_Opts.txt $<CONFIG>/Piecewise_Expected_Opts.txt)
