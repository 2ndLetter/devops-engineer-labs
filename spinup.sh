#!/bin/bash -ex

./create-iam.sh $1

./create-codecommit-repo.sh $2

./create-codebuild.sh

./create-cfn-ec2.sh

./create-codedeploy.sh