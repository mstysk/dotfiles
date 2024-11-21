#!/bin/bash

get_instance_id() {
  local INSTANCE_NAME=$1
  local QUERY="${2:-Reservations[*].Instances[*].InstanceId}"

  local PROFILE=saml

  if [ -z "$INSTANCE_NAME" ]; then
    echo "Usage: get_instance_id <InstanceName>"
    return 1
  fi

  INSTANCE_ID=$(aws ec2 describe-instances \
    --filters "Name=tag:Name,Values=${INSTANCE_NAME}" \
    --query "${QUERY}" \
    --profile $PROFILE \
    --output text)

  if [ -z "$INSTANCE_ID" ]; then
    echo "No instance found with name '${INSTANCE_NAME}'."
    return 1
  else
    echo "$INSTANCE_ID"
  fi
}

start_session() {
    local TARGET_INSTANCE=$1
    local PROFILE=${2:-saml}

    aws ssm start-session \
        --target ${TARGET_INSTANCE} \
        --profile $PROFILE
}

ec2_instance_name_list() {
    local PROFILE=${1:-saml}
    local QUERY="Reservations[*].Instances[*].Tags[?Key=='Name'].Value"

    aws ec2 describe-instances \
        --query "${QUERY}" \
        --profile $PROFILE \
        --output text
}

select_ssm_session() {
    start_session $(get_instance_id $(ec2_instance_name_list|peco))
}
