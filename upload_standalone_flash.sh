#!/bin/sh

fujprog -j FLASH ./hardware/synthesis/radiona/ulx3s/smp/bin/toplevel.bit
fujprog -j FLASH -f 0x340000 software/standalone/blinkAndEcho/build/blinkAndEcho.bin
