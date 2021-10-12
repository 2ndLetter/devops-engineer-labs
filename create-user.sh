#!/bin/bash

# create user
aws iam create-user --user-name brian

# create json file for next command
#a aws iam create-login-profile --generate-cli-skeleton > create-login-profile.json

# Give user aws console access
#aws iam create-login-profile --cli-input-json file://create-login-profile.json

# Give user programatic access
#aws iam create-access-key --user-name brian

# generate ssh keys


# upload ssh public key

# create config file for codecommit
