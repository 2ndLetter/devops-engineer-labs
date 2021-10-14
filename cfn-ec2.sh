#!/bin/bash

aws cloudformation deploy --template-file CFN/ec2.yml --stack-name my-ec2-instance --no-fail-on-empty-changeset --capabilities "CAPABILITY_NAMED_IAM"