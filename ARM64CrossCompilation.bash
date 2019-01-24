#!/bin/bash

# This script will probably install all dependencies for ARM cross-compilation

#apt install git-core gnupg flex bison gperf libesd0-dev build-essential \
# libesd0-dev not found

apt install git gnupg flex bison gperf libbison-dev build-essential \

#zip curl libncurses5-dev zlib1g-dev gcc-multilib g++-multilib
# zips not found

dpkg --add-architecture i386

apt update

#apt install ia32-libs apt-cacher-ng
#ia32-libs replaced with lib32z1

apt install lib32z1 

sleep 1s

cd ~

mkdir -p arm-stuff/kernal/toolchains

cd arm-stuff/kernal/toolchains
#This is for arm architecture, I want ARM64
#git clone git://github.com/offensive-security/gcc-arm-eabi-linaro-4.6.2.git

wget https://releases.linaro.org/archive/14.09/components/toolchain/binaries/gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz

tar xvf gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz

sleep 5s

export ARCH=arm64
export CROSS_COMPILE=~/arm-stuff/kernel/toolchains/gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux

echo "Done!" $?
