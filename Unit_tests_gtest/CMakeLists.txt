cmake_minimum_required(VERSION 3.10)
project(UnitTests)

set(CMAKE_CXX_STANDARD 14)
enable_testing()

include_directories(include)

add_executable(runUnitTests
    src/math_utils.c
    tests/test_math_utils.cpp
)

find_package(GTest REQUIRED)
target_link_libraries(runUnitTests GTest::GTest GTest::Main pthread)

add_test(NAME UnitTests COMMAND runUnitTests)
