cmake_minimum_required(VERSION 3.10)

# set the project name
project(Tutorial VERSION 1.0)
message("Your C++ compiler supports these C++ features:")

foreach(i ${CMAKE_CXX_COMPILE_FEATURES})

  message("${i}")

endforeach()
