#!/bin/bash
set -e

echo "=============================="
echo " GTest Clean Build + Test Run "
echo "=============================="

ROOT_DIR=$(pwd)
BUILD_DIR=build
REPORT_DIR=reports/gtest

echo "Cleaning old build and reports..."
rm -rf $BUILD_DIR
rm -rf reports

echo "Creating build directory..."
mkdir -p $BUILD_DIR
mkdir -p $REPORT_DIR

cd $BUILD_DIR

echo "Configuring CMake..."
cmake ..

echo "Building..."
make -j$(nproc)

echo "Running tests..."
ctest --output-on-failure

echo "Generating coverage report..."
gcovr \
  --root .. \
  --xml-pretty \
  --output ../$REPORT_DIR/coverage.xml

echo "Reports generated at: $REPORT_DIR"
