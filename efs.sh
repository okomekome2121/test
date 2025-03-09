#!/bin/bash

echo -e "EFS_Name\tFileSystemId\tMountTargetId\tSubnetId"
for FILESYSTEM in $(aws efs describe-file-systems --query 'FileSystems[*].FileSystemId' --output text); do
  NAME=$(aws efs describe-file-systems --file-system-id $FILESYSTEM --query 'FileSystems[0].Name' --output text)
  for MOUNT_TARGET in $(aws efs describe-mount-targets --file-system-id $FILESYSTEM --query 'MountTargets[*].[MountTargetId,SubnetId]' --output text); do
    echo -e "$NAME\t$FILESYSTEM\t$MOUNT_TARGET"
  done
done

