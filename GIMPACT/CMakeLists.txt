cmake_minimum_required(VERSION 3.0.0)
project(GIMPACT)

include_directories(include)

set(GIMPACT_SRC
  src/gim_boxpruning.cpp
  src/gim_contact.cpp
  src/gim_math.cpp
  src/gim_memory.cpp
  src/gim_tri_tri_overlap.cpp
  src/gim_trimesh.cpp
  src/gim_trimesh_capsule_collision.cpp
  src/gim_trimesh_ray_collision.cpp
  src/gim_trimesh_sphere_collision.cpp
  src/gim_trimesh_trimesh_collision.cpp
  src/gimpact.cpp
)

add_library(GIMPACT OBJECT ${GIMPACT_SRC})
