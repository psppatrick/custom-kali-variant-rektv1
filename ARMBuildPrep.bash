#!/bin/bash

cd ~

git clone https://github.com/offensive-security/kali-arm-build-scripts.git

apt update

apt -y install debootstrap qemu-user-static device-tree-compiler lzma lzop u-boot-tools libncurses5:i386 pixz

