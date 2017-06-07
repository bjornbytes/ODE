cmake_minimum_required(VERSION 3.0.0)
project(ode C CXX)

# Options
option(ODE_BUILD_DEMOS "Build ODE demos" OFF)
option(ODE_BUILD_TESTS "Build ODE tests" OFF)
option(ODE_WITH_DIF_EXPORT "Build ODE with DIF export" OFF)
option(ODE_WITH_GIMPACT "Build ODE with GIMPACT instead of OPCODE for trimesh collisions (if enabled)" OFF)
option(ODE_WITH_LIBCCD "Build ODE with libccd for extra collision tests" OFF)
option(ODE_WITH_OU "Build ODE with OU for threaded collision tests" ON)
option(ODE_WITH_TRIMESH "Build ODE with trimesh shapes" ON)
option(ODE_BUILD_SHARED "Build a shared library for ODE" OFF)
option(ODE_DOUBLE_PRECISION "Build ODE with double precision math instead of single precision" OFF)

# Generated headers
include(CheckFunctionExists)
include(CheckIncludeFiles)

check_function_exists(alloca C_ALLOCA)
check_function_exists(clock_gettime HAVE_CLOCK_GETTIME)
check_function_exists(gettimeofday HAVE_GETTIMEOFDAY)
check_function_exists(isnan HAVE_ISNAN)
check_function_exists(isnanf HAVE_ISNANF)
check_function_exists(_isnan HAVE__ISNAN)
check_function_exists(_isnanf HAVE__ISNANF)
check_function_exists(pthread_attr_setstacklazy HAVE_PTHREAD_ATTR_SETSTACKLAZY)

check_include_files(alloca.h HAVE_ALLOCA_H)
check_include_files(malloc.h HAVE_MALLOC_H)
check_include_files(stdint.h HAVE_STDINT_H)
check_include_files(inttypes.h HAVE_INTTYPES_H)
check_include_files(sys/time.h HAVE_SYS_TIME_H)
check_include_files(unistd.h HAVE_UNISTD_H)

if(ODE_DOUBLE_PRECISION)
  set(ODE_PRECISION "dDOUBLE")
else()
  set(ODE_PRECISION "dSINGLE")
endif()

if(ODE_WITH_TRIMESH)
  set(dTRIMESH_ENABLED 1)
  if(ODE_WITH_GIMPACT)
    set(dTRIMESH_GIMPACT 1)
  else()
    set(dTRIMESH_OPCODE 1)
  endif()
endif()

if(ODE_WITH_OU)
  set(dOU_ENABLED 1)
  set(dTLS_ENABLED 1)
endif()

configure_file(ode/src/config.h.in "${CMAKE_CURRENT_BINARY_DIR}/ode/src/config.h")
configure_file(include/ode/version.h.in "${CMAKE_CURRENT_BINARY_DIR}/include/ode/version.h")
configure_file(include/ode/precision.h.in "${CMAKE_CURRENT_BINARY_DIR}/include/ode/precision.h")

# Demos
if(ODE_BUILD_DEMOS)
  #add_subdirectory(demos)
endif()

# Tests
if(ODE_BUILD_TESTS)
  #add_subdirectory(tests)
endif()

# OU
if(ODE_WITH_OU)
  if(APPLE)
    add_definitions(-DMAC_OS_X_VERSION=1030)
  endif()

  add_definitions(-D_OU_NAMESPACE=odeou)
  add_definitions(-DdATOMICS_ENABLED=1) # ?

  include_directories(ou/include)
  add_subdirectory(ou ou)
  set(ODE_SRC ${ODE_SRC} $<TARGET_OBJECTS:ou>)
endif()

include_directories(include ode/src "${CMAKE_CURRENT_BINARY_DIR}/ode/src" "${CMAKE_CURRENT_BINARY_DIR}/include")

# ODE
if(WIN32)
  if(ODE_BUILD_SHARED)
    add_definitions(ODE_DLL)
  else()
    add_definitions(ODE_LIB)
  endif()
endif()

set(ODE_SRC
  ${ODE_SRC}
  ode/src/nextafterf.c
  ode/src/array.cpp
  ode/src/box.cpp
  ode/src/capsule.cpp
  ode/src/array.cpp
  ode/src/box.cpp
  ode/src/capsule.cpp
  ode/src/collision_cylinder_box.cpp
  ode/src/collision_cylinder_plane.cpp
  ode/src/collision_cylinder_sphere.cpp
  ode/src/collision_kernel.cpp
  ode/src/collision_quadtreespace.cpp
  ode/src/collision_sapspace.cpp
  ode/src/collision_space.cpp
  ode/src/collision_transform.cpp
  ode/src/collision_trimesh_disabled.cpp
  ode/src/collision_util.cpp
  ode/src/convex.cpp
  ode/src/cylinder.cpp
  ode/src/error.cpp
  ode/src/heightfield.cpp
  ode/src/lcp.cpp
  ode/src/mass.cpp
  ode/src/mat.cpp
  ode/src/matrix.cpp
  ode/src/fastldlt.cpp
  ode/src/fastlsolve.cpp
  ode/src/fastltsolve.cpp
  ode/src/fastdot.cpp
  ode/src/memory.cpp
  ode/src/misc.cpp
  ode/src/objects.cpp
  ode/src/obstack.cpp
  ode/src/ode.cpp
  ode/src/odeou.cpp
  ode/src/odeinit.cpp
  ode/src/odemath.cpp
  ode/src/plane.cpp
  ode/src/quickstep.cpp
  ode/src/ray.cpp
  ode/src/rotation.cpp
  ode/src/sphere.cpp
  ode/src/step.cpp
  ode/src/timer.cpp
  ode/src/threading_base.cpp
  ode/src/threading_impl.cpp
  ode/src/threading_pool_posix.cpp
  ode/src/threading_pool_win.cpp
  ode/src/util.cpp

  ode/src/joints/amotor.cpp
  ode/src/joints/ball.cpp
  ode/src/joints/contact.cpp
  ode/src/joints/dball.cpp
  ode/src/joints/dhinge.cpp
  ode/src/joints/fixed.cpp
  ode/src/joints/hinge.cpp
  ode/src/joints/hinge2.cpp
  ode/src/joints/joint.cpp
  ode/src/joints/lmotor.cpp
  ode/src/joints/null.cpp
  ode/src/joints/piston.cpp
  ode/src/joints/plane2d.cpp
  ode/src/joints/pr.cpp
  ode/src/joints/pu.cpp
  ode/src/joints/slider.cpp
  ode/src/joints/transmission.cpp
  ode/src/joints/universal.cpp
)

if(ODE_WITH_DIF_EXPORT)
  set(ODE_SRC ${ODE_SRC} ode/src/export-dif.cpp)
endif()

if(ODE_WITH_TRIMESH)
  set(ODE_SRC ${ODE_SRC}
    ode/src/collision_trimesh_internal.cpp
    ode/src/collision_trimesh_box.cpp
    ode/src/collision_trimesh_ccylinder.cpp
    ode/src/collision_cylinder_trimesh.cpp
    ode/src/collision_trimesh_ray.cpp
    ode/src/collision_trimesh_sphere.cpp
    ode/src/collision_trimesh_trimesh.cpp
    ode/src/collision_trimesh_trimesh_old.cpp
    ode/src/collision_trimesh_plane.cpp
    ode/src/collision_convex_trimesh.cpp
  )

  if(ODE_WITH_GIMPACT)
    add_subdirectory(GIMPACT GIMPACT)
    include_directories(GIMPACT/include)
    set(ODE_SRC ${ODE_SRC} ode/src/gimpact_contact_export_helper.cpp ode/src/collision_trimesh_gimpact.cpp)
    set(ODE_SRC ${ODE_SRC} $<TARGET_OBJECTS:GIMPACT>)
  else()
    add_subdirectory(OPCODE OPCODE)
    include_directories(OPCODE)
    set(ODE_SRC ${ODE_SRC} ode/src/collision_trimesh_opcode.cpp)
    set(ODE_SRC ${ODE_SRC} $<TARGET_OBJECTS:OPCODE>)
  endif()
endif()

if(ODE_BUILD_SHARED)
  add_library(ode SHARED ${ODE_SRC})
else()
  add_library(ode STATIC ${ODE_SRC})
endif()
