#!/bin/bash -ex

./create-iam.sh brian

./create-codecommit-repo.sh my-webpage

./create-codebuild.sh

./create-cfn-ec2.sh

./create-codedeploy.sh

sleep 120

./create-codepipeline.sh