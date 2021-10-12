#!/bin/bash -ex

# Grab the SSHPublicKeyId
SSHPUBKEYID=$(aws iam list-ssh-public-keys --user-name $1 | jq --raw-output .SSHPublicKeys[].SSHPublicKeyId)

# Upload ssh public key
aws iam delete-ssh-public-key --user-name $1 --ssh-public-key-id $SSHPUBKEYID

# Delete IAM user
aws iam delete-user --user-name $1

