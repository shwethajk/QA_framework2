#!/usr/bin/env bash
set -e

echo "=============================="
echo " GTest Clean Build + Test Run "
echo "=============================="

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUTPUT_DIR="$ROOT_DIR/output"
BUILD_DIR="$OUTPUT_DIR/build"
REPORT_DIR="$OUTPUT_DIR/reports"

echo "Cleaning old output..."
rm -rf "$OUTPUT_DIR"

echo "Creating directories..."
mkdir -p "$BUILD_DIR" "$REPORT_DIR"

echo "Configuring CMake..."
cd "$BUILD_DIR"
cmake "$ROOT_DIR"

echo "Building project..."
cmake --build .

echo "Running tests..."
ctest --output-on-failure \
      --test-output-junit "$REPORT_DIR/gtest-report.xml"

echo "=============================="
echo " Done"
echo " Report: $REPORT_DIR/gtest-report.xml"
echo "=============================="
