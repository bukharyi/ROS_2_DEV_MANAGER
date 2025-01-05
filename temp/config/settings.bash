#!/bin/bash
# ======= ENVIRONMENT =======
export DEV_PROJECT_NAME="PLEASE CLONE OR CREATE PROJECT FIRST!"
export OS_DISTRO=$(. /etc/os-release && echo $UBUNTU_CODENAME)
export WS_PROJECT_REPO_DIR_NAME="$(basename $(dirname "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"))"


# ======= ROS SETTINGS ======
export ROS_DISTRO=jazzy # ROS 2 distro such as foxy/galactic/humble/iron/jazzy/...

