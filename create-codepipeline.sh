#!/bin/bash -ex

# Create codepipeline pipeline template
export ACCOUNT=$(aws sts get-caller-identity | jq -r .Account)
export BUCKET=$(aws s3 ls | grep "aws-devops-course" | cut -d " " -f 3)
sed -e "s/ACCOUNT_VAR/$ACCOUNT/g" -e "s/BUCKET_VAR/$BUCKET/g" codepipeline-project-source.json > codepipeline-project.json


# Create codepipeline pipeline
#aws codepipeline create-pipeline --cli-input-json file://codepipeline-project.json
