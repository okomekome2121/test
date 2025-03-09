#!/bin/bash

ROLE_ARN="arn:aws:iam::617212483723:role/service-role/test_roll"

for FUNCTION in $(aws lambda list-functions --query 'Functions[*].FunctionName' --output text); do
  echo "Updating role for $FUNCTION"
  aws lambda update-function-configuration --function-name $FUNCTION --role $ROLE_ARN
done
