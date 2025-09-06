# fs.cmake

eqx_add_headerunit(fs)
target_sources(fs INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/fs.hpp)
target_include_directories(fs INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/)

eqx_add_headerunit(fs_typical)
target_sources(fs_typical INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/fs.hpp)
target_include_directories(fs_typical INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/)
target_link_libraries(fs_typical_PRIVATE INTERFACE Eqx_Typical)
target_link_libraries(fs_typical INTERFACE Eqx_Typical)

add_executable(Test_HeaderUnit_fs)
target_sources(Test_HeaderUnit_fs PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/fs.cpp)
target_compile_features(Test_HeaderUnit_fs PRIVATE cxx_std_20)
target_compile_definitions(Test_HeaderUnit_fs PRIVATE
    CMAKE_TARGET_NAME=Test_HeaderUnit_fs)
target_link_libraries(Test_HeaderUnit_fs PRIVATE fs GTest::gtest_main)
set_target_properties(Test_HeaderUnit_fs PROPERTIES
    EXPORT_COMPILE_COMMANDS On
    CXX_EXTENSIONS Off
    CXX_STANDARD_REQUIRED On)

add_executable(Test_HeaderUnit_fs_typical)
target_sources(Test_HeaderUnit_fs_typical PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/fs.cpp)
target_compile_features(Test_HeaderUnit_fs_typical PRIVATE cxx_std_20)
target_compile_definitions(Test_HeaderUnit_fs_typical PRIVATE
    CMAKE_TARGET_NAME=Test_HeaderUnit_fs_typical _DISABLE_STRING_ANNOTATION
    _DISABLE_VECTOR_ANNOTATION)
target_link_libraries(Test_HeaderUnit_fs_typical PRIVATE
    fs_typical GTest::gtest_main)
set_target_properties(Test_HeaderUnit_fs_typical PROPERTIES
    EXPORT_COMPILE_COMMANDS On
    CXX_EXTENSIONS Off
    CXX_STANDARD_REQUIRED On)

eqx_copy_asan(Test_HeaderUnit_fs_typical)

include(GoogleTest)
gtest_discover_tests(Test_HeaderUnit_fs)
gtest_discover_tests(Test_HeaderUnit_fs_typical)
