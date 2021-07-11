#
# Changes to the sshd config file
#
count=`grep -c "#PasswordAuthentication yes" /etc/ssh/sshd_config`
if [ $count -eq 1 ]
then
        sed 's/#PasswordAuthentication yes/PasswordAuthentication_no/' /etc/ssh/sshd_config > tmp
        mv tmp /etc/ssh/sshd_config
fi

