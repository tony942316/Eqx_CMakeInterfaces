# Main.cmake

if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    if (NOT Eqx_GNU)
        message(FATAL_ERROR "Eqx_GNU not set!")
    endif()
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    if (NOT Eqx_Clang)
        message(FATAL_ERROR "Eqx_Clang not set!")
    endif()
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    if (NOT Eqx_MSVC)
        message(FATAL_ERROR "Eqx_MSVC not set!")
    endif()
else()
    message(FATAL_ERROR "Unknown compiler: ${CMAKE_CXX_COMPILER_ID}")
endif()

add_test(NAME Main_Vars
    COMMAND ${CMAKE_COMMAND} -E true)
