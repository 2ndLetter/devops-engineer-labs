#!/bin/bash -ex

./delete-codedeploy.sh

./delete-cfn-ec2.sh

./delete-codebuild.sh

./delete-codecommit-repo.sh my-webpage

./delete-iam.sh brian
