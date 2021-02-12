#
# Will Store the user configuration for packages that will be installed on the system
#

declare -A softwareList
declare -A pipList
declare -A dockerList
declare -A globalNpmList

softwareList[ansible]="ansible"
softwareList[bin]="jq gcc"
softwareList[buildTools]="maven"
softwareList[ide]="intellij-idea-community-edition 2:2020.2.3-1 community/pycharm-community-edition 2020.2.3-3"
softwareList[docker]="docker"
softwareList[qemu]="qemu"
softwareList[awesome]="awesome"
softwareList[nodejs]="nodejs npm"

pipList[libraries]="psutil"

dockerList[databases]="mongo"

globalNpmList["angular"]="@angular/cli"
