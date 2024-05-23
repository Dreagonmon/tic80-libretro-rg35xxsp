# Build TIC80 libretro core for RG35XX PLUS/SP/H

# Install toolchain

[union-rg35xxplus-toolchain](https://github.com/shauninman/union-rg35xxplus-toolchain/tree/3dceb6e6de1db7398fe9bbe9db3086cc0055eada)

Build the toolchain in the docker, and run `package-toolchain.sh`, get the toolchains.

Please make sure the toolchain is installed at `/opt`

# Compile tic80 libretro core

Run `cross-tic80.sh`, and wait.

The output core is `TIC-80/build/bin/tic80_libretro.so`

# Install core

* Copy `tic80_libretro.so` to your sdcard.
* Open RetroArch, `Settings > Core > Manage Cores > Install or Restore a Core`.
* Select `tic80_libretro.so`.
* Done, open TIC-80 games with RetroArch.
