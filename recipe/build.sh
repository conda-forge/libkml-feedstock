mkdir build && cd build
cmake ${CMAKE_ARGS} -D CMAKE_INSTALL_PREFIX=$PREFIX \
      $SRC_DIR
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
ctest
fi
make install -j $CPU_COUNT
