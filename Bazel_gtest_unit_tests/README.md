
# GTest with Bazel (QA Learning Setup)

This folder demonstrates running **Google Test unit tests using Bazel**.

## Structure
- src/        -> Production C++ code (same logic as CMake/GTest version)
- tests/      -> GTest unit tests
- WORKSPACE   -> Bazel dependencies
- .bazelrc    -> Remote cache configuration (optional)
- tools/      -> Helper scripts

## Prerequisites
- Bazel installed
- C++ compiler (gcc/clang/MSVC)

## Run tests
```
bazel test //tests:math_utils_test
```

## Windows (after pulling repo)
```
tools\run_tests.bat
```

## Remote Cache (CI / Team)
Edit `.bazelrc`:
```
build --remote_cache=http://your-cache:8080
test  --remote_cache=http://your-cache:8080
```

In CI (GitHub Actions), Bazel will reuse cached objects, speeding builds.

This setup is **interview-grade**: C++, GTest, Bazel, CI-ready.
