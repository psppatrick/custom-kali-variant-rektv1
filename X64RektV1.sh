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

mkdir ~/ISOBuilding/live-build-config/kali-config/variant-custom

mkdir ~/ISOBuilding/live-build-config/kali-config/variant-custom/package-lists

cp ~/ISOBuilding/custom-kali-variant-rektv1/kali.list.chroot ~/ISOBuilding/live-build-config/kali-config/variant-custom/package-lists/kali.list.chroot; echo $?

cp ~/ISOBuilding/custom-kali-variant-rektv1/custom.list.chroot ~/ISOBuilding/live-build-config/kali-config/variant-custom/package-lists/custom.list.chroot

cp ~/ISOBuilding/custom-kali-variant-rektv1/InstallLOIC.sh ~/ISOBuilding/live-build-config/kali-config/common/includes.chroot/InstallLOIC.sh

cp ~/ISOBuilding/custom-kali-variant-rektv1/UpdateMe.sh ~/ISOBuilding/live-build-config/kali-config/common/includes.chroot/UpdateMe.sh

cd ~/ISOBuilding/live-build-config/

./build.sh --variant custom --verbose -- \ --apt-http-proxy=${http+proxy}; echo $?; finishTime=$(date)

sleep 0.05

echo "Start time was" $startTime "Finish time was" $finishTime >> ~/x64BuildLog.txt

echo "Moving File to the exit directory"

cp -r ~/ISOBuilding/kali-live-build/images /mnt/hgfs/00repo/images
