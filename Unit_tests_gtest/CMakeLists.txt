cmake_minimum_required(VERSION 3.10)
project(UnitTests)

set(CMAKE_CXX_STANDARD 14)

enable_testing()

add_executable(math_utils_test
    tests/math_utils_test.cpp
    src/math_utils.cpp
)

target_link_libraries(math_utils_test gtest gtest_main)

add_test(
    NAME math_utils_test
    COMMAND math_utils_test
)


find_package(GTest REQUIRED)
target_link_libraries(runUnitTests GTest::GTest GTest::Main pthread)

add_test(NAME UnitTests COMMAND runUnitTests)
