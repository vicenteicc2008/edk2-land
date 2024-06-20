#!/bin/bash
# based on the instructions from edk2-platform
set -e
. build_common.sh
# not actually GCC5; it's GCC7 on Ubuntu 18.04.
GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -s -n 0 -a AARCH64 -t GCC5 -p Pixel3XL/Pixel3XL.dsc
wine GenerateImage.exe --cmdline 'console=null' --kernel workspace/Build/Pixel3XL/DEBUG_GCC5/FV/PIXEL3XL_UEFI.fd --ramdisk workspace/Build/Pixel3XL/DEBUG_GCC5/FV/Guid.xref -o uefi.img --base 0x80000000 --pagesize 2048 --kernel_offset 00008000
cat land-wp.dtb >>uefi.img
