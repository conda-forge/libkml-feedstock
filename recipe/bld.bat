@echo on

mkdir build
cd build

cmake -G "NMake Makefiles" ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_BUILD_TYPE=Release ^
    ..
if %ERRORLEVEL% neq 0 exit 1

cmake --build .
if %ERRORLEVEL% neq 0 exit 1

ctest --progress --output-on-failure
if %ERRORLEVEL% neq 0 exit 1

nmake install
if %ERRORLEVEL% neq 0 exit 1
