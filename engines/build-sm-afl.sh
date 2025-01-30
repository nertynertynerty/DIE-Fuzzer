#!/bin/bash

rm -rf gecko-dev/js/src/build_OPT/Debug

pushd gecko-dev/js/src

export CC="$PWD/../fuzz/afl/afl-clang-fast"
export CXX="$PWD/../fuzz/afl/afl-clang-fast++"

mkdir "build_OPT"
pushd "build_OPT"

BUILD="Debug"
mkdir $BUILD
pushd $BUILD

../../configure --enable-debug --enable-jit --disable-tests
make -j$(nproc)
popd