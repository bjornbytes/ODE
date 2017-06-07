cmake_minimum_required(VERSION 3.0.0)
project(OPCODE)

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

set(OPCODE_SRC
  OPC_AABBCollider.cpp
  OPC_AABBTree.cpp
  OPC_BaseModel.cpp
  OPC_Collider.cpp
  OPC_Common.cpp
  OPC_HybridModel.cpp
  OPC_LSSCollider.cpp
  OPC_MeshInterface.cpp
  OPC_Model.cpp
  OPC_OBBCollider.cpp
  OPC_OptimizedTree.cpp
  OPC_Picking.cpp
  OPC_PlanesCollider.cpp
  OPC_RayCollider.cpp
  OPC_SphereCollider.cpp
  OPC_TreeBuilders.cpp
  OPC_TreeCollider.cpp
  OPC_VolumeCollider.cpp
  Opcode.cpp
  StdAfx.cpp

  Ice/IceAABB.cpp
  Ice/IceContainer.cpp
  Ice/IceHPoint.cpp
  Ice/IceIndexedTriangle.cpp
  Ice/IceMatrix3x3.cpp
  Ice/IceMatrix4x4.cpp
  Ice/IceOBB.cpp
  Ice/IcePlane.cpp
  Ice/IcePoint.cpp
  Ice/IceRandom.cpp
  Ice/IceRay.cpp
  Ice/IceRevisitedRadix.cpp
  Ice/IceSegment.cpp
  Ice/IceTriangle.cpp
  Ice/IceUtils.cpp
)

add_library(OPCODE OBJECT ${OPCODE_SRC})
