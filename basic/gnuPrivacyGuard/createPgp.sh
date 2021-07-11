#!/bin/bash

# Purpose : Creates a public/private key so other program can easily encrypt their data.
#	GPG : A free implementation of the OpenPGP standard as defined by RFC4889 (PGP) 

# Remote the directory where the gnupg files are kept.
( rm -rf $HOME/.gnupg ; mkdir -m 0700 $HOME/.gnupg ; touch $HOME/.gnupg/gpg.conf ; chmod 600 $HOME/.gnupg/gpg.conf )

# Create the definition to used to create the keys
cd $HOME/.gnupg
cat >keydetails <<EOF
    %echo Generating a basic OpenPGP key
    Key-Type: DSA
    Key-Length: 1024 
    Subkey-Type: ELG-E 
    Subkey-Length: 1024 
    Name-Real: $config_fullName 
    Name-Comment: Created by an automated script 
    Name-Email: $config_email
    Expire-Date: 0
    %no-ask-passphrase
    %no-protection
    %pubring pubring.kbx
    %secring trustdb.gpg
    # Do a commit here, so that we can later print "done" :-)
    %commit
    %echo done
EOF

# Generate the public/private keys.
gpg2 --verbose --batch --gen-key keydetails

# Set trust to 5 for the key so we can encrypt without prompt.
echo -e "5\ny\n" |  gpg2 --command-fd 0 --expert --edit-key $config_email trust;
