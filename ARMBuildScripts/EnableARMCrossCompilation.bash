#!/bin/bash

export ARCH=arm

mkdir -p arm-stuff/kernel/toolchains

cd arm-stuff/kernel/toolchains

git clone git://github.com/offensive-security/gcc-arm-eabi-linaro-4.6.2.git

#This is the last command - run manually if possible
#I don't know if this is the whole command or not until test
#export CROSS_COMPILE=~/arm-stuff/kernel/toolchains/gcc-arm-eabi-linaro-4.6.2/bin/arm-eabi-