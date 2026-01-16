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

echo "Creating build and report directories..."
mkdir -p $BUILD_DIR
mkdir -p $REPORT_DIR

cd $BUILD_DIR

echo "Configuring CMake..."
cmake .. -DCMAKE_CXX_FLAGS="--coverage -O0 -g" -DCMAKE_C_FLAGS="--coverage -O0 -g"

echo "Building..."
make -j$(nproc)

echo "Running tests..."
ctest --output-on-failure

echo "Generating coverage report..."
cd $ROOT_DIR/$REPORT_DIR   # move to the report folder
gcovr -r $ROOT_DIR --xml-pretty -o coverage.xml -v

if [ -f coverage.xml ]; then
    echo "Coverage report successfully created at $(pwd)/coverage.xml"
else
    echo "Error: coverage.xml not generated!"
    exit 1
fi
