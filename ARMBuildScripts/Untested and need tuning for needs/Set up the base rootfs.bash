#!/bin/bash

# Set up the base rootfs

cd ~
mkdir -p arm-stuff # should have already been created when setting up x-compilation
cd arm-stuff/
mkdir -p kernel # should have already been created when setting up x-compilation
mkdir -p rootfs
cd rootfs

debootstrap --foreign --arch $architecture kali-rolling kali-$architecture http://http.kali.org/kali
cp /usr/bin/qemu-arm-static kali-$architecture/usr/bin/

# 2nd stage chroot

cd ~/arm-stuff/rootfs
LANG=C chroot kali-$architecture /debootstrap/debootstrap --second-stage

cat << EOF > kali-$architecture/etc/apt/sources.list
deb http://http.kali.org/kali kali-rolling main non-free contrib
# deb-src http://http.kali.org/kali kali-rolling main non-free contrib
EOF

echo "kali" > kali-$architecture/etc/hostname

cat << EOF > kali-$architecture/etc/network/interfaces
auto lo
iface lo inet loopback
auto eth0
iface eth0 inet dhcp
auto wlan0
iface wlan0 inet dhcp
EOF

