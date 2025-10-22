@echo on

mkdir build
cd build

cmake -G "NMake Makefiles" ^
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DBUILD_TESTING=ON ^
    -DCMAKE_BUILD_TYPE=Release ^
    ..
if %ERRORLEVEL% neq 0 exit 1

cmake --build .
if %ERRORLEVEL% neq 0 exit 1

ctest --progress --output-on-failure
if %ERRORLEVEL% neq 0 exit 1

nmake install
if %ERRORLEVEL% neq 0 exit 1
