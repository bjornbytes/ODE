// lovr: version of config.h that doesn't require autotools/cmake function/include checks
#ifndef ODE_CONFIG_H
#define ODE_CONFIG_H

#ifndef __has_include
#error "__has_include is not supported by this compiler; consider using autotools/cmake instead"
#endif

#if __has_include(<alloca.h>)
#include <alloca.h>
#endif

#if __has_include(<malloc.h>)
#include <malloc.h>
#endif

#if __has_include(<stdint.h>)
#include <stdint.h>
#endif

#if __has_include(<inttypes.h>)
#include <inttypes.h>
#endif

#ifdef dSINGLE
#define dEpsilon FLT_EPSILON
#else
#define dEpsilon DBL_EPSILON
#endif

// Sorry
#if _WIN32
#define HAVE__ISNAN
#define HAVE__ISNANF
#else
#define HAVE_CLOCK_GETTIME
#define HAVE_GGETTIMEOFDAY
#define HAVE_ISNAN
#define HAVE_ISNANF
#endif

#define dTRIMESH_ENABLED 1
#define dTRIMESH_OPCODE 1
#define dOU_ENABLED 1
#define dTLS_ENABLED 1

#include "typedefs.h"

#endif
