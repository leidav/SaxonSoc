#!/bin/sh

fujprog -j FLASH ./hardware/synthesis/radiona/ulx3s/smp/bin/toplevel.bit
fujprog -j FLASH -f 0x340000 buildroot/build/images/fw_jump.bin
fujprog -j FLASH -f 0x380000 buildroot/build/images/u-boot.bin
