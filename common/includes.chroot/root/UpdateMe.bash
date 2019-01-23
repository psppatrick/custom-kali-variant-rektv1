#!/bin/bash

apt update

sleep 1s

apt upgrade -y

echo "Finished Updating! Will you run autoremove?(y/n)"

read $response

if $response "Y"
then
	apt autoremove
elif $response "y"
then
	apt autoremove
else
	echo "Not running autoremove, please consider running later to clean wasted space"
fi
