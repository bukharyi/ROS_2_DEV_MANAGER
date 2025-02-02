#!/bin/bash
# This file will be sourced by the dev_manager tool during workspace initialization. You can change the value of the variables below or add more variables.

# ======= ENVIRONMENT =======
export DEV_PROJECT_NAME="NAME_OF_PROJECT"
export OS_DISTRO=$(. /etc/os-release && echo $UBUNTU_CODENAME)
export WS_PROJECT_REPO_DIR_NAME="$(basename $(dirname "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"))"


# ======= ROS SETTINGS ======
export ROS_DISTRO=jazzy
export ROS_DOMAIN_ID=8
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp

# ======= PYTHON SETTINGS =======
export WS_PYTHON_ENV_NAME="ros2"     # Name of the python environment. Empty string will use the system python environment.


# Above this line, you are allowed to change the value of the variables.
# But, not recommended to change the name of the variable as it is being used by the manager tool.


# ======= GAZEBO SETTINGS =======
export GZ_SIM_RESOURCE_PATH="$GZ_SIM_RESOURCE_PATH:$WS_PROJECT_REPO"

# ======= LOGGING =======
export RCUTILS_COLORIZED_OUTPUT=1
# export RCUTILS_CONSOLE_OUTPUT_FORMAT="[{severity}][{name}][{time}]: {message} ({function_name}() at {file_name}:{line_number})"
# export RCUTILS_CONSOLE_OUTPUT_FORMAT="[{severity}][{name}][{time}]: {message}"

# ======= GPU ACCELERATION ======= (If using "NVIDIA On-Demand" PRIME profile, uncomment below to run/offload GPU supported application. No need if using "NVIDIA Performance Mode".)
# export __NV_PRIME_RENDER_OFFLOAD=1
# export __GLX_VENDOR_LIBRARY_NAME=nvidia

# ======= LOCAL SETTINGS=======
# source $WS_PROJECT_REPO/config/local/local_settings.bash