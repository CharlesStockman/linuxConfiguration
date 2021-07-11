#!/bin/bash

# Purpose : To convet the JSON into environmental varibles which will be used by other scripts
# to tailer the commands.

#
# Notes
#
# 1. When export varibles you need to source the program 
# 2. $() is acutaly a subprocess
# 3. When using a . to soruce the script the exist may cause the terminal window to disappear


# Notes -e --> Interpretation of backslash escapes ; -E disable interpretation of backslash escapes (default)

function helpFunction {
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

	config_email=$( echo `jq '.config.email' $1` | sed 's/"//g' )
	export config_email=$config_email

	config_textEditor=$( echo `jq '.config.textEditor' $1` )
	export config_textEditor=$config_textEditor

	config_dataDirectory=$( echo `jq '.config.dataDirectory' $1` | sed 's/"//g' )
	export config_dataDirectory=$config_dataDirectory

	config_homeDirectory=$( echo `jq '.config.homeDirectory' $1` | sed 's/"//g' )
	export config_homeDirectory=$config_homeDirectory

	config_github_username=$( echo `jq '.config.github.username' $1` | sed 's/"//g' )
	export config_github_username=$config_github_username

	config_github_personalAccessToken=$(echo `jq '.config.github.personalAccessToken' $1` | sed 's/"//g' )
	export config_github_personalAccessToken=$config_github_personalAccessToken
	
	config_daemon=$(echo `jq '.config.daemons | join(", ")' $1` | sed 's/"//g' ) 
	export config_daemon=$config_daemon

	config_ssh_filename=$( echo `jq '.config.backupMachine.key_name' $1` | sed 's/"//g' )
	export config_ssh_backupMachine_name=$config_ssh_filename

	config_ssh_passphrase=$( echo `jq '.config.backupMachine.pass_phrase' $1` | sed 's/"//g' )
	export config_ssh_backupMachine_passphrase=$config_ssh_passphrase

	config_ssh_remote_ip=$( echo `jq '.config.backupMachine.remote_ip' $1` | sed 's/"//g' )
	export config_ssh_backupMachine_remote_ip=$config_ssh_remote_ip

	config_ssh_user=$( echo `jq '.config.backupMachine.remote_user' $1` | sed 's/"//g' )
	export config_ssh_backupMachine_remote_user=$config_ssh_user
	
	config_ssh_password=$( echo `jq '.config.backupMachine.remote_password' $1` | sed 's/"//g' )
	export config_ssh_backupMachine_remote_password=$config_ssh_password

	config_ssh_backup_dirs=$( echo `jq '.config.backupMachine.backup_directories' $1` )
	export config_ssh_backup_directories=$config_ssh_backup_dirs

	config_github_top_level_directory=$HOME/git
	export config_github_top_level_directory=$config_github_top_level_directory

	config_terminal_emulator=$(echo `jq '.config.github.username' $1` | sed 's/"//g' )
	export config_terminal_emulator=$config_terminal_emualtor

 	echo "$0 --- Environemnt Variables Set ---"
	printenv | grep config_
	echo "$1 --- Environemnt Variables Set ---"

fi
