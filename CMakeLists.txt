cmake_minimum_required(VERSION 3.17.0)

project(slug)

# Warn the user if CMAKE_TOOLCHAIN_FILE is not defined
if (NOT DEFINED CMAKE_TOOLCHAIN_FILE)
	message(WARNING "CMAKE_TOOLCHAIN_FILE not defined, compiler's target might be invalid.")
endif()

# include our project
add_subdirectory(slug_kernel)
