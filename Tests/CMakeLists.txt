# CMakeLists.txt

cmake_minimum_required(VERSION 3.28)

add_subdirectory(DebugSymbols/)
add_subdirectory(Optimizations/)
add_subdirectory(Sanitizers/)
add_subdirectory(Warnings/)
add_subdirectory(Vars/)
add_subdirectory(Typical/)
add_subdirectory(Usage/)
add_subdirectory(CopyASanMSVC/)
add_subdirectory(VersionInfo/)
if (Eqx_MSVC OR Eqx_Clang)
    add_subdirectory(HeaderUnit/)
elseif (Eqx_GNU)

else()
    message(FATAL_ERROR "Failure!")
endif()
