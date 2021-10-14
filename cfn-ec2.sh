#!/bin/bash -ex

# Create keypair
KEYPAIR=$(aws ec2 describe-key-pairs --filters Name=key-name,Values=keypair | jq --raw-output .KeyPairs[].KeyName)

if [[ $KEYPAIR == keypair ]]
then
  rm -fr CFN/keypair.pem
  aws ec2 delete-key-pair --key-name keypair
  aws ec2 create-key-pair --key-name keypair --query "KeyMaterial" --output text > CFN/keypair.pem
else
  aws ec2 create-key-pair --key-name keypair --query "KeyMaterial" --output text > CFN/keypair.pem
fi

# Deploy/Update CFN Stack
aws cloudformation deploy --template-file CFN/ec2.yml --stack-name my-ec2-instance --no-fail-on-empty-changeset --capabilities "CAPABILITY_NAMED_IAM"