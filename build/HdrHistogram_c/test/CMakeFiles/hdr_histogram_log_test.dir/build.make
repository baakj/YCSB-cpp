# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/micron/YCSB-cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/micron/YCSB-cpp/build

# Include any dependencies generated for this target.
include HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/compiler_depend.make

# Include the progress variables for this target.
include HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/progress.make

# Include the compile flags for this target's objects.
include HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/flags.make

HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/hdr_histogram_log_test.c.o: HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/flags.make
HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/hdr_histogram_log_test.c.o: ../HdrHistogram_c/test/hdr_histogram_log_test.c
HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/hdr_histogram_log_test.c.o: HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/micron/YCSB-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/hdr_histogram_log_test.c.o"
	cd /home/micron/YCSB-cpp/build/HdrHistogram_c/test && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/hdr_histogram_log_test.c.o -MF CMakeFiles/hdr_histogram_log_test.dir/hdr_histogram_log_test.c.o.d -o CMakeFiles/hdr_histogram_log_test.dir/hdr_histogram_log_test.c.o -c /home/micron/YCSB-cpp/HdrHistogram_c/test/hdr_histogram_log_test.c

HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/hdr_histogram_log_test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hdr_histogram_log_test.dir/hdr_histogram_log_test.c.i"
	cd /home/micron/YCSB-cpp/build/HdrHistogram_c/test && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/micron/YCSB-cpp/HdrHistogram_c/test/hdr_histogram_log_test.c > CMakeFiles/hdr_histogram_log_test.dir/hdr_histogram_log_test.c.i

HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/hdr_histogram_log_test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hdr_histogram_log_test.dir/hdr_histogram_log_test.c.s"
	cd /home/micron/YCSB-cpp/build/HdrHistogram_c/test && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/micron/YCSB-cpp/HdrHistogram_c/test/hdr_histogram_log_test.c -o CMakeFiles/hdr_histogram_log_test.dir/hdr_histogram_log_test.c.s

HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/minunit.c.o: HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/flags.make
HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/minunit.c.o: ../HdrHistogram_c/test/minunit.c
HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/minunit.c.o: HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/micron/YCSB-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/minunit.c.o"
	cd /home/micron/YCSB-cpp/build/HdrHistogram_c/test && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/minunit.c.o -MF CMakeFiles/hdr_histogram_log_test.dir/minunit.c.o.d -o CMakeFiles/hdr_histogram_log_test.dir/minunit.c.o -c /home/micron/YCSB-cpp/HdrHistogram_c/test/minunit.c

HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/minunit.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hdr_histogram_log_test.dir/minunit.c.i"
	cd /home/micron/YCSB-cpp/build/HdrHistogram_c/test && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/micron/YCSB-cpp/HdrHistogram_c/test/minunit.c > CMakeFiles/hdr_histogram_log_test.dir/minunit.c.i

HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/minunit.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hdr_histogram_log_test.dir/minunit.c.s"
	cd /home/micron/YCSB-cpp/build/HdrHistogram_c/test && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/micron/YCSB-cpp/HdrHistogram_c/test/minunit.c -o CMakeFiles/hdr_histogram_log_test.dir/minunit.c.s

# Object files for target hdr_histogram_log_test
hdr_histogram_log_test_OBJECTS = \
"CMakeFiles/hdr_histogram_log_test.dir/hdr_histogram_log_test.c.o" \
"CMakeFiles/hdr_histogram_log_test.dir/minunit.c.o"

# External object files for target hdr_histogram_log_test
hdr_histogram_log_test_EXTERNAL_OBJECTS =

HdrHistogram_c/test/hdr_histogram_log_test: HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/hdr_histogram_log_test.c.o
HdrHistogram_c/test/hdr_histogram_log_test: HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/minunit.c.o
HdrHistogram_c/test/hdr_histogram_log_test: HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/build.make
HdrHistogram_c/test/hdr_histogram_log_test: HdrHistogram_c/src/libhdr_histogram_static.a
HdrHistogram_c/test/hdr_histogram_log_test: /usr/lib/x86_64-linux-gnu/libz.so
HdrHistogram_c/test/hdr_histogram_log_test: HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/micron/YCSB-cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable hdr_histogram_log_test"
	cd /home/micron/YCSB-cpp/build/HdrHistogram_c/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hdr_histogram_log_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/build: HdrHistogram_c/test/hdr_histogram_log_test
.PHONY : HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/build

HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/clean:
	cd /home/micron/YCSB-cpp/build/HdrHistogram_c/test && $(CMAKE_COMMAND) -P CMakeFiles/hdr_histogram_log_test.dir/cmake_clean.cmake
.PHONY : HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/clean

HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/depend:
	cd /home/micron/YCSB-cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/micron/YCSB-cpp /home/micron/YCSB-cpp/HdrHistogram_c/test /home/micron/YCSB-cpp/build /home/micron/YCSB-cpp/build/HdrHistogram_c/test /home/micron/YCSB-cpp/build/HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : HdrHistogram_c/test/CMakeFiles/hdr_histogram_log_test.dir/depend

