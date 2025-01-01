#!/bin/bash
# ======= ENVIRONMENT =======
export DEV_PROJECT_NAME="PLEASE CLONE OR CREATE PROJECT FIRST!"      # Short name is preferred. Only alphanumeric characters and underscores are allowed.
export OS_DISTRO=$(. /etc/os-release && echo $UBUNTU_CODENAME)
export WS_PROJECT_REPO_DIR_NAME="$(basename $(dirname "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"))"


# ======= ROS SETTINGS ======
export ROS_DISTRO=jazzy # foxy, humble, iron, jazzy
export ROS_DOMAIN_ID=
export RMW_IMPLEMENTATION=
