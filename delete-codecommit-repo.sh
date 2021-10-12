#!/bin/bash -ex

# Create Codecommit repo
aws codecommit delete-repository --repository-name $1

# git repo cleanup
cd repos
rm -fr -R *
