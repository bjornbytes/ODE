set(ODE_PRECISION dSINGLE)
set(ODE_VERSION 0.15.0)

configure_file(precision.h.in "${CMAKE_CURRENT_BINARY_DIR}/precision.h")
configure_file(version.h.in "${CMAKE_CURRENT_BINARY_DIR}/version.h")
