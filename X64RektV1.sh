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

cp custom-kali-variant-rektv1/kali.list.chroot live-build-config/kali-config/variant-light/package-lists/kali.list.chroot; echo $?

cp custom-kali-variant-rektv1/InstallLOIC.sh live-build-config/kali-config/common/includes.chroot/InstallLOIC.sh

cp custom-kali-variant-rektv1/UpdateMe.sh live-build-config/kali-config/common/includes.chroot/InstallLOIC.sh

cd ~/live-build-config/

./build.sh --variant light --verbose; echo $?

sleep 0.05

finishTime=$(date)

echo "Start time was" $startTime "Finish time was" $finishTime >> x64RektLog.txt

