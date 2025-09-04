# CopyAsanMSVC.cmake

function(eqx_copy_asan TARGET_NAME)
    if (Eqx_MSVC)
        add_custom_command(TARGET ${TARGET_NAME} POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_if_different
                ${CMAKE_SOURCE_DIR}/clang_rt.asan_dynamic-x86_64.dll
                $<TARGET_FILE_DIR:${TARGET_NAME}>)
    elseif (Eqx_Clang OR Eqx_GNU)

    else()
        message(FATAL_ERROR "Invalid Configuration!")
    endif()
endfunction()
