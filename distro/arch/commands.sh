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
# Installs software from different package installers
#    Parameter 1 : The executable for the package manager
#    Parameter 2 : The associative array containing the package names to be extracted.
#    Parameter 3 : A string that desbribe the type of packages being extracted.
#
function installs {
  local -n packages=$2
  echo "Installing " $3
  for packageGroupKey in "${!packages[@]}"
    do
      for package in ${packages[$packageGroupKey]}
      do
        $1 $package
      done
    done

}

#
# Install all software package groups
#
function installAll {
  installs install softwareList "softwareList"
  installs installPip pipList "pipList"
}

#
# Install a specific package
#
# 	-S 				install the package
#   --noconfirm assume 		Bypass all the "Are you sure messages"
#
function install {
	pacman -S --noconfirm $1
}

#
# Function install python libraries and applications
#
function installPip {
  pip install $1
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
# Access the AUR using GUI  
#
# dependencies : pamac
# 
function installAurGui() {
	install pamac-gtk
}

#
# All Meta Data 
#
function allMetaData() {
	pacman -Si $1
}
