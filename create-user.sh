#!/bin/bash

# create user
aws iam create-user --user-name $1

# create json file for next command
#aws iam create-login-profile --generate-cli-skeleton > create-login-profile.json

# Give user aws console access
#aws iam create-login-profile --cli-input-json file://create-login-profile.json

# Give user programatic access
#aws iam create-access-key --user-name $1

# Create codecommit_rsa ssh keys
rm -fr ~/.ssh/codecommit_rsa*
ssh-keygen -t rsa -b 4096 -f ~/.ssh/codecommit_rsa -N ""

# Upload ssh public key
#aws iam upload-ssh-public-key --user-name $1 --ssh-public-key-body file:///home/bmchadwick/.ssh/codecommit_rsa.pub
aws iam upload-ssh-public-key --user-name $1 --ssh-public-key-body file://~/.ssh/codecommit_rsa.pub

# Grab the SSHPublicKeyId
SSHPUBKEYID=$(aws iam list-ssh-public-keys --user-name $1 | jq --raw-output .SSHPublicKeys[].SSHPublicKeyId)

# create config file for codecommit
echo -e "Host git-codecommit.*.amazonaws.com\n  User $SSHPUBKEYID\n  IdentityFile ~/.ssh/codecommit_rsa" > ~/.ssh/config