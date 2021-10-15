#!/bin/bash -ex

./create-iam.sh $1

./create-codecommit-repo.sh $2

./create-codedeploy.sh

./create-cfn-ec2.sh


# Open up the SG
