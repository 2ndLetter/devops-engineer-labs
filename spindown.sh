#!/bin/bash -ex

./delete-codedeploy.sh

./delete-codecommit-repo.sh $2

./delete-iam.sh $1
