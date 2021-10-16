#!/bin/bash -ex

# Create codepipeline pipeline
aws codepipeline delete-pipeline --name CodePipelineDemo

# Create CloudWatch Events Rule template
#export ACCOUNT=$(aws sts get-caller-identity | jq -r .Account)
#sed -e "s/ACCOUNT_VAR/$ACCOUNT/g" cloudwatch-events-rule-source.json > cloudwatch-events-rule.json

# Add target to CloudWatch Events Rule
#export ACCOUNT=$(aws sts get-caller-identity | jq -r .Account)
aws events remove-targets --rule codepipeline-mywebpage-master --ids "1"

# Create CloudWatch Events Rule
aws events delete-rule --name "codepipeline-mywebpage-master"

# Create codepipeline pipeline template
#export ACCOUNT=$(aws sts get-caller-identity | jq -r .Account)
#export BUCKET=$(aws s3 ls | grep "aws-devops-course" | cut -d " " -f 3)
#sed -e "s/ACCOUNT_VAR/$ACCOUNT/g" -e "s/BUCKET_VAR/$BUCKET/g" codepipeline-project-source.json > codepipeline-project.json








