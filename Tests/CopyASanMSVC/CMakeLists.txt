cmake_minimum_required(VERSION 3.28)

add_executable(Test_CopyASanMSVC)
target_sources(Test_CopyASanMSVC PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../Simple.cpp)
target_compile_features(Test_CopyASanMSVC PRIVATE cxx_std_17)
target_link_libraries(Test_CopyASanMSVC PRIVATE Eqx_Sanitizers_ASan)
set_target_properties(Test_CopyASanMSVC PROPERTIES
    EXPORT_COMPILE_COMMANDS On
    CXX_EXTENSIONS Off)

eqx_copy_asan(Test_CopyASanMSVC)

add_test(NAME Test_CopyASanMSVC
    COMMAND $<TARGET_FILE:Test_CopyASanMSVC>)
