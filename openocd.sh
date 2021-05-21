#!/bin/sh
openocd -s $PWD/bsp/radiona/ulx3s/smp/openocd -c 'set CPU0_YAML cpu0.yaml' -c "set APP_BIN $PWD/software/standalone/$1/build/$1.bin" -f usb_connect.cfg -f soc_init.cfg -f baremetal.cfg
