#
# Will Store the user configuration for packages that will be installed on the system
#

declare -A softwareList
declare -A pipList

softwareList[ansible]="ansible"
softwareList[bin]="jq gcc"
softwareList[buildTools]="maven"
softwareList[ide]="intellij-idea-community-edition 2:2020.2.3-1 community/pycharm-community-edition 2020.2.3-3"
softwareList[docker]="docker"

declare -A pipList
pipList[libraries]="psutil"

declare -A dockerList
dockerList[databases]="mongo"
