#!/bin/bash

apt update

sleep 0.05

apt install -y git mono-devel

cd ~

git clone https://github.com/NewEraCracker/LOIC.git

cd LOIC

chmod a+x loic-net4.5.sh

./loic-net4.5.sh install

./loic-net-4.5.sh update

echo "Installed LOIC!"
