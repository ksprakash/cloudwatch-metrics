#!/bin/bash
# aws ec2 describe-instances \
#     --filters Name=instance-state-name,Values=running \
#     --query 'Reservations[*].Instances[*].{Name:Tags[?Key==`Name`]|[0].Value,Instance:InstanceId,Type:InstanceType}' \
#     --output text >> instances.csv

aws ec2 describe-instances \
    --filters Name=instance-state-name,Values=running \
    --query 'Reservations[*].Instances[*].{Name:Tags[?Key==`Name`]|[0].Value,Instance:InstanceId}' \
    --output text >> instances.csv