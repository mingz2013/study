# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.2

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.2.3/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.2.3/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/zhaojm/.study/linux/test_03/44_cmake/04

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/zhaojm/.study/linux/test_03/44_cmake/04/build

# Include any dependencies generated for this target.
include libhello/CMakeFiles/libhello.dir/depend.make

# Include the progress variables for this target.
include libhello/CMakeFiles/libhello.dir/progress.make

# Include the compile flags for this target's objects.
include libhello/CMakeFiles/libhello.dir/flags.make

libhello/CMakeFiles/libhello.dir/hello.o: libhello/CMakeFiles/libhello.dir/flags.make
libhello/CMakeFiles/libhello.dir/hello.o: ../libhello/hello.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/zhaojm/.study/linux/test_03/44_cmake/04/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object libhello/CMakeFiles/libhello.dir/hello.o"
	cd /Users/zhaojm/.study/linux/test_03/44_cmake/04/build/libhello && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/libhello.dir/hello.o   -c /Users/zhaojm/.study/linux/test_03/44_cmake/04/libhello/hello.c

libhello/CMakeFiles/libhello.dir/hello.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libhello.dir/hello.i"
	cd /Users/zhaojm/.study/linux/test_03/44_cmake/04/build/libhello && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/zhaojm/.study/linux/test_03/44_cmake/04/libhello/hello.c > CMakeFiles/libhello.dir/hello.i

libhello/CMakeFiles/libhello.dir/hello.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libhello.dir/hello.s"
	cd /Users/zhaojm/.study/linux/test_03/44_cmake/04/build/libhello && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/zhaojm/.study/linux/test_03/44_cmake/04/libhello/hello.c -o CMakeFiles/libhello.dir/hello.s

libhello/CMakeFiles/libhello.dir/hello.o.requires:
.PHONY : libhello/CMakeFiles/libhello.dir/hello.o.requires

libhello/CMakeFiles/libhello.dir/hello.o.provides: libhello/CMakeFiles/libhello.dir/hello.o.requires
	$(MAKE) -f libhello/CMakeFiles/libhello.dir/build.make libhello/CMakeFiles/libhello.dir/hello.o.provides.build
.PHONY : libhello/CMakeFiles/libhello.dir/hello.o.provides

libhello/CMakeFiles/libhello.dir/hello.o.provides.build: libhello/CMakeFiles/libhello.dir/hello.o

# Object files for target libhello
libhello_OBJECTS = \
"CMakeFiles/libhello.dir/hello.o"

# External object files for target libhello
libhello_EXTERNAL_OBJECTS =

libhello/libhello.a: libhello/CMakeFiles/libhello.dir/hello.o
libhello/libhello.a: libhello/CMakeFiles/libhello.dir/build.make
libhello/libhello.a: libhello/CMakeFiles/libhello.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C static library libhello.a"
	cd /Users/zhaojm/.study/linux/test_03/44_cmake/04/build/libhello && $(CMAKE_COMMAND) -P CMakeFiles/libhello.dir/cmake_clean_target.cmake
	cd /Users/zhaojm/.study/linux/test_03/44_cmake/04/build/libhello && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/libhello.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libhello/CMakeFiles/libhello.dir/build: libhello/libhello.a
.PHONY : libhello/CMakeFiles/libhello.dir/build

libhello/CMakeFiles/libhello.dir/requires: libhello/CMakeFiles/libhello.dir/hello.o.requires
.PHONY : libhello/CMakeFiles/libhello.dir/requires

libhello/CMakeFiles/libhello.dir/clean:
	cd /Users/zhaojm/.study/linux/test_03/44_cmake/04/build/libhello && $(CMAKE_COMMAND) -P CMakeFiles/libhello.dir/cmake_clean.cmake
.PHONY : libhello/CMakeFiles/libhello.dir/clean

libhello/CMakeFiles/libhello.dir/depend:
	cd /Users/zhaojm/.study/linux/test_03/44_cmake/04/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/zhaojm/.study/linux/test_03/44_cmake/04 /Users/zhaojm/.study/linux/test_03/44_cmake/04/libhello /Users/zhaojm/.study/linux/test_03/44_cmake/04/build /Users/zhaojm/.study/linux/test_03/44_cmake/04/build/libhello /Users/zhaojm/.study/linux/test_03/44_cmake/04/build/libhello/CMakeFiles/libhello.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libhello/CMakeFiles/libhello.dir/depend
