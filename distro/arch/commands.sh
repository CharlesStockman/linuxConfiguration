#!/bin/bash

#
# Update the whole system
#
# -S		Synchronization of core, community, multilib, extra repositories with local repositories
# -y		refresh the local copy of the master package database
# -u 		system update
# --noconfirm	always answer yes to any question 
#
function updateWorld {
	pacman -Syuu  --noconfirm 
}

#
# Install a specific package
#
# 	-S 				install the package
#   --noconfirm assume 		Bypass all the "Are you sure messages"
#
function installPm {
	echo "***** "$1
	pacman -S --noconfirm $1
}

#
# Search for a specific package
#
function search {
	pacman -Ss $1
}

#
# Install nvidia
#
# If you run into trouble with CUDA not being available, run nvidia-modprobe first
#
function installNvidia {
	mhwd -a pci nonfree 0300
	nvidia-modprobe
	reboot
}

#
# All Meta Data 
#
function allMetaData() {
	pacman -Si $1
}
