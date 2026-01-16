
#include "gtest/gtest.h"
#include "math_utils.h"

TEST(MathUtilsTest, AddWorks) {
    EXPECT_EQ(add(2, 3), 5);
}
