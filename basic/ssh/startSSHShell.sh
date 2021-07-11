#!/bin/bash

#
# Purpose : May need to executed each time a new shell is open.
# So I copied this code into separate file

#
# Starts the sshd daemon
# Holds the private key for the public key authorization 
eval "$(ssh-agent)"

# Add the private keys to the ssh daemon so the ssh can automatically log in to a remote site 
passPhrase=`pass ssh_backup_passphrase`
expect ./sshAddId.exp $config_ssh_backupMachine_name $passPhrase 
