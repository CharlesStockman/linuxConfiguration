#!/bin/bash

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
  installs  install softwareList "softwareList"
  installs installPip pipList "pipList"
  installs installDockerImage "dockerList"
}

#
# Installs software from the repository
#
function install {
	apt-get --yes install $1
}

#
# Install a docker image
#
function installDockerImage {
  docker pull $1
}

#
# Function install python libraries and applications
#
function installPip {
  pip install $1
}
