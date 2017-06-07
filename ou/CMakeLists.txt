cmake_minimum_required(VERSION 3.0.0)
project(ou)

include_directories(include)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-exceptions -fno-rtti")
set(CMAKE_LD_FLAGS "${CMAKE_LD_FLAGS} -fno-exceptions -fno-rtti")

set(OU_SRC
  src/ou/atomic.cpp
  src/ou/customization.cpp
  src/ou/malloc.cpp
  src/ou/threadlocalstorage.cpp
)

add_library(ou OBJECT ${OU_SRC})
