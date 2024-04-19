# EQX-CmakeInterfaces

## Contents

1. [Summary](#summary)
2. [Features](#features)
3. [Usage](#usage)

## Summary <a name="summary"></a>

Collection of CMake interfaces that provide common compiler flags in a platform
agnostic fashion, CMake version 3.28+ is required.

Basic Example ->
```cmake
include(path/to/EQX-CmakeInterfaces/Interfaces.cmake)

add_executable(Main)
target_sources(Main PRIVATE Main.cpp)

# EQX-Warnings is an interface that provides various compiler warning flags
target_link_libraries(Main PRIVATE EQX-Warnings)

set_target_properties(Main PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)
```
With EQX-Warnings linked to this target the compiler will now have -Wall or
/W4 passed to it.

## Features <a name="features"></a>

- EQX-DebugSymbols      (Provides /Zi or -g3)
- EQX-Warnings          (Provides /W4 or -Wall -Wextra -Wconversion -Wpedantic)
- EQX-Optimizations     (Provides all of those below)
    - EQX-FastMath      (Provides /fp:fast or -ffast-math)
    - EQX-NoExceptions  (Provides /EHcs or -fno-exceptions)
    - EQX-NoRTTI        (Provides /GR- or -fno-rtti)
    - EQX-Regular       (Provides /O2t or -O3)
- EQX-Sanitizers        (Provides ASan UBSan and LSan .. only ASan for Windows)
    - EQX-ASan          (Provides /fsanitize=address or -fsanitize=address)
    - EQX-LSan          (Provides -fsanitize=leak)
    - EQX-TSan          (Provides -fsanitize=thread)
    - EQX-UBSan         (Provides -fsanitize=undefined)

- EQX-Typical           (Provides those below based on compiler and config)
    - EQX-Warnings      (All)
    - EQX-DebugSymbols  (GCC/Clang:All,MSVC:Debug)
    - EQX-Optimizations (GCC/Clang:None,MSVC:Release)
    - EQX-Sanitizers    (GCC/Clang:All,MSVC:Debug)

## Usage <a name="usage"></a>

To use EQX-CmakeInterfaces in your project you should first clone the repo onto
your system. After that all you would need to do is setup your CMake project as
normal and `include(path/to/EQX-CMakeInterfaces/Interfaces.cmake)`.

Example ->
```cmake
# CMakeLists.txt
cmake_minimum_required(VERSION 3.28)

# Location of EQX-CMakeInterfaces relative to your project
include(EQX-CmakeInterfaces/Interfaces.cmake)

add_executable(Main)
target_sources(Main PRIVATE Main.cpp)

# Link your target to an EQX Interface
target_link_libraries(Main PRIVATE EQX-Typical)

set_target_properties(Main PROPERTIES
    CXX_EXTENSIONS Off
    EXPORT_COMPILE_COMMANDS On)
```

With EQX-Typical the compiler will have the following flags
- MSVC (Debug): /W4 /Zi /fsanitize=address
- MSVC (Release): /W4 /fp:fast /EHcs /GR- /O2t
- GCC/Clang: -Wall -Wextra -Wconversion -Wpedantic -g3 -fsanitize=address
-fsanitize=leak -fsanitize=undefined
