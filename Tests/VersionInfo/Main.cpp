// Main.cpp

#include <gtest/gtest.h>

#ifndef CMAKE_TARGET_NAME
static_assert(false, "CMAKE_TARGET_NAME not defined!");
#endif // CMAKE_TARGET_NAME

TEST(CMAKE_TARGET_NAME, Basic)
{
#ifndef EQX_PROJECT_VERSION
    GTEST_FAIL() << "EQX_PROJECT_VERSION is not defined";
#else
    SUCCEED() << "EQX_PROJECT_VERSION is defined";
#endif // EQX_PROJECT_VERSION

#ifndef EQX_CONFIG
    GTEST_FAIL() << "EQX_CONFIG is not defined";
#else
    SUCCEED() << "EQX_CONFIG is defined";
#endif // EQX_CONFIG

#ifndef EXPECTED_VERSION
    GTEST_FAIL() << "EXPECTED_VERSION is not defined";
#else
    SUCCEED() << "EXPECTED_VERSION is defined";
#endif // EXPECTED_VERSION

#ifndef EXPECTED_CONFIG
    GTEST_FAIL() << "EXPECTED_CONFIG is not defined";
#else
    SUCCEED() << "EXPECTED_CONFIG is defined";
#endif // EXPECTED_VERSION

#if defined(EQX_PROJECT_VERSION) && defined(EXPECTED_VERSION)
    EXPECT_STREQ(EQX_PROJECT_VERSION, EXPECTED_VERSION);
#else
    GTEST_FAIL() << "project versions not defined";
#endif

#if defined(EQX_CONFIG) && defined(EXPECTED_CONFIG)
    EXPECT_STREQ(EQX_CONFIG, EXPECTED_CONFIG);
#else
    GTEST_FAIL() << "configs not defined";
#endif

}
