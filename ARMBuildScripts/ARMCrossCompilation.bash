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

git clone git://github.com/offensive-security/gcc-arm-eabi-linaro-4.6.2.git

sleep 5s

export ARCH=arm
export CROSS_COMPILE=~/arm-stuff/kernel/toolchains/gcc-arm-eabi-linaro-4.6.2/bin/arm-eabi-

echo "Done!" $?

sleep 1s


cd ~/Scriptzzz/ARMBuildScripts

./BuildKalirootfs; echo $?

cd ~/kali-arm-build-scripts

./build-deps.sh; echo $?


#arm64 pi 3 scripts, I'm doing testing with this so only the basic
#./rpi3-64-lite.sh 2.0
#./rpi3-64.sh 2.0

echo "Done!" $?





