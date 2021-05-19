#!/bin/sh

source ./soc_settings.sh

CURRENT_PATH=`pwd`
BUILD_ROOT="$CURRENT_PATH/buildroot"
BUILD_ROOT_SPINAL_SAXON_PATH="$BUILD_ROOT/buildroot-spinal-saxon"
BUILD_ROOT_PATH="$BUILD_ROOT/buildroot"
BUILD_PATH="$BUILD_ROOT/build"
BOARD_CONFIG=saxon_ulx3s_defconfig

if [ ! -d $BUILD_ROOT ]; then
	mkdir $BUILD_ROOT
fi

if [ ! -d $BUILD_ROOT_SPINAL_SAXON_PATH ]; then
	git -C $BUILD_ROOT clone https://github.com/SpinalHDL/buildroot-spinal-saxon.git
else
	git -C $BUILD_ROOT_SPINAL_SAXON_PATH pull
fi

if [ ! -d $BUILD_ROOT_PATH ]; then
	git -C $BUILD_ROOT  clone https://github.com/buildroot/buildroot.git
else
	git -C $BUILD_ROOT_PATH pull
fi

#git -C $BUILD_ROOT_PATH checkout 9ef54b7d
git -C $BUILD_ROOT_PATH checkout 2020.11.x


if [ ! -d $BUILD_PATH ]; then
	mkdir $BUILD_PATH
fi

( cd $BUILD_PATH && make O=$PWD BR2_EXTERNAL=$BUILD_ROOT_SPINAL_SAXON_PATH -C $BUILD_ROOT_PATH $BOARD_CONFIG )

#make -C $BUILD_PATH menuconfig
cd $BUILD_PATH
make clean
make -j2
#make -C $BUILD_PATH -j2
