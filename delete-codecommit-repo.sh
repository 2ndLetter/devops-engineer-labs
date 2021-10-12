#!/bin/bash -ex

# Create Codecommit repo
aws codecommit delete-repository --repository-name my-webpage

# git repo cleanup
cd repos
rm -fr -R *
