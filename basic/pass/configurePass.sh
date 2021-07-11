#/bin/bash 

# Purpose : Initailize the pass command 
#   and creates the storage needed.  The pass command will need a 
#   public/private key created by gnuPrivacyGuard for encryption

# Pass -- Is a password configuration manager that uses the command line

# Create the password directory and initialize if needed
rm -rf $HOME/.password-store ; mkdir $HOME/.password-store

pass init `echo $config_gpg_public_key`
