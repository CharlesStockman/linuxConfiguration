#!/bin/bash

#
# Update the whole system
#	--yes 	force yes 
#
function updateWorld {
	apt update
	apt --yes full-upgrade
}

#
# Search for a specific package
#
function search {
	apt search $1
}

function allMetaData {
	apt show $1
}
