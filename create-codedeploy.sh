#!/bin/bash

# Create CodeDeploy Application
aws deploy create-application --application-name CodeDeployDemo


# Create CodeDeploy deployment group
ACCOUNT=$(aws sts get-caller-identity | jq -r .Account)
aws deploy create-deployment-group \
    --application-name CodeDeployDemo \
    --deployment-config-name CodeDeployDefault.OneAtATime \
    --deployment-group-name MyDevelopmentInstances \
    --ec2-tag-filters Key=Environment,Value=Development,Type=KEY_AND_VALUE \
    --service-role-arn arn:aws:iam::$ACCOUNT:role/CodeBuildRole

# Create S3 bucket
HASH=$(openssl rand -base64 20 | sed -e 's/+//g' -e 's/\///g' -e 's/[A-Z]//g' -e 's/\=//g')
aws s3 mb s3://aws-devops-course-$HASH --region us-east-1
aws s3api put-bucket-versioning --bucket aws-devops-course-$HASH --versioning-configuration Status=Enabled --region us-east-1
aws deploy push --application-name CodeDeployDemo --s3-location s3://aws-devops-course-$HASH/codedeploy-demo/app.zip --ignore-hidden-files --region us-east-1 --source repos/my-webpage/

# Create CodeDeploy deployment
aws deploy create-deployment \
    --application-name CodeDeployDemo \
    --deployment-config-name CodeDeployDefault.OneAtATime \
    --deployment-group-name MyDevelopmentInstances \
    --s3-location bucket=aws-devops-course-$HASH,bundleType=zip,key=codedeploy-demo/app.zip
