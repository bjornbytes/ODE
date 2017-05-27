include_directories(${CMAKE_CURRENT_PROJECT_DIR})

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D__ODE__")

set(ODE_SRC
  nextafterf.c
  array.cpp
  box.cpp
  capsule.cpp
  array.cpp
  box.cpp
  capsule.cpp
  collision_cylinder_box.cpp
  collision_cylinder_plane.cpp
  collision_cylinder_sphere.cpp
  collision_kernel.cpp
  collision_quadtreespace.cpp
  collision_sapspace.cpp
  collision_space.cpp
  collision_transform.cpp
  collision_trimesh_disabled.cpp
  collision_util.cpp
  convex.cpp
  cylinder.cpp
  error.cpp
  export-dif.cpp
  heightfield.cpp
  lcp.cpp
  mass.cpp
  mat.cpp
  matrix.cpp
  fastldlt.cpp
  fastlsolve.cpp
  fastltsolve.cpp
  fastdot.cpp
  memory.cpp
  misc.cpp
  objects.cpp
  obstack.cpp
  ode.cpp
  odeou.cpp
  odeinit.cpp
  odemath.cpp
  plane.cpp
  quickstep.cpp
  ray.cpp
  rotation.cpp
  sphere.cpp
  step.cpp
  timer.cpp
  threading_base.cpp
  threading_impl.cpp
  threading_pool_posix.cpp
  threading_pool_win.cpp
  util.cpp

  joints/amotor.cpp
  joints/ball.cpp
  joints/contact.cpp
  joints/dball.cpp
  joints/dhinge.cpp
  joints/fixed.cpp
  joints/hinge.cpp
  joints/hinge2.cpp
  joints/joint.cpp
  joints/lmotor.cpp
  joints/null.cpp
  joints/piston.cpp
  joints/plane2d.cpp
  joints/pr.cpp
  joints/pu.cpp
  joints/slider.cpp
  joints/transmission.cpp
  joints/universal.cpp
)

add_library(ode STATIC ${ODE_SRC})

set(CMAKE_INCLUDE_CURRENT_DIR ON)

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

configure_file(config.h.in "${CMAKE_CURRENT_BINARY_DIR}/config.h")

target_link_libraries(ode ou)
