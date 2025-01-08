cmake_minimum_required(VERSION 3.28)

include("${CMAKE_CURRENT_LIST_DIR}/ASan.cmake")

if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
else ()
    include("${CMAKE_CURRENT_LIST_DIR}/LSan.cmake")
    include("${CMAKE_CURRENT_LIST_DIR}/TSan.cmake")
    include("${CMAKE_CURRENT_LIST_DIR}/UBSan.cmake")
endif()

add_library(Eqx_Sanitizers INTERFACE)

target_link_libraries(Eqx_Sanitizers INTERFACE Eqx_ASan)

if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
else ()
    target_link_libraries(Eqx_Sanitizers INTERFACE Eqx_LSan Eqx_UBSan)
endif()
