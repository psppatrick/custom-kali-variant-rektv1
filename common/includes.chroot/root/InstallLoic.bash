#!/bin/bash

mkdir loic

cd loic

sleep 0.05

wget https://raw.github.com/nicolargo/loicinstaller/master/loic.sh

sleep 1s

chmod a+x loic.sh

sleep 0.05

./loic.sh install

sleep 0.05

./loic.sh update

sleep 0.05

# ./loic.sh run