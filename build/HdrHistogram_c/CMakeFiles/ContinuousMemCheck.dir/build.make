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

# Utility rule file for ContinuousMemCheck.

# Include any custom commands dependencies for this target.
include HdrHistogram_c/CMakeFiles/ContinuousMemCheck.dir/compiler_depend.make

# Include the progress variables for this target.
include HdrHistogram_c/CMakeFiles/ContinuousMemCheck.dir/progress.make

HdrHistogram_c/CMakeFiles/ContinuousMemCheck:
	cd /home/micron/YCSB-cpp/build/HdrHistogram_c && /usr/bin/ctest -D ContinuousMemCheck

ContinuousMemCheck: HdrHistogram_c/CMakeFiles/ContinuousMemCheck
ContinuousMemCheck: HdrHistogram_c/CMakeFiles/ContinuousMemCheck.dir/build.make
.PHONY : ContinuousMemCheck

# Rule to build all files generated by this target.
HdrHistogram_c/CMakeFiles/ContinuousMemCheck.dir/build: ContinuousMemCheck
.PHONY : HdrHistogram_c/CMakeFiles/ContinuousMemCheck.dir/build

HdrHistogram_c/CMakeFiles/ContinuousMemCheck.dir/clean:
	cd /home/micron/YCSB-cpp/build/HdrHistogram_c && $(CMAKE_COMMAND) -P CMakeFiles/ContinuousMemCheck.dir/cmake_clean.cmake
.PHONY : HdrHistogram_c/CMakeFiles/ContinuousMemCheck.dir/clean

HdrHistogram_c/CMakeFiles/ContinuousMemCheck.dir/depend:
	cd /home/micron/YCSB-cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/micron/YCSB-cpp /home/micron/YCSB-cpp/HdrHistogram_c /home/micron/YCSB-cpp/build /home/micron/YCSB-cpp/build/HdrHistogram_c /home/micron/YCSB-cpp/build/HdrHistogram_c/CMakeFiles/ContinuousMemCheck.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : HdrHistogram_c/CMakeFiles/ContinuousMemCheck.dir/depend

