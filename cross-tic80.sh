#!/bin/bash

# install the toolchain from:
# https://github.com/shauninman/union-rg35xxplus-toolchain/tree/3dceb6e6de1db7398fe9bbe9db3086cc0055eada

readonly TOOLCHAIN_HOST="/opt/rg35xxplus-toolchain/usr"
readonly TOOLCHAIN_TARGET="/opt/rg35xxplus-toolchain/usr/arm-buildroot-linux-gnueabihf/sysroot/usr"

export PATH="$TOOLCHAIN_HOST/bin:$PATH"
export LD_LIBRARY_PATH="$TOOLCHAIN_HOST/lib:$LD_LIBRARY_PATH"

TIC80_GIT="`dirname $0`/TIC-80"

if [ ! -d "$TIC80_GIT" ]; then
    git clone https://github.com/nesbox/TIC-80.git "$TIC80_GIT"
    cd "$TIC80_GIT"
    git checkout 7e40e849ab3ff26ae29121e2ffb898940488ca16
    git submodule update --init --recursive
    cd ".."
fi

cd "$TIC80_GIT"

# clean build
if [ -d "./build" ]; then
    rm -r "./build"
fi
git reset --hard
git checkout 7e40e849ab3ff26ae29121e2ffb898940488ca16
git submodule update --init --recursive

# fix pocketpy std
cd "./vendor/pocketpy"
git reset --hard
readonly PPY_COMMON_H="./include/pocketpy/common.h"
sed -i -e 's/namespace std = ::std/\/\/ namespace std = ::std/' "$PPY_COMMON_H"
cd "../../"

cd "./build"

# clear cmake
if [ -d "./CMakeFiles" ]; then
    rm -r "./CMakeFiles"
fi

# cmake
cmake .. -DCMAKE_TOOLCHAIN_FILE="../../toolchain.cmake" -DBUILD_STATIC=ON -DBUILD_LIBRETRO=ON \
    -DBUILD_PLAYER=OFF -DBUILD_TOOLS=OFF -DBUILD_SOKOL=OFF -DBUILD_SDL=OFF -DBUILD_DEMO_CARTS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_WITH_ALL=ON \
    -DBUILD_WITH_LUA=ON \
    -DBUILD_WITH_MOON=ON \
    -DBUILD_WITH_FENNEL=ON \
    -DBUILD_WITH_WREN=ON \
    -DBUILD_WITH_MRUBY=ON \
    -DBUILD_WITH_WASM=ON \
    -DBUILD_WITH_SCHEME=ON \
    -DBUILD_WITH_SQUIRREL=ON \
    -DBUILD_WITH_PYTHON=ON \
    -DBUILD_WITH_JS=ON \
    -DBUILD_WITH_JANET=ON \
    -DUSE_NAETT=FALSE

# make
make clean
make -j6
# make -j6 > log.txt 2>&1
echo
echo "tic80_libretro.so: $TIC80_GIT/build/bin/tic80_libretro.so"

echo `which make`
