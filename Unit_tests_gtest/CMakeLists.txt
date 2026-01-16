cmake_minimum_required(VERSION 3.15)
project(BazelGTestExample LANGUAGES C CXX)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Enable coverage
if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
  add_compile_options(--coverage -O0 -g)
  add_link_options(--coverage)
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O0 -g -fprofile-arcs -ftest-coverage")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O0 -g -fprofile-arcs -ftest-coverage")


# -------------------------
# Fetch GoogleTest
# -------------------------
include(FetchContent)

FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/refs/tags/v1.14.0.zip
)

FetchContent_MakeAvailable(googletest)

enable_testing()

include_directories(
  ${PROJECT_SOURCE_DIR}/include
)

# -------------------------
# Test executable
# -------------------------
add_executable(math_utils_test
  src/math_utils.c
  tests/test_math_utils.cpp
)

target_link_libraries(math_utils_test
  gtest
  gtest_main
)

include(GoogleTest)
gtest_discover_tests(math_utils_test)
