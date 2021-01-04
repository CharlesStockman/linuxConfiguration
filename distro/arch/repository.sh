#
# Will Store the user configuration for packages that will be installed on the system
#

declare -A softwareList
declare -A pipList

softwareList[package]="yay fakeroot"
softwareList[ansible]="ansible"
softwareList[bin]="jq gcc"
softwareList[office]="libreoffice-fresh"
softwareList[buildTools]="maven"
softwareList[ide]="intellij-idea-community-edition 2:2020.2.3-1 community/pycharm-community-edition 2020.2.3-3"
softwareList[performance]="lshw fio"

declare -A pipList
pipList[libraries]="psutil"