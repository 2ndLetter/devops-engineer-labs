#!/bin/bash -ex

# Create Codecommit repo
aws codecommit create-repository --repository-name my-webpage --repository-description "Repository from DevOps Engineer course"

# git clone repo
mkdir -p repos
cd repos
git clone ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/my-webpage
cd my-webpage

# copy labs into repo
cp -R ../../labs/cicd-demo/* .

# Push changes to repo
git add .
git commit -m "first commit"
git push
git status
