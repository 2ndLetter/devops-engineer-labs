#!/bin/bash

# create user
aws iam create-user --user-name brian

# create json file for next command
#aws iam create-login-profile --generate-cli-skeleton > create-login-profile.json

# Give user aws console access
#aws iam create-login-profile --cli-input-json file://create-login-profile.json

# Give user programatic access
#aws iam create-access-key --user-name brian

# Upload ssh public key
aws iam upload-ssh-public-key --user-name brian --ssh-public-key-body file:///home/bmchadwick/.ssh/codecommit_rsa.pub

# Grab the SSHPublicKeyId
SSHPUBKEYID=$(aws iam list-ssh-public-keys --user-name brian | jq --raw-output .SSHPublicKeys[].SSHPublicKeyId)

# create config file for codecommit
echo -e "Host git-codecommit.*.amazonaws.com\n  User $SSHPUBKEYID\n  IdentityFile ~/.ssh/codecommit_rsa" > ~/.ssh/config