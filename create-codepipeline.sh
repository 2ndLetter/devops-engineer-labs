#!/bin/bash -ex

# Create codepipeline pipeline template
export ACCOUNT=$(aws sts get-caller-identity | jq -r .Account)
export BUCKET=$(aws s3 ls | grep "aws-devops-course" | cut -d " " -f 3)
sed -e "s/ACCOUNT_VAR/$ACCOUNT/g" -e "s/BUCKET_VAR/$BUCKET/g" codepipeline-project-source.json > codepipeline-project.json

# Create codepipeline pipeline
aws codepipeline create-pipeline --cli-input-json file://codepipeline-project.json

# Create CloudWatch Events Rule template
export ACCOUNT=$(aws sts get-caller-identity | jq -r .Account)
sed -e "s/ACCOUNT_VAR/$ACCOUNT/g" cloudwatch-events-rule-source.json > cloudwatch-events-rule.json

# Create CloudWatch Events Rule
aws events put-rule --cli-input-json file://cloudwatch-events-rule.json

# Add target to CloudWatch Events Rule
export ACCOUNT=$(aws sts get-caller-identity | jq -r .Account)
aws events put-targets --rule codepipeline-mywebpage-master --targets "Id"="1","Arn"="arn:aws:codepipeline:us-east-1:$ACCOUNT:CodePipelineDemo","RoleArn"="arn:aws:iam::$ACCOUNT:role/CodeBuildRole"