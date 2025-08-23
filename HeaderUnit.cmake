cmake_minimum_required(VERSION 3.28)

function(eqx_add_headerunit LIB_NAME)
    add_library(${LIB_NAME} INTERFACE)
    target_compile_features(${LIB_NAME} INTERFACE cxx_std_20)
    if (Eqx_Clang)
        add_custom_command(
            OUTPUT
                ${CMAKE_CURRENT_BINARY_DIR}/${LIB_NAME}_$<CONFIG>.pcm
            COMMAND ${CMAKE_CXX_COMPILER}
                -std=c++20 -fmodule-header
                $<TARGET_PROPERTY:${LIB_NAME},INTERFACE_COMPILE_OPTIONS>
                $<TARGET_PROPERTY:${LIB_NAME},SOURCES> -o
                ${CMAKE_CURRENT_BINARY_DIR}/${LIB_NAME}_$<CONFIG>.pcm
            DEPENDS
                $<TARGET_PROPERTY:${LIB_NAME},SOURCES>
            COMMENT "Building ${LIB_NAME} Header Unit"
            COMMAND_EXPAND_LISTS)

        add_custom_target(Eqx_PT_${LIB_NAME} DEPENDS
            ${CMAKE_CURRENT_BINARY_DIR}/${LIB_NAME}_$<CONFIG>.pcm)

        target_compile_options(${LIB_NAME} INTERFACE
            -Wno-experimental-header-units
            -fmodule-file=${CMAKE_CURRENT_BINARY_DIR}/${LIB_NAME}_$<CONFIG>.pcm)
        add_dependencies(${LIB_NAME} Eqx_PT_${LIB_NAME})
    elseif (Eqx_GNU)
    elseif (Eqx_MSVC)
    endif()
endfunction()
