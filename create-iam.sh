#!/bin/bash -ex

# Create IAM Service Role for CodeBuild
aws iam create-role --role-name CodeBuildRole --assume-role-policy-document file://role-trust-policy.json

# Attach AdministratorAccess to Role
aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/AdministratorAccess --role-name CodeBuildRole

# Create IAM Instance Profile
aws iam create-instance-profile --instance-profile-name CodeBuildRole

# Add Role to Instance Profile
aws iam add-role-to-instance-profile --role-name CodeBuildRole --instance-profile-name CodeBuildRole

# Create IAM Group
aws iam create-group --group-name Admins

# Attach AdministratorAccess to Group
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AdministratorAccess --group-name Admins

# Create IAM user
aws iam create-user --user-name $1

# Add user to Group
aws iam add-user-to-group --user-name $1 --group-name Admins

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
ssh git-codecommit.us-east-1.amazonaws.com || echo 0
