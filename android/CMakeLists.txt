cmake_minimum_required(VERSION 3.4.1)
set(CMAKE_CXX_STANDARD 17)

add_library(
    ndk_asset_manager_example
    SHARED
    ./src/main/cpp/plugin.cpp)

find_library(
          # Sets the name of the path variable.
          android-lib

          # Specifies the name of the NDK library that
          # you want CMake to locate.
          android)

target_link_libraries(ndk_asset_manager_example ${android-lib} log)

