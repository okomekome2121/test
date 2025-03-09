#!/bin/bash

for FUNCTION in $(aws lambda list-functions --query 'Functions[*].FunctionName' --output text); do
  echo "Lambda Function: $FUNCTION"
  aws lambda get-function-configuration --function-name $FUNCTION --query 'VpcConfig.SecurityGroupIds' --output text
  echo "-----------------------------------"
done

