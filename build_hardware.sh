#!/bin/sh
source ./soc_settings.sh

CURRENT_PATH=`pwd`
RAM_TIMING="MT48LC16M16A2_6A_ps"
SYNTHESIS_PATH="./hardware/synthesis/radiona/ulx3s/smp"
BSP_PATH="$CURRENT_PATH/bsp/radiona/ulx3s/smp"

./build_software.sh bootloader
#./build_software.sh bootloaderStandalone

# generate netlist
sbt "runMain saxon.board.radiona.ulx3s.Ulx3sSmp $SDRAM_SIZE"

# generate bitstream
make -C $SYNTHESIS_PATH clean
make -C $SYNTHESIS_PATH

