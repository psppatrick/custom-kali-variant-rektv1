#!/bin/bash

apt update

apt install -y curl git live-build cdebootstrap; echo $?

git clone git://git.kali.org/live-build-config.git

git clone https://github.com/psppatrick/custom-kali-variant-rektv1.git

cp custom-kali-variant-rektv1/kali.list.chroot live-build-config/variant-light/package-lists/kali.list.chroot; echo $?

cd ~/live-build-config/

./build.sh --verbose; echo $?
