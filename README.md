# Eqx_CMakeInterfaces

[![CI](https://github.com/tony942316/Eqx_CMakeInterfaces/actions/workflows/ci_gcc_14.yml/badge.svg?branch=main)](https://github.com/tony942316/Eqx_CMakeInterfaces/actions/workflows/ci_gcc_14.yml)
[![CI](https://github.com/tony942316/Eqx_CMakeInterfaces/actions/workflows/ci_clang_18.yml/badge.svg?branch=main)](https://github.com/tony942316/Eqx_CMakeInterfaces/actions/workflows/ci_clang_18.yml)

## Contents

1. [Summary](#summary)
2. [Features](#features)
3. [Usage](#usage)

## Summary <a name="summary"></a>

Collection of CMake interfaces that provide common compiler flags in a platform
agnostic fashion, CMake version 3.28+ is required.

Basic Example ->
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

# Eqx_Warnings is an interface that provides various compiler warning flags
target_link_libraries(Main PRIVATE Eqx_Warnings)

set_target_properties(Main PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)
```
With Eqx_Warnings linked to this target the compiler will now have -Wall or
/W4 passed to it depending on the compiler.

## Features <a name="features"></a>

- Eqx_DebugSymbols      (Provides /Zi or -g3)

- Eqx_Warnings          (Provides /W4 or -Wall -Wextra -Wconversion -Wpedantic)

- Eqx_Optimizations     (Provides all of those below)
    - Eqx_FastMath      (Provides /fp:fast or -ffast-math)
    - Eqx_NoExceptions  (Provides /EHcs or -fno-exceptions)
    - Eqx_NoRTTI        (Provides /GR- or -fno-rtti)
    - Eqx_Regular       (Provides /O2t or -O3)

- Eqx_Sanitizers        (Provides ASan UBSan and LSan .. only ASan for Windows)
    - Eqx_ASan          (Provides /fsanitize=address or -fsanitize=address)
    - Eqx_LSan          (Provides -fsanitize=leak)
    - Eqx_TSan          (Provides -fsanitize=thread)
    - Eqx_UBSan         (Provides -fsanitize=undefined)

- Eqx_Typical           (Provides those below based on compiler and config)
    - Eqx_Warnings      (All)
    - Eqx_DebugSymbols  (GCC/Clang:All,MSVC:Debug)
    - Eqx_Optimizations (GCC/Clang:None,MSVC:Release)
    - Eqx_Sanitizers    (GCC/Clang:All,MSVC:Debug)

## Usage <a name="usage"></a>

To use Eqx_CMakeInterfaces in your project use FetchContent to obtain the repo,
alternatively you may clone, download, or extract the repo onto your system
and `include(path/to/Eqx_CMakeInterfaces/Interfaces.cmake)` or
`add_subdirectory(path/to/Eqx_CMakeInterfaces)`.

Example ->
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

# Link your target to an Eqx Interface
target_link_libraries(Main PRIVATE Eqx_Typical)

set_target_properties(Main PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)
```

With Eqx_Typical the compiler will have the following flags
- MSVC (Debug): /W4 /Zi /fsanitize=address
- MSVC (Release): /W4 /fp:fast /EHcs /GR- /O2t
- GCC/Clang: -Wall -Wextra -Wconversion -Wpedantic -g3 -fsanitize=address
-fsanitize=leak -fsanitize=undefined
