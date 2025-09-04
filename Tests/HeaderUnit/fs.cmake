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
target_link_libraries(Test_HeaderUnit_fs PRIVATE fs)
set_target_properties(Test_HeaderUnit_fs PROPERTIES
    EXPORT_COMPILE_COMMANDS On
    CXX_EXTENSIONS Off
    CXX_STANDARD_REQUIRED On)

add_executable(Test_HeaderUnit_fs_typical)
target_sources(Test_HeaderUnit_fs_typical PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/fs.cpp)
target_compile_features(Test_HeaderUnit_fs_typical PRIVATE cxx_std_20)
target_link_libraries(Test_HeaderUnit_fs_typical PRIVATE fs_typical)
set_target_properties(Test_HeaderUnit_fs_typical PROPERTIES
    EXPORT_COMPILE_COMMANDS On
    CXX_EXTENSIONS Off
    CXX_STANDARD_REQUIRED On)

eqx_copy_asan(Test_HeaderUnit_fs_typical)

add_test(NAME Test_HeaderUnit_fs
    COMMAND $<TARGET_FILE:Test_HeaderUnit_fs>)

add_test(NAME Test_HeaderUnit_fs_typical
    COMMAND $<TARGET_FILE:Test_HeaderUnit_fs_typical>)
