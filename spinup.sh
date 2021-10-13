#!/bin/bash -ex

./create-iam.sh $1

./create-codecommit-repo.sh $2

./create-codedeploy.sh