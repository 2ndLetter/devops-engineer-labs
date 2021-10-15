#!/bin/bash -ex

# Declare the BUCKET var
BUCKET=$(aws s3 ls | grep "aws-devops-course" | cut -d " " -f 3)

# Delete all versions of objects in bucket
# Source: https://github.com/linz/geostore/blob/19dba64cce0c86b1f4d0bb66bb8246c149a61a01/clear-s3-buckets.bash
./delete-s3-buckets.sh $BUCKET

# Delete S3 bucket
aws s3 rb s3://$BUCKET --force

# Delete CodeDeploy Application
aws deploy delete-application --application-name CodeDeployDemo