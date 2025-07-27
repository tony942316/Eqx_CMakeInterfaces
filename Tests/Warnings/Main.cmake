# Main.cmake

add_executable(Test_Warnings)
target_sources(Test_Warnings PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../Simple.cpp)
target_link_libraries(Test_Warnings PRIVATE Eqx_Warnings)
set_target_properties(Test_Warnings PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)

set(Main_Opts $<TARGET_PROPERTY:Test_Warnings,COMPILE_OPTIONS>)
set(Main_Expected_Opts)

if (Eqx_GNU OR Eqx_Clang)
    list(APPEND Main_Expected_Opts -Wall -Wextra -Wpedantic -Wconversion
        -Wfloat-equal -Wshadow -Wswitch-enum -Wcast-qual -Wundef
        -Wunused-macros -Wnon-virtual-dtor -Woverloaded-virtual
        -Wold-style-cast -Wdouble-promotion -Wformat=2 -Wformat-overflow
        -Wformat-truncation)
    if (Eqx_GNU)
        list(APPEND Main_Expected_Opts -Wduplicated-cond
            -Wduplicated-branches)
    elseif (Eqx_Clang)
        list(APPEND Main_Expected_Opts -Wbad-function-cast)
    endif()
elseif (Eqx_MSVC)
    message(FATAL_ERROR "TODO")
else()
    message(FATAL_ERROR "Failure!")
endif()

file(GENERATE
    OUTPUT $<CONFIG>/Main_Opts.txt
    CONTENT "${Main_Opts}")

file(GENERATE
    OUTPUT $<CONFIG>/Main_Expected_Opts.txt
    CONTENT "${Main_Expected_Opts}")

add_test(NAME Main_Warnings
    COMMAND ${CMAKE_COMMAND} -E compare_files
        $<CONFIG>/Main_Opts.txt $<CONFIG>/Main_Expected_Opts.txt)
