# the name of the target operating system
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)

# which compilers to use for C and C++
set(CMAKE_C_COMPILER   /opt/rg35xxplus-toolchain/usr/bin/arm-buildroot-linux-gnueabihf-gcc)
set(CMAKE_CXX_COMPILER /opt/rg35xxplus-toolchain/usr/bin/arm-buildroot-linux-gnueabihf-g++)

# where is the target environment located
set(CMAKE_SYSROOT  /opt/rg35xxplus-toolchain/usr/arm-buildroot-linux-gnueabihf/sysroot)
set(CMAKE_FIND_ROOT_PATH  /opt/rg35xxplus-toolchain/usr/arm-buildroot-linux-gnueabihf/sysroot)
set(CMAKE_INCLUDE_PATH      /opt/rg35xxplus-toolchain/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include)
set(CMAKE_LIBRARY_PATH      /opt/rg35xxplus-toolchain/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib)
set(CMAKE_PROGRAM_PATH      /opt/rg35xxplus-toolchain/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/bin)


# adjust the default behavior of the FIND_XXX() commands:
# search programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# search headers and libraries in the target environment
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c11")
