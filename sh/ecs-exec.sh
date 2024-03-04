#!?bin/bash

$CLUSTER_NAME="$1"
$TASK_ARN="$2"
$CONTAINER_NAME="$3"
$COMMAND="$4:-/bin/sh"

aws ecs execute-command \
    --cluster ${CLUSTER_NAME} \
    --task ${TASK_ARN}  \
    --container ${CONTAINER_NAME} \
    --interactive \
    --command ${COMMAND}
