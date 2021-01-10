#!/bin/bash

#
# Installs software from different package installers
#    Parameter 1 : The executable for the package manager
#    Parameter 2 : The associative array containing the package names to be extracted.
#    Parameter 3 : A string that desbribe the type of packages being extracted.
#
function installs {
  echo $1
  echo $2
  echo $3 
  local -n packages=$2
  echo packages
  echo "Installing " $3
  echo "--------------------------------------"
  for packageGroupKey in "${!packages[@]}"
    do
      echo $packageGroupKey
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

#
# Convert a comma separated string into an array
#
function startDaemons {
  daemonArray=($(echo $config_daemon | tr "," "\n"))
  for string in "${daemonArray[@]}"
  do
	echo $string
	eval "$string &"
  done 
}
