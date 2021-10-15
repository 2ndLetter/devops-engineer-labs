#!/bin/bash -ex

./delete-codedeploy.sh

./delete-cfn-ec2.sh

./delete-codebuild.sh

./delete-codecommit-repo.sh $2

./delete-iam.sh $1
