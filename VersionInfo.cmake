# VersionInfo.cmake

add_library(Eqx_VersionInfo INTERFACE)
target_compile_definitions(Eqx_VersionInfo INTERFACE
    EQX_PROJECT_VERSION=\"${PROJECT_VERSION}\" EQX_CONFIG=\"$<CONFIG>\")
