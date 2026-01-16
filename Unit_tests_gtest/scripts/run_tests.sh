#!/usr/bin/env bash
set -e

echo "=============================="
echo " GTest Clean Build + Test Run "
echo "=============================="

ROOT_DIR=$(pwd)
BUILD_DIR=build
REPORT_DIR=reports/gtest

echo "Cleaning old output..."
rm -rf ${BUILD_DIR} reports

echo "Creating directories..."
mkdir -p ${BUILD_DIR} ${REPORT_DIR}

cd ${BUILD_DIR}

echo "Configuring CMake..."
cmake .. -DCMAKE_BUILD_TYPE=Debug

echo "Building..."
cmake --build .

echo "Running tests..."
ctest --output-on-failure

echo "Generating coverage report..."
gcovr \
  --root .. \
  --xml-pretty \
  --output ../${REPORT_DIR}/coverage.xml

echo "✅ GTest + Coverage completed"
