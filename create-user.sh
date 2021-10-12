#!/bin/bash -x

# Create IAM user
aws iam create-user --user-name $1

# Delete previously created codecommit_rsa ssh keys
rm -fr ~/.ssh/codecommit_rsa*

# Create codecommit_rsa ssh keys
ssh-keygen -t rsa -b 4096 -f ~/.ssh/codecommit_rsa -N ""

# Upload ssh public key
aws iam upload-ssh-public-key --user-name $1 --ssh-public-key-body file://~/.ssh/codecommit_rsa.pub

# Grab the SSHPublicKeyId
SSHPUBKEYID=$(aws iam list-ssh-public-keys --user-name $1 | jq --raw-output .SSHPublicKeys[].SSHPublicKeyId)

# Create config file for codecommit
echo -e "Host git-codecommit.*.amazonaws.com\n  User $SSHPUBKEYID\n  IdentityFile ~/.ssh/codecommit_rsa" > ~/.ssh/config

# Check connection to codecommit
sleep 10
ssh git-codecommit.us-east-1.amazonaws.com