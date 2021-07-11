#!/bin/bash

#
# Purpose to install ssh and to to configure ssh to allow passowrdless access to at one leat one remote machine
#

#
# decode the password(s) for the remote machine
#
backupPassword=`echo $config_ssh_backupMachine_remote_password | openssl enc -base64 -d` 
passPhrase=`echo $config_ssh_backupMachine_passphrase | openssl enc -base64 -d`

#
# Create the ssh public and private keys
#
if [ ! -f "$HOME/.ssh/$config_ssh_backupMachine_name" ]; then
	ssh-keygen -t rsa -f $HOME/.ssh/$config_ssh_backupMachine_name  -N $passPhrase
fi

#
# Copy the public id to the remote machine so it can be accessed by ssh
#
expect -d ./sshCopyId.exp $config_ssh_backupMachine_remote_user $config_ssh_backupMachine_remote_ip $backupPassword $config_ssh_backupMachine_name `pass ssh_backup_passphrase` 

