#!/bin/bash
set -e

echo "===== GTest + CMake + HTML Coverage ====="

ROOT_DIR=$(pwd)
BUILD_DIR=build
REPORT_DIR=reports/html

echo "Cleaning old build and reports..."
rm -rf $BUILD_DIR reports

echo "Creating build and report directories..."
mkdir -p $BUILD_DIR
mkdir -p $REPORT_DIR

cd $BUILD_DIR

echo "Configuring CMake with coverage flags..."
cmake .. \
  -DCMAKE_C_FLAGS="--coverage -O0 -g" \
  -DCMAKE_CXX_FLAGS="--coverage -O0 -g"

echo "Building..."
make -j$(nproc)

echo "Running tests..."
ctest --output-on-failure

echo "Generating HTML coverage report..."
cd ..

gcovr \
  -r . \
  --html \
  --html-details \
  --exclude '_deps' \
  --exclude 'tests' \
  -o reports/html/index.html

echo "✅ Coverage HTML generated at:"
echo "$(pwd)/reports/html/index.html"

ls -l reports/html
