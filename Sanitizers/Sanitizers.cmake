cmake_minimum_required(VERSION 3.28)

include("${CMAKE_CURRENT_LIST_DIR}/ASan/ASan.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/LSan/LSan.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/TSan/TSan.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/UBSan/UBSan.cmake")

add_library(EQX-Sanitizers INTERFACE)
target_link_libraries(EQX-Sanitizers INTERFACE EQX-ASan EQX-LSan EQX-UBSan)
