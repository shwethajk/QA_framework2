cmake_minimum_required(VERSION 3.16)
project(math_utils_tests LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# ----------------------------
# Enable coverage
# ----------------------------
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
  add_compile_options(--coverage)
  add_link_options(--coverage)
endif()

# ----------------------------
# Fetch GoogleTest
# ----------------------------
include(FetchContent)

FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/refs/tags/v1.14.0.zip
)

set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

# ----------------------------
# Test executable
# ----------------------------
add_executable(math_utils_test
  tests/math_utils_test.cpp
  src/math_utils.cpp
)

target_include_directories(math_utils_test PRIVATE src)

target_link_libraries(math_utils_test
  gtest
  gtest_main
)

# ----------------------------
# Enable CTest
# ----------------------------
enable_testing()
add_test(NAME math_utils_test COMMAND math_utils_test)
