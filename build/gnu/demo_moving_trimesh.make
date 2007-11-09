# C++ Console Executable Makefile autogenerated by premake
# Don't edit this file! Instead edit `premake.lua` then rerun `make`

ifndef CONFIG
  CONFIG=DebugDLL
endif

ifeq ($(CONFIG),DebugDLL)
  BINDIR := ../../lib/DebugDLL
  LIBDIR := ../../lib/DebugDLL
  OBJDIR := obj/moving_trimesh/DebugDLL
  OUTDIR := ../../lib/DebugDLL
  CPPFLAGS := -MMD -D "_CRT_SECURE_NO_DEPRECATE" -D "WIN32" -I "../../include"
  CFLAGS += $(CPPFLAGS) $(TARGET_ARCH) -g
  CXXFLAGS := $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR) -lode -ldrawstuff -luser32 -lwinmm -lgdi32 -lopengl32 -lglu32
  LDDEPS := ../../lib/DebugDLL/ode.dll ../../lib/DebugDLL/drawstuff.dll
  RESFLAGS := -D "_CRT_SECURE_NO_DEPRECATE" -D "WIN32" -I "../../include"
  TARGET := demo_moving_trimesh.exe
  BLDCMD = $(CXX) -o $(OUTDIR)/$(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(TARGET_ARCH)
endif

ifeq ($(CONFIG),ReleaseDLL)
  BINDIR := ../../lib/ReleaseDLL
  LIBDIR := ../../lib/ReleaseDLL
  OBJDIR := obj/moving_trimesh/ReleaseDLL
  OUTDIR := ../../lib/ReleaseDLL
  CPPFLAGS := -MMD -D "_CRT_SECURE_NO_DEPRECATE" -D "WIN32" -I "../../include"
  CFLAGS += $(CPPFLAGS) $(TARGET_ARCH) -g
  CXXFLAGS := $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR) -lode -ldrawstuff -luser32 -lwinmm -lgdi32 -lopengl32 -lglu32
  LDDEPS := ../../lib/ReleaseDLL/ode.dll ../../lib/ReleaseDLL/drawstuff.dll
  RESFLAGS := -D "_CRT_SECURE_NO_DEPRECATE" -D "WIN32" -I "../../include"
  TARGET := demo_moving_trimesh.exe
  BLDCMD = $(CXX) -o $(OUTDIR)/$(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(TARGET_ARCH)
endif

ifeq ($(CONFIG),DebugLib)
  BINDIR := ../../lib/DebugLib
  LIBDIR := ../../lib/DebugLib
  OBJDIR := obj/moving_trimesh/DebugLib
  OUTDIR := ../../lib/DebugLib
  CPPFLAGS := -MMD -D "_CRT_SECURE_NO_DEPRECATE" -D "WIN32" -I "../../include"
  CFLAGS += $(CPPFLAGS) $(TARGET_ARCH) -g
  CXXFLAGS := $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR) -lode -ldrawstuff -luser32 -lwinmm -lgdi32 -lopengl32 -lglu32
  LDDEPS := ../../lib/DebugLib/libode.a ../../lib/DebugLib/libdrawstuff.a
  RESFLAGS := -D "_CRT_SECURE_NO_DEPRECATE" -D "WIN32" -I "../../include"
  TARGET := demo_moving_trimesh.exe
  BLDCMD = $(CXX) -o $(OUTDIR)/$(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(TARGET_ARCH)
endif

ifeq ($(CONFIG),ReleaseLib)
  BINDIR := ../../lib/ReleaseLib
  LIBDIR := ../../lib/ReleaseLib
  OBJDIR := obj/moving_trimesh/ReleaseLib
  OUTDIR := ../../lib/ReleaseLib
  CPPFLAGS := -MMD -D "_CRT_SECURE_NO_DEPRECATE" -D "WIN32" -I "../../include"
  CFLAGS += $(CPPFLAGS) $(TARGET_ARCH) -g
  CXXFLAGS := $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR) -lode -ldrawstuff -luser32 -lwinmm -lgdi32 -lopengl32 -lglu32
  LDDEPS := ../../lib/ReleaseLib/libode.a ../../lib/ReleaseLib/libdrawstuff.a
  RESFLAGS := -D "_CRT_SECURE_NO_DEPRECATE" -D "WIN32" -I "../../include"
  TARGET := demo_moving_trimesh.exe
  BLDCMD = $(CXX) -o $(OUTDIR)/$(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(TARGET_ARCH)
endif

OBJECTS := \
	$(OBJDIR)/demo_moving_trimesh.o \

RESOURCES := \
	$(OBJDIR)/resources.res \

MKDIR_TYPE := msdos
CMD := $(subst \,\\,$(ComSpec)$(COMSPEC))
ifeq (,$(CMD))
  MKDIR_TYPE := posix
endif
ifeq (/bin/sh.exe,$(SHELL))
  MKDIR_TYPE := posix
endif
ifeq ($(MKDIR_TYPE),posix)
  CMD_MKBINDIR := mkdir -p $(BINDIR)
  CMD_MKLIBDIR := mkdir -p $(LIBDIR)
  CMD_MKOUTDIR := mkdir -p $(OUTDIR)
  CMD_MKOBJDIR := mkdir -p $(OBJDIR)
else
  CMD_MKBINDIR := $(CMD) /c if not exist $(subst /,\\,$(BINDIR)) mkdir $(subst /,\\,$(BINDIR))
  CMD_MKLIBDIR := $(CMD) /c if not exist $(subst /,\\,$(LIBDIR)) mkdir $(subst /,\\,$(LIBDIR))
  CMD_MKOUTDIR := $(CMD) /c if not exist $(subst /,\\,$(OUTDIR)) mkdir $(subst /,\\,$(OUTDIR))
  CMD_MKOBJDIR := $(CMD) /c if not exist $(subst /,\\,$(OBJDIR)) mkdir $(subst /,\\,$(OBJDIR))
endif

.PHONY: clean

$(OUTDIR)/$(TARGET): $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking demo_moving_trimesh
	-@$(CMD_MKBINDIR)
	-@$(CMD_MKLIBDIR)
	-@$(CMD_MKOUTDIR)
	@$(BLDCMD)

clean:
	@echo Cleaning demo_moving_trimesh
ifeq ($(MKDIR_TYPE),posix)
	-@rm -f $(OUTDIR)/$(TARGET)
	-@rm -rf $(OBJDIR)
else
	-@if exist $(subst /,\,$(OUTDIR)/$(TARGET)) del /q $(subst /,\,$(OUTDIR)/$(TARGET))
	-@if exist $(subst /,\,$(OBJDIR)) del /q $(subst /,\,$(OBJDIR))
	-@if exist $(subst /,\,$(OBJDIR)) rmdir /s /q $(subst /,\,$(OBJDIR))
endif

$(OBJDIR)/demo_moving_trimesh.o: ../../ode/demo/demo_moving_trimesh.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/resources.res: ../../drawstuff/src/resources.rc
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@windres $< -O coff -o $@ $(RESFLAGS)

-include $(OBJECTS:%.o=%.d)

