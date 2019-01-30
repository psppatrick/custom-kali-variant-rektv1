#!/bin/bash

apt update

mkdir -p /root/arm-stuff

cd /root/arm-stuff

git clone https://github.com/offensive-security/gcc-arm-linux-gnueabihf-4.7

export PATH=${PATH}:/root/arm-stuff/gcc-arm-linux-gnueabihf-4.7/bin; echo $?

sleep 1s

git clone https://github.com/offensive-security/kali-arm-build-scripts

sleep 1s

cd ~/arm-stuff/kali-arm-build-scripts

./build-deps.sh; echo $?

echo "Will now Build RektV1 for Pi3"

sleep 0.05

cp ~/arm-stuff/custom-kali-variant-rektv1/rpi3-nexmon-Rektv1.sh ~/arm-stuff/kali-arm-build-scripts/rpi3-nexmon-Rektv1.sh

sleep 0.05

./rpi3-nexmon-Rektv1.sh 1.0; echo $?
