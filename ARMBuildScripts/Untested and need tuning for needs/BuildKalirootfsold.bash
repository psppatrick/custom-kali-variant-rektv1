#!/bin/bash

# exports
export packages="xfce4 kali-menu wpasupplicant kali-defaults initramfs-tools u-boot-tools openssh-server nmap ncrack sqlmap aircrack-ng john hashcat wireshark metasploit-framework wifite dnsmap ismtp cowpatty kismet burpsuite reaver ettercap-graphical mitmproxy httptunnel webshells adminer php7.2 php7.2-mysql php7.2-json php7.2-common mysql-common mysql-sandbox nodejs npm apache2 vsftpd"
export architecture="armhf"
export MALLOC_CHECK_=0 # workaround for LP: #520465
export LC_ALL=C
export DEBIAN_FRONTEND=noninteractive

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

#3rd stage chroot
#
#Do this part manually
#export MALLOC_CHECK_=0 # workaround for LP: #520465
#export LC_ALL=C
#export DEBIAN_FRONTEND=noninteractive

mount -t proc proc kali-$architecture/proc
mount -o bind /dev/ kali-$architecture/dev/
mount -o bind /dev/pts kali-$architecture/dev/pts

cat << EOF > kali-$architecture/debconf.set
console-common console-data/keymap/policy select Select keymap from full list
console-common console-data/keymap/full select en-latin1-nodeadkeys
EOF



# more 3rd stage chroot


cat << EOF > kali-$architecture/third-stage
#!/bin/bash
dpkg-divert --add --local --divert /usr/sbin/invoke-rc.d.chroot --rename /usr/sbin/invoke-rc.d
cp /bin/true /usr/sbin/invoke-rc.d

apt update
apt install locales-all
#locale-gen en_gb.UTF-8

debconf-set-selections /debconf.set
rm -f /debconf.set
apt update
apt -y install git-core binutils ca-certificates initramfs-tools u-boot-tools
apt -y install locales console-common less nano git
echo "root:toor" | chpasswd
sed -i -e 's/KERNEL\!="eth\*|/KERNEL\!="/' /lib/udev/rules.d/75-persistent-net-generator.rules
rm -f /etc/udev/rules.d/70-persistent-net.rules
apt-get --yes --force-yes install $packages

rm -f /usr/sbin/invoke-rc.d
dpkg-divert --remove --rename /usr/sbin/invoke-rc.d

rm -f /third-stage
EOF


# make 3rd stage executable from 2nd stage

chmod +x kali-$architecture/third-stage
LANG=C chroot kali-$architecture /third-stage

# Cleanup

cat << EOF > kali-$architecture/cleanup
#!/bin/bash
rm -rf /root/.bash_history
apt update
apt clean
rm -f cleanup
EOF

chmod +x kali-$architecture/cleanup
LANG=C chroot kali-$architecture /cleanup

umount kali-$architecture/proc
umount kali-$architecture/dev/pts
umount kali-$architecture/dev/

cd ..


