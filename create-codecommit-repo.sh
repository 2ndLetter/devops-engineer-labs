#!/bin/bash -ex

# Create Codecommit repo
aws codecommit create-repository --repository-name $1 --repository-description "Repository from DevOps Engineer course"

# git clone repo
mkdir -p repos
cd repos
rm -fr -R *
git clone ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/$1
cd $1

# copy labs into repo
cp -R ../../labs/cicd-demo/* .

# Push changes to repo
git add .
git commit -m "first commit"
git push
git status
