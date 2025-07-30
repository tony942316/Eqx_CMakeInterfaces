# Eqx_CMakeInterfaces

[![G++-14](https://github.com/tony942316/Eqx_CMakeInterfaces/actions/workflows/ci_gcc_14.yml/badge.svg?branch=main)](https://github.com/tony942316/Eqx_CMakeInterfaces/actions/workflows/ci_gcc_14.yml)
[![Clang-18](https://github.com/tony942316/Eqx_CMakeInterfaces/actions/workflows/ci_clang_18.yml/badge.svg?branch=main)](https://github.com/tony942316/Eqx_CMakeInterfaces/actions/workflows/ci_clang_18.yml)
[![CL](https://github.com/tony942316/Eqx_CMakeInterfaces/actions/workflows/ci_cl.yml/badge.svg?branch=main)](https://github.com/tony942316/Eqx_CMakeInterfaces/actions/workflows/ci_cl.yml)

**Eqx_CMakeInterfaces** is a collection of small CMake interface libraries that
provide a consistent set of compiler flags across GCC, Clang and MSVC. CMake
**3.28+** and a multi‑config generator
(e.g. Ninja Multi-Config or Visual Studio) are required.

## Contents

1. [Quick Start](#quickstart)
2. [Features](#features)
3. [Examples](#examples)

## Quick Start <a name="quickstart"></a>

Fetch the repository in your project and link any interface target you need:

```cmake
# CMakeLists.txt
cmake_minimum_required(VERSION 3.28)

include(FetchContent)

FetchContent_Declare(
    Eqx_CMakeInterfaces
    GIT_REPOSITORY https://github.com/tony942316/Eqx_CMakeInterfaces.git
    GIT_TAG main)

FetchContent_MakeAvailable(Eqx_CMakeInterfaces)

# Alternatively use include(path/to/Eqx_CMakeInterfaces/Interfaces.cmake)
# Or use add_subdirectory(path/to/Eqx_CMakeInterfaces)

add_executable(Main)
target_sources(Main PRIVATE Main.cpp)
# Eqx_Typcial gives various flags based on config
target_link_libraries(Main PRIVATE Eqx_Typical)
set_target_properties(Main PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)
```

## Features <a name="features"></a>

- Variables:
    - Eqx_GNU: On if using GCC
    - Eqx_Clang: On if using Clang
    - Eqx_MSVC: On if using MSVC

- Eqx_Debug_Symbols:
    Windows: /Zi
    GCC/Clang: -g3

- Eqx_Warnings:
    - Eqx_Warnings_Basic:
        Windows: /W4
        GCC/Clang: -Wall -Wextra -Wconversion -Wpedantic
    - Eqx_Warnings_Additional:
        Windows: **NONE**
        GCC/Clang: -Wfloat-equal -Wshadow -Wswitch-enum -Wcast-qual -Wundef
            -Wunused-macros -Wnon-virtual-dtor -Woverloaded-virtual
            -Wold-style-cast -Wdouble-promotion -Wformat=2 -Wformat-overflow
            -Wformat-truncation
        GCC: -Wduplicated-cond -Wduplicated-branches
        Clang: -Wbad-function-cast
    - Eqx_Warnings_Error:
        Windows: /WX
        GCC/Clang: -Werror

- Eqx_Optimizations:
    - Eqx_FastMath:
        Windows: /fp:fast
        GCC/Clang: -ffast-math
    - Eqx_NoExceptions:
        Windows: /EHcs
        GCC/Clang: -fno-exceptions
    - Eqx_NoRTTI:
        Windows: /GR-
        GCC/Clang: -fno-rtti
    - Eqx_Regular:
        Windows:
            Debug: /Od
            Otherwise: /O2
        GCC/Clang: -O3

- Eqx_Sanitizers:
    - Eqx_ASan:
        Windows: /fsanitizer=address
        GCC/Clang: -fsanitizer=address
    - Eqx_LSan:
        Windows: **NONE**
        GCC/Clang: -fsanitize=leak
    - Eqx_TSan:
        Windows: **NONE**
        GCC/Clang: -fsanitize=thread
    - Eqx_UBSan:
        Windows: **NONE**
        GCC/Clang: -fsanitize=undefined

- Eqx_Typical:
    All: Eqx_Warngins
    Debug: Eqx_Debug_Symbols Eqx_Sanitizers
    Release: Eqx_Optimizations
    RelWithDebInfo: Eqx_Debug_Symbols Eqx_Optimizations

## Examples <a name="examples"></a>

```cmake
# CMakeLists.txt
cmake_minimum_required(VERSION 3.28)

include(FetchContent)

FetchContent_Declare(
    Eqx_CMakeInterfaces
    GIT_REPOSITORY https://github.com/tony942316/Eqx_CMakeInterfaces.git
    GIT_TAG main)

FetchContent_MakeAvailable(Eqx_CMakeInterfaces)

add_executable(Main)
target_sources(Main PRIVATE Main.cpp)
target_link_libraries(Main PRIVATE Eqx_Typical)
set_target_properties(Main PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)

add_executable(Other)
target_sources(Other PRIVATE Other.cpp)
if (Eqx_GNU)
    target_link_libraries(Other PRIVATE Eqx_Sanitizers_TSan)
elseif (Eqx_MSVC)
    target_link_libraries(Other PRIVATE Eqx_Sanitizers_ASan)
elseif (Eqx_Clang)
    target_link_libraries(Other PRIVATE Eqx_Sanitizers_UBSan)
endif()
```
