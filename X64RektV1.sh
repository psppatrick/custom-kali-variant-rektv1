#!/bin/bash

startTime=$(date)

apt update

sleep 0.05

apt install -y curl git live-build cdebootstrap

cd ~

mkdir -p ISOBuilding

cd ISOBuilding

sleep 0.05

git clone git://git.kali.org/live-build-config.git

git clone https://github.com/psppatrick/custom-kali-variant-rektv1.git

cp ~/ISOBuilding/custom-kali-variant-rektv1/kali.list.chroot live-build-config/kali-config/variant-light/package-lists/kali.list.chroot; echo $?

cp ~/ISOBuilding/custom-kali-variant-rektv1/InstallLOIC.sh live-build-config/kali-config/common/includes.chroot/InstallLOIC.sh

cp ~/ISOBuilding/custom-kali-variant-rektv1/UpdateMe.sh live-build-config/kali-config/common/includes.chroot/InstallLOIC.sh

cd ~/ISOBuilding/live-build-config/

./build.sh --variant light --verbose; echo $?; finishTime=$(date)

sleep 0.05

echo "Start time was" $startTime "Finish time was" $finishTime >> ~/x64BuildLog.txt

