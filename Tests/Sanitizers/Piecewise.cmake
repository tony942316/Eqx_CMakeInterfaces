# Piecewise.cmake

add_executable(Test_Sanitizers_ASan)
target_sources(Test_Sanitizers_ASan PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../Simple.cpp)
target_compile_features(Test_Sanitizers_ASan PRIVATE cxx_std_17)
target_link_libraries(Test_Sanitizers_ASan PRIVATE
    Eqx_Sanitizers_ASan)
set_target_properties(Test_Sanitizers_ASan PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)

add_executable(Test_Sanitizers_LSan)
target_sources(Test_Sanitizers_LSan PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../Simple.cpp)
target_compile_features(Test_Sanitizers_LSan PRIVATE cxx_std_17)
target_link_libraries(Test_Sanitizers_LSan PRIVATE
    Eqx_Sanitizers_LSan)
set_target_properties(Test_Sanitizers_LSan PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)

add_executable(Test_Sanitizers_TSan)
target_sources(Test_Sanitizers_TSan PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../Simple.cpp)
target_compile_features(Test_Sanitizers_TSan PRIVATE cxx_std_17)
target_link_libraries(Test_Sanitizers_TSan PRIVATE
    Eqx_Sanitizers_TSan)
set_target_properties(Test_Sanitizers_TSan PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)

add_executable(Test_Sanitizers_UBSan)
target_sources(Test_Sanitizers_UBSan PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../Simple.cpp)
target_compile_features(Test_Sanitizers_UBSan PRIVATE cxx_std_17)
target_link_libraries(Test_Sanitizers_UBSan PRIVATE
    Eqx_Sanitizers_UBSan)
set_target_properties(Test_Sanitizers_UBSan PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)

set(Piecewise_Opts
    $<TARGET_PROPERTY:Test_Sanitizers_ASan,COMPILE_OPTIONS>
    $<TARGET_PROPERTY:Test_Sanitizers_LSan,COMPILE_OPTIONS>
    $<TARGET_PROPERTY:Test_Sanitizers_TSan,COMPILE_OPTIONS>
    $<TARGET_PROPERTY:Test_Sanitizers_UBSan,COMPILE_OPTIONS>)
set(Piecewise_Expected_Opts)

if (Eqx_GNU OR Eqx_Clang)
    list(APPEND Piecewise_Expected_Opts
        -fsanitize=address -fsanitize=leak -fsanitize=thread -fsanitize=undefined)
elseif (Eqx_MSVC)
    list(APPEND Piecewise_Expected_Opts
        /fsanitize=address $<$<CONFIG:Release>:/wd5072>
        $<$<CONFIG:MinSizeRel>:/wd5072> "" "" "")
else()
    message(FATAL_ERROR "FAILURE!")
endif()

file(GENERATE
    OUTPUT $<CONFIG>/Piecewise_Opts.txt
    CONTENT "${Piecewise_Opts}")

file(GENERATE
    OUTPUT $<CONFIG>/Piecewise_Expected_Opts.txt
    CONTENT "$<JOIN:$<FILTER:${Piecewise_Expected_Opts},EXCLUDE,^$>,;>")

add_test(NAME Piecewise_Sanitizers
    COMMAND ${CMAKE_COMMAND} -E compare_files
        $<CONFIG>/Piecewise_Opts.txt $<CONFIG>/Piecewise_Expected_Opts.txt)
