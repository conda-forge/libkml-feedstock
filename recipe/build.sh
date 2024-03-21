#! /bin/bash
set -ex

# remove all doubt where minizip comes from by removing vendored bits
rm -rf ./src/kml/base/contrib/minizip

mkdir build
cd build

if [[ "${build_platform}" == "${target_platform}" ]]; then
    export CMAKE_ARGS="${CMAKE_ARGS} -DBUILD_TESTING=ON"
fi

cmake -G Ninja \
    ${CMAKE_ARGS} \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    ..

cmake --build .

if [[ "${build_platform}" == "${target_platform}" ]]; then
    DYLD_FALLBACK_LIBRARY_PATH=${PREFIX}/lib ctest --progress --output-on-failure
fi

cmake --install .
