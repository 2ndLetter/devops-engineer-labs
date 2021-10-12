#!/bin/bash -ex

# Grab the SSHPublicKeyId
SSHPUBKEYID=$(aws iam list-ssh-public-keys --user-name $1 | jq --raw-output .SSHPublicKeys[].SSHPublicKeyId)

# Delete ssh public key
aws iam delete-ssh-public-key --user-name $1 --ssh-public-key-id $SSHPUBKEYID

# Remove user to Admins Group
aws iam remove-user-from-group --user-name $1 --group-name Admins

# Delete IAM user
aws iam delete-user --user-name $1

# Detach AdministratorAccess to Group
aws iam detach-group-policy --group-name Admins --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

# Delete IAM Group
aws iam delete-group --group-name Admins
