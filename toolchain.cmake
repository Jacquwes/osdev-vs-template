if (NOT DEFINED TOOLCHAIN_PATH)
	message(FATAL_ERROR "TOOLCHAIN_PATH is not defined")
endif()

set(CMAKE_SYSTEM_NAME Generic)

# Prevent CMake from testing the compiler
set(CMAKE_C_COMPILER_WORKS true)
set(CMAKE_CXX_COMPILER_WORKS true)

# Set the compiler and linker
set(CMAKE_C_COMPILER ${TOOLCHAIN_PATH}/bin/x86_64-elf-gcc)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PATH}/bin/x86_64-elf-g++)
set(CMAKE_LINKER ${TOOLCHAIN_PATH}/bin/x86_64-elf-ld)

# Set compiler flags
set(TARGET_COMPILE_OPTIONS -mcmodel=kernel -mno-red-zone)
