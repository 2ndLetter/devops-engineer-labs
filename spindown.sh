#!/bin/bash -ex

./delete-cfn-ec2.sh

./delete-codedeploy.sh

./delete-codecommit-repo.sh $2

./delete-iam.sh $1
