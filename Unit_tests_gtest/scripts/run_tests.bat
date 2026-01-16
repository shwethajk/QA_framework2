#!/usr/bin/env bash
set -e

echo "=== CLEAN BUILD ==="
rm -rf reports
mkdir -p reports/{bazel,gtest,ui}

#######################################
# Bazel GTest
#######################################
echo "=== Running Bazel unit tests ==="
cd Bazel_gtest_unit_tests

bazel test //tests:math_utils_test \
  --test_output=all \
  --combined_report=../reports/bazel/test.log

cd ..

#######################################
# CMake + GTest
#######################################
echo "=== Running CMake GTest ==="
cd Unit_tests_gtest

rm -rf build
mkdir build && cd build

cmake -DCMAKE_BUILD_TYPE=Debug \
      -DCMAKE_CXX_FLAGS="--coverage" \
      ..

make -j$(nproc)
ctest --output-on-failure

# Coverage
gcovr \
  --root .. \
  --xml ../reports/gtest/coverage.xml \
  --html ../reports/gtest/coverage.html \
  --html-details

cd ../..

#######################################
# UI Tests (Selenium + TestNG)
#######################################
echo "=== Running UI tests ==="
cd UI_Tests

mvn clean test \
  -Dsurefire.reportFormat=xml \
  -Dsurefire.useFile=true

cp -r target/surefire-reports ../reports/ui/

cd ..

echo "=== ALL TESTS COMPLETED ==="
