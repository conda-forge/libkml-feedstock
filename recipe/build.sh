#! /bin/bash
set -ex

mkdir build
cd build

cmake ${CMAKE_ARGS} \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    ..

cmake --build .

if [[ "${build_platform}" == "${target_platform}" ]]; then
    ctest --progress --output-on-failure
fi
make install -j $CPU_COUNT
