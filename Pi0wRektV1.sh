#!/bin/bash

startTime=$(date)

apt update

sleep 0.05

apt install -y git gnupg flex bison gperf libbison-dev build-essential 

dpkg --add-architecture i386

apt update

sleep 0.05

apt install lib32z1

cd ~

mkdir -p arm-stuff

cd arm-stuff

git clone https://github.com/psppatrick/custom-kali-variant-rektv1.git

git clone git://github.com/offensive-security/gcc-arm-eabi-linaro-4.6.2.git; echo $?

export ARCH=arm
export CROSS_COMPILE=~/arm-stuff//gcc-arm-eabi-linaro-4.6.2/bin/

cd ~/arm-stuff/kali-arm-build-scripts

./build-deps.sh; echo $?

echo "Will now Build RektV1 for Pi0"

sleep 0.05

cp ~/arm-stuff/custom-kali-variant-rektv1/rpi0w-nexmon-Rektv1.sh ~/arm-stuff/kali-arm-build-scripts/rpi0w-nexmon-Rektv1.sh

sleep 0.05

./rpi0w-nexmon-Rektv1.sh 1.0; echo $?; finishTime=$(date); echo "Time started" $startTime "Time Finished" $finishTime >> ~/Pi0wbuildlog.txt

echo "Finished!"
