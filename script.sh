#!/bin/bash

while read -r function_name; do
    echo "Lambda Function: $function_name"
    aws lambda get-function-configuration --function-name "$function_name" --query 'VpcConfig.SecurityGroupIds' --output json
done < input_file.txt

