rd /s /q build
mkdir build
cd build

cmake .. -G "Visual Studio 14 2015"
cmake --build .
cd ..