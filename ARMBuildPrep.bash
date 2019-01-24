#!/bin/bash

cd ~

git clone https://github.com/offensive-security/kali-arm-build-scripts.git

apt update

apt -y install debootstrap qemu-user-static device-tree-compiler lzma lzop u-boot-tools libncurses5:i386 pixz

sleep 1s

cd ~/kali-arm-build-scripts

./build-deps.sh

# echo "This scipt can also run the ARM Builder script (PI 3  LITE ONLY)"
# echo "Do you want this scipt to build for you?(Y/N)"
# read answer
# if $answer "Y"; then
	# echo "BUILDING ARM IMAGE, THIS IS GONNA TAKE A WHILE"
	# sleep 5s
	# kali-arm-build-scripts/rpi3-64-lite.sh 2.0
# else
	# echo "SCRIPT FINISHED"
# fi
