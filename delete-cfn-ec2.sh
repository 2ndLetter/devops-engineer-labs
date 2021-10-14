#!/bin/bash -ex

# Delete keypair if it exist
KEYPAIR=$(aws ec2 describe-key-pairs --filters Name=key-name,Values=keypair | jq --raw-output .KeyPairs[].KeyName)
if [[ $KEYPAIR == keypair ]]
then
  echo "Deleting keypair!"
  rm -fr CFN/keypair.pem
  aws ec2 delete-key-pair --key-name keypair
fi

# Delete CFN Stack with ec2 instance
CFNSTACK=$(aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE | jq --raw-output '.StackSummaries[] | select(.StackName == "my-ec2-instance")' | jq --raw-output .StackName)
if [[ $CFNSTACK == my-ec2-instance ]]
then
  echo "Deleting CFN stack"
  aws cloudformation delete-stack --stack-name my-ec2-instance
fi





#aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE | jq --raw-output .StackSummaries[].StackName
#aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE | jq --raw-output '.StackSummaries[] | select(.StackName == "my-ec2-instance")' | jq --raw-output .StackName