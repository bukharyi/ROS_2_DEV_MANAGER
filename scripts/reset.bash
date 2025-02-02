#!/bin/bash

unset DEV_PROJECT_NAME
unset WS_PROJECT_REPO
unset WS_PROJECT_WORKSPACE
unset OS_DISTRO
unset ROS_DISTRO
unset RMW_IMPLEMENTATION
unset ROS_DOMAIN_ID
unset IPs
unset DEV_PYTHON_ENV_NAME

unalias_if_set() {
    alias_name=$1
    if alias "$alias_name" >/dev/null 2>&1; then
        unalias "$alias_name"
    fi
}

unalias_if_set r2dev
unalias_if_set r2devp
unalias_if_set r2devg
unalias_if_set r2devw
unalias_if_set r2pkg
unalias_if_set r2s
unalias_if_set r2sros
unalias_if_set r2info
unalias_if_set r2alias
unalias_if_set r2b
unalias_if_set r2del
unalias_if_set r2cdw
unalias_if_set r2cdr

