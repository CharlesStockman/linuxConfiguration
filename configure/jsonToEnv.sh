#!/bin/bash

#
# Verify that the description contains the correct json
#

#
# Notes
#
# 1. When export varibles you need to source the program 
# 2. $() is acutaly a subprocess
# 3. When using a . to soruce the script the exist may cause the terminal window to disappear


# Notes -e --> Interpretation of backslash escapes ; -E disable interpretation of backslash escapes (default)

function helpFunction() 
{
	echo "Usage: $0 <JSON Document>" 
	echo -e "\t The only argument is the path to a JSON File" 
}

#
# Verify that an argument was passed in
#
if [ -z "$1" ] 
then
	echo "The first argument is empty"
	helpFunction
else
	config_fullName=$( echo `jq '.config.full_name' $1` )
	export config_fullName=$config_fullName

	config_email=$( echo `jq '.config.email' $1` )
	export config_email=$config_email

	config_textEditor=$( echo `jq '.config.textEditor' $1` )
	export config_textEditor=$config_textEditor

	config_github_username=$( echo `jq '.config.github.username' $1` | sed 's/"//g' )
	export config_github_username=$config_github_username

	config_github_personalAccessToken=$(echo `jq '.config.github.personalAccessToken' $1` | sed 's/"//g' )
	export config_github_personalAccessToken=$config_github_personalAccessToken
	
	config_daemon=$(echo `jq '.config.daemons | join(", ")' $1` | sed 's/"//g' ) 
	export config_daemon=$config_daemon

	config_github_top_level_directory=$HOME/git
	export config_github_top_level_directory=$config_github_top_level_directory

 	echo "$0 --- Environemnt Variables Set ---"
	printenv | grep config_
	echo "$1 --- Environemnt Variables Set ---"

fi
