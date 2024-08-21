#!/bin/bash
# based on the instructions from edk2-platform
set -e
. build_common.sh
. build_bootshim.sh
# not actually GCC5; it's GCC7 on Ubuntu 18.04.
GCC5_ARM_PREFIX=arm-linux-gnueabi- build -s -n 0 -a ARM -t GCC5 -p Pixel3XL/Pixel3XL.dsc
cat BootShim/BootShim.bin workspace/Build/Pixel3XL/DEBUG_GCC5/FV/PIXEL3XL_UEFI.fd > ./bootpayload.bin
gzip -c < ./bootpayload.bin >boot-land.img
cat land.dtb >>boot-land.img
