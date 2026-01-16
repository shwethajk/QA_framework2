#!/usr/bin/env bash
set -e

echo "=================================="
echo " GTest Clean Build + Coverage Run "
echo "=================================="

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
BUILD_DIR="$ROOT_DIR/build"
REPORT_DIR="$ROOT_DIR/reports/gtest"

echo "Cleaning previous build and reports..."
rm -rf "$BUILD_DIR"
rm -rf "$ROOT_DIR/reports"

echo "Creating fresh directories..."
mkdir -p "$BUILD_DIR"
mkdir -p "$REPORT_DIR"

cd "$BUILD_DIR"

echo "Configuring CMake..."
cmake .. -DCMAKE_BUILD_TYPE=Debug

echo "Building tests..."
cmake --build .

echo "Running tests..."
ctest --output-on-failure

echo "Generating coverage report..."
gcovr \
  --root "$ROOT_DIR" \
  --xml-pretty \
  --output "$REPORT_DIR/coverage.xml"

echo "=================================="
echo " ✅ Tests passed & reports created "
echo " 📁 reports/gtest/coverage.xml"
echo "=================================="
