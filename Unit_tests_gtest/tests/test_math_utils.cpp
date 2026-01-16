#include <gtest/gtest.h>
extern "C" {
#include "math_utils.h"
}

TEST(MathUtilsTest, AddTwoNumbers) {
    EXPECT_EQ(add(2, 3), 5);
}

TEST(MathUtilsTest, AddNegativeNumbers) {
    EXPECT_EQ(add(-2, -3), -5);
}
