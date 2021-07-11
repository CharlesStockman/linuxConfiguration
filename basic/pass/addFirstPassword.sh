# Purpose : Add the passpharase for the ssh backup key  to the pass command line utiltity so other scripts can easily access it. 
expect addFirstPassword.exp "ssh_backup_passphrase" `echo $config_ssh_backupMachine_passphrase | openssl enc -base64 -d`

