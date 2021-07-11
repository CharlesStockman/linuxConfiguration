#
# Purpose : To create directories on a remote drive
#

for directory in `echo $config_ssh_backup_directories | tr -d [ | tr -d ] | tr -d \" | tr , "\n" `
do
	ssh $config_ssh_backupMachine_remote_user@$config_ssh_backupMachine_remote_ip "mkdir -p $directory"
done

