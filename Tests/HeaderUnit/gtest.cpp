// gtest.cpp

import <gtest.hpp>;

#ifndef CMAKE_TARGET_NAME
static_assert(false, "CMAKE_TARGET_NAME not defined!");
#endif // CMAKE_TARGET_NAME

TEST(CMAKE_TARGET_NAME, Basic)
{
    EXPECT_EQ(1, 1);
}
