# gtest.cmake

eqx_add_headerunit(gtest_hu)
target_sources(gtest_hu INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/gtest.hpp)
target_include_directories(gtest_hu INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/)
target_link_libraries(gtest_hu_PRIVATE INTERFACE GTest::gtest_main)
target_link_libraries(gtest_hu INTERFACE GTest::gtest_main)

eqx_add_headerunit(gtest_hu_typical)
target_sources(gtest_hu_typical INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/gtest.hpp)
target_include_directories(gtest_hu_typical INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/)
target_compile_definitions(gtest_hu_typical INTERFACE _DISABLE_STRING_ANNOTATION
    _DISABLE_VECTOR_ANNOTATION)
target_link_libraries(gtest_hu_typical_PRIVATE INTERFACE
    GTest::gtest_main Eqx_Typical)
target_link_libraries(gtest_hu_typical INTERFACE GTest::gtest_main Eqx_Typical)

add_executable(Test_HeaderUnit_GTest)
target_sources(Test_HeaderUnit_GTest PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/gtest.cpp)
target_compile_features(Test_HeaderUnit_GTest PRIVATE cxx_std_20)
target_compile_definitions(Test_HeaderUnit_GTest PRIVATE
    CMAKE_TARGET_NAME=Test_HeaderUnit_GTest)
target_link_libraries(Test_HeaderUnit_GTest PRIVATE gtest_hu)
set_target_properties(Test_HeaderUnit_GTest PROPERTIES
    EXPORT_COMPILE_COMMANDS On
    CXX_EXTENSIONS Off
    CXX_STANDARD_REQUIRED On)

add_executable(Test_HeaderUnit_GTest_Typical)
target_sources(Test_HeaderUnit_GTest_Typical PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/gtest.cpp)
target_compile_features(Test_HeaderUnit_GTest_Typical PRIVATE cxx_std_20)
target_compile_definitions(Test_HeaderUnit_GTest_Typical PRIVATE
    CMAKE_TARGET_NAME=Test_HeaderUnit_GTest_Typical)
target_link_libraries(Test_HeaderUnit_GTest_Typical PRIVATE gtest_hu_typical)
set_target_properties(Test_HeaderUnit_GTest_Typical PROPERTIES
    EXPORT_COMPILE_COMMANDS On
    CXX_EXTENSIONS Off
    CXX_STANDARD_REQUIRED On)

eqx_copy_asan(Test_HeaderUnit_GTest_Typical)

include(GoogleTest)
gtest_discover_tests(Test_HeaderUnit_GTest)
gtest_discover_tests(Test_HeaderUnit_GTest_Typical)
