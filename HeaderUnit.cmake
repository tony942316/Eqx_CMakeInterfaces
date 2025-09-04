# HeaderUnit.cmake

cmake_minimum_required(VERSION 3.28)

function(eqx_add_headerunit LIB_NAME)
    add_library(${LIB_NAME} INTERFACE)
    target_compile_features(${LIB_NAME} INTERFACE cxx_std_20)
    add_library(${LIB_NAME}_PRIVATE INTERFACE)
    if (Eqx_Clang)
        set(HU_COMPILE_FLAGS
            $<IF:$<BOOL:$<TARGET_PROPERTY:${LIB_NAME}_PRIVATE,INTERFACE_INCLUDE_DIRECTORIES>>,-I$<JOIN:$<TARGET_PROPERTY:${LIB_NAME}_PRIVATE,INTERFACE_INCLUDE_DIRECTORIES>,$<SEMICOLON>-I>,>)
        add_custom_command(
            OUTPUT
                ${CMAKE_CURRENT_BINARY_DIR}/${LIB_NAME}_$<CONFIG>.pcm
            COMMAND ${CMAKE_CXX_COMPILER}
                -std=c++20 -fmodule-header
                ${HU_COMPILE_FLAGS}
                $<TARGET_PROPERTY:${LIB_NAME}_PRIVATE,INTERFACE_COMPILE_OPTIONS>
                $<TARGET_PROPERTY:${LIB_NAME}_PRIVATE,INTERFACE_LINK_OPTIONS>
                $<TARGET_PROPERTY:${LIB_NAME},INTERFACE_SOURCES> -o
                ${CMAKE_CURRENT_BINARY_DIR}/${LIB_NAME}_$<CONFIG>.pcm
            DEPENDS
                $<TARGET_PROPERTY:${LIB_NAME},INTERFACE_SOURCES>
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
    else()
        message(FATAL_ERROR "Failure!")
    endif()
endfunction()
