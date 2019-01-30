#!/bin/bash

apt update

sleep 0.05

apt upgrade -y; echo $?

sleep 0.05

apt dist-upgrade -y; echo $?
