#!/bin/bash
#
#

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

# 指定されたプロファイルとキーに対応する値を取得する関数
get_aws_credential() {
    local profile_name="$1"
    local key_name="$2"
    local value=""

    local found=0

    while IFS=' = ' read -r key value; do
        # プロファイルセクションの検出
        if [[ $key == "[$profile_name]" ]]; then
            found=1
            continue
        fi

        # プロファイルセクションが終了したら抜ける
        if [[ $key =~ ^\[.*\]$ ]]; then
            found=0
        fi

        # プロファイルセクション内で指定されたキーを探す
        if [[ $found -eq 1 && $key == "$key_name" ]]; then
            echo "$value"
            return
        fi
    done < ~/.aws/credentials
}

