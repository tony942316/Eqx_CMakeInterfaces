# CMakeLists.txt

cmake_minimum_required(VERSION 3.28)

include(FetchContent)

FetchContent_Declare(googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG v1.14.0)

set(INSTALL_GTEST OFF CACHE BOOL "" FORCE)

FetchContent_MakeAvailable(googletest)

add_executable(Test_VersionInfo)
target_sources(Test_VersionInfo PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/Main.cpp)
target_compile_definitions(Test_VersionInfo PRIVATE
    EXPECTED_VERSION=\"${PROJECT_VERSION}\" EXPECTED_CONFIG=\"$<CONFIG>\"
    CMAKE_TARGET_NAME=Test_VersionInfo)
target_link_libraries(Test_VersionInfo PRIVATE
    Eqx_VersionInfo GTest::gtest_main)
set_target_properties(Test_VersionInfo PROPERTIES
    EXPORT_COMPILE_COMMANDS On
    CXX_EXTENSIONS Off)

add_executable(Test_VersionInfo_typical)
target_sources(Test_VersionInfo_typical PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/Main.cpp)
target_compile_definitions(Test_VersionInfo_typical PRIVATE
    EXPECTED_VERSION=\"${PROJECT_VERSION}\" EXPECTED_CONFIG=\"$<CONFIG>\"
    CMAKE_TARGET_NAME=Test_VersionInfo_typical)
target_link_libraries(Test_VersionInfo_typical PRIVATE
    Eqx_VersionInfo GTest::gtest_main Eqx_Typical)
set_target_properties(Test_VersionInfo_typical PROPERTIES
    EXPORT_COMPILE_COMMANDS On
    CXX_EXTENSIONS Off)

include(GoogleTest)
gtest_discover_tests(Test_VersionInfo)
gtest_discover_tests(Test_VersionInfo_typical)
