@echo on

:: remove all doubt where minizip comes from by removing vendored bits
rmdir \s \q src\kml\base\contrib\minizip

mkdir build
cd build

:: We're reusing the variable in CMake, which doesn't like backslashes
set LIBRARY_PREFIX="%LIBRARY_PREFIX:\=/%"

cmake -G Ninja ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DBUILD_TESTING=ON ^
    -DCMAKE_BUILD_TYPE=Release ^
    ..
if %ERRORLEVEL% neq 0 exit 1

cmake --build .
if %ERRORLEVEL% neq 0 exit 1

ctest --progress --output-on-failure
if %ERRORLEVEL% neq 0 exit 1

cmake --install .
if %ERRORLEVEL% neq 0 exit 1
