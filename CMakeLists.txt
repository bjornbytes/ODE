cmake_minimum_required(VERSION 3.0.0)
project(ode C CXX)

include_directories(include)

if(TRUE)
  if(APPLE)
    add_definitions(-DMAC_OS_X_VERSION=1030)
  endif()

  add_definitions(-DdOU_ENABLED=1)
  add_definitions(-DdATOMICS_ENABLED=1)
  add_definitions(-D_OU_NAMESPACE=odeou)

  include_directories(ou/include)
  add_subdirectory(ou ou)
endif()

add_subdirectory(ode)
