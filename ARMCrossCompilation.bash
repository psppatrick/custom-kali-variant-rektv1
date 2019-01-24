#!/bin/bash

# This script will install all dependencies for ARM cross-compilation

apt install git-core gnupg flex bison gperf libesd0-dev build-essential \

zip curl libncurses5-dev zlib1g-dev gcc-multilib g++-multilib

dpkg --add-architecture i386

apt update

apt install ia32-libs apt-cacher-ng

sleep 1s

cd ~

mkdir -p arm-stuff/kernal/toolchains

cd arm-stuff/kernal/toolchains

git clone git://github.com/offensive-security/gcc-arm-eabi-linaro-4.6.2.git

sleep 5s

export ARCH=arm
#export CROSS_COMPILE=~/arm-stuff/kernel/toolchains/gcc-arm-eabi-linaro-4.6.2/bin/arm-eabi-

echo "Done!"
