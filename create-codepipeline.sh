#!/bin/bash -ex

# Create codepipeline pipeline
export ACCOUNT=$(aws sts get-caller-identity | jq -r .Account)
export BUCKET=$(aws s3 ls | grep "aws-devops-course" | cut -d " " -f 3)
#aws codepipeline create-pipeline --cli-input-json file://codepipeline-project.json

cat codepipeline-project.json