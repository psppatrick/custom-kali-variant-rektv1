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
export CROSS_COMPILE=~/arm-stuff/kernel/toolchains/gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux/bin

#ADDING CUSTOM PACKAGES???
#
#
#export packages="xfce4 kali-menu wpasupplicant kali-defaults initramfs-tools u-boot-tools openssh-server nmap ncrack sqlmap aircrack-ng john hashcat wireshark metasploit-framework wifite dnsmap ismtp cowpatty kismet burpsuite reaver ettercap-graphical mitmproxy httptunnel webshells adminer php7.2 php7.2-mysql php7.2-json php7.2-common mysql-common mysql-sandbox nodejs npm apache2 vsftpd"
#export architecture="arm64"
#To be added
#
#

sleep 1s

cd ~/kali-arm-build-scripts

./build-deps.sh

./rpi3-64-lite.sh 2.0
#./rpi3-64.sh 2.0

echo "Done!" $?
