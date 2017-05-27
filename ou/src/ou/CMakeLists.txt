set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-exceptions -fno-rtti")
set(CMAKE_LD_FLAGS "${CMAKE_LD_FLAGS} -fno-exceptions -fno-rtti")

add_library(ou STATIC atomic.cpp customization.cpp malloc.cpp threadlocalstorage.cpp)
