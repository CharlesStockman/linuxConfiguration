#!/bin/bash

#
# Installs software from different package installers
#    Parameter 1 : The executable for the package manager
#    Parameter 2 : The associative array containing the package names to be extracted.
#    Parameter 3 : A string that desbribe the type of packages being extracted.
#
function installs {
  local -n packages=$2
  for packageGroupKey in "${!packages[@]}"
    do
      echo "*** "$packageGroupKey
      for package in ${packages[$packageGroupKey]}
      do
	echo "**** "$package
        $1 $package
      done
    done

}

#
# Install all software package groups
#
function installAll {
  installs  installPm softwareList "softwareList"
  installs installPip pipList "pipList"
  #startDocker
  #installs installDockerImage "dockerList"
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

#
# Start the Docker Daemon
#
function startDocker {
	dockerd &
}

