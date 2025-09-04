# gtest.cmake

include(FetchContent)

FetchContent_Declare(googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG v1.14.0)

set(INSTALL_GTEST OFF CACHE BOOL "" FORCE)

FetchContent_MakeAvailable(googletest)

eqx_add_headerunit(test_gtest)
target_sources(test_gtest INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/gtest.hpp)
target_include_directories(test_gtest INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/)
target_link_libraries(test_gtest_PRIVATE INTERFACE GTest::gtest_main)
target_link_libraries(test_gtest INTERFACE GTest::gtest_main)

add_library(no_warnings INTERFACE)
target_compile_options(no_warnings INTERFACE -w)

eqx_add_headerunit(test_gtest_typical)
target_sources(test_gtest_typical INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/gtest.hpp)
target_include_directories(test_gtest_typical INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/)
target_link_libraries(test_gtest_typical_PRIVATE INTERFACE
    GTest::gtest_main Eqx_Typical no_warnings)
target_link_libraries(test_gtest_typical INTERFACE
    GTest::gtest_main Eqx_Typical)

add_executable(Test_HeaderUnit_gtest)
target_sources(Test_HeaderUnit_gtest PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/gtest.cpp)
target_compile_features(Test_HeaderUnit_gtest PRIVATE cxx_std_20)
target_link_libraries(Test_HeaderUnit_gtest PRIVATE test_gtest)
set_target_properties(Test_HeaderUnit_gtest PROPERTIES
    EXPORT_COMPILE_COMMANDS On
    CXX_EXTENSIONS Off
    CXX_STANDARD_REQUIRED On)

add_executable(Test_HeaderUnit_gtest_typical)
target_sources(Test_HeaderUnit_gtest_typical PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/gtest.cpp)
target_compile_features(Test_HeaderUnit_gtest_typical PRIVATE cxx_std_20)
target_link_libraries(Test_HeaderUnit_gtest_typical PRIVATE test_gtest_typical)
set_target_properties(Test_HeaderUnit_gtest_typical PROPERTIES
    EXPORT_COMPILE_COMMANDS On
    CXX_EXTENSIONS Off
    CXX_STANDARD_REQUIRED On)

include(GoogleTest)
gtest_discover_tests(Test_HeaderUnit_gtest)
gtest_discover_tests(Test_HeaderUnit_gtest_typical)
