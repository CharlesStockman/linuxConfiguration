#!/bin/bash

#
# Update the whole system
#
function updateWorld {
	pacman -Syuu 
}

#
# Splits an array and calls the install function 
# 
function installs { 
        for packageGroupKey in "${!softwareList[@]}" 
        do 
            echo "**** Currently installing package group " $packageGroupKey 
            for package in ${softwareList[$packageGroupKey]} 
            do 
                install $package 
            done 
            echo "**** Done supporting installing package gorup " $packageGroupKey 
        done 
} 

#
# Install a specific package
#
# 	-S 				install the package
#       --noconfirm assume 		Bypass all the "Are you sure messages"
#
function install {
	pacman -S --noconfirm $1
}

#
# Searh for a specific package 
#
function search {
	pacman -Ss $1
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
