#!/bin/bash
# Author: Mahir Sehmi
# Date: 2024-06-11

DEV_MANAGER_REVISION=20250101	# Functional revision. Change if any new feature is added or any existing feature is modified.

###### GLOBAL ENVIRONMENT ######
export WS_DIR="$(dirname "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")")"
export WS_DEV_INIT_PATH="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/dev_init.bash"
export WS_DEV_MANAGER_DIR_NAME="$(basename $(dirname "$(readlink -f "${BASH_SOURCE[0]}")"))"
export WS_DEV_MANAGER_DIR="$WS_DIR/$WS_DEV_MANAGER_DIR_NAME"

###### RESET PROJECT ENVIRONMENT ######
source $WS_DEV_MANAGER_DIR/scripts/reset.bash


###### PROJECT ENVIRONMENT ######
export WS_PROJECT_REPO="$WS_DIR${1:-/$WS_DEV_MANAGER_DIR_NAME/temp}"
export WS_PROJECT_WORKSPACE="${2:-/ws_robot}"


###### DEVELOPMENT SESSION ######
if [ "$WS_PROJECT_REPO" == "$WS_DIR/$WS_DEV_MANAGER_DIR_NAME/temp" ]; then
	source $WS_DEV_MANAGER_DIR/config/settings.bash
	source $WS_PROJECT_REPO/config/settings.bash
	source $WS_DEV_MANAGER_DIR/config/aliases.bash
	alias r2dev="source $WS_DEV_MANAGER_DIR/dev_manager.bash"
else
	source $WS_DEV_MANAGER_DIR/config/settings.bash
	source $WS_PROJECT_REPO/config/init.bash
	source $WS_PROJECT_REPO/config/settings.bash    # If contain duplicate, this will overwrite settings from dev_manager.
	source $WS_DEV_MANAGER_DIR/config/aliases.bash
	source $WS_PROJECT_REPO/config/aliases.bash     # If contain duplicate, this will overwrite aliases from dev_manager.
	alias r2dev="source $WS_DEV_MANAGER_DIR/dev_manager.bash"
	alias r2pkg="source $WS_DEV_MANAGER_DIR/pkg_manager.bash"
fi

export WS_DEV_SESSION_CHECK=1


###### DISPLAY ######
clear -x
echo -e "\e[33m===================================================================
            ROS 2 Development Manager (by Mahir Sehmi)
==================================================================="
echo -e "$BASH_INFO Initializing..."
if [ "$WS_PROJECT_REPO" != "$WS_DIR/$WS_DEV_MANAGER_DIR_NAME/temp" ]; then
	if [ "$WS_DEV_MANAGER_REVISION" -lt "$DEV_MANAGER_REVISION" ]; then
		echo -e "$BASH_WARNING The current project is using development manager revision \e[36m$WS_DEV_MANAGER_REVISION\e[0m which is older than current manager revision \e[36m$DEV_MANAGER_REVISION\e[0m. You may continue using but some features may not work. Please use older version or upgrade current project repo following the latest content."
	fi

	if [ "$WS_DEV_MANAGER_REVISION" -gt "$DEV_MANAGER_REVISION" ]; then
		echo -e "$BASH_WARNING The current project is using development manager revision \e[36m$WS_DEV_MANAGER_REVISION\e[0m which is newer than current manager revision \e[36m$DEV_MANAGER_REVISION\e[0m. You may continue using but some features may not work. Please upgrade the manager."
	fi
fi
echo "==================================================================="
r2info
if [ "$WS_PROJECT_REPO" == "$WS_DIR/$WS_DEV_MANAGER_DIR_NAME/temp" ]; then
	echo "==================================================================="
	echo -e "$BASH_INFO You have initiated a temporary session. Hence, some information above are not available."
	echo -e "$BASH_INFO Type 'r2dev' and choose '1' to install ROS 2 \e[33m$ROS_DISTRO\e[0m. Change to other ROS distro in temp/config/settings.bash."
	echo -e "$BASH_INFO Type 'r2dev' and choose '3' to clone a project OR create a new project. Other options may not work properly."
	echo -e "$BASH_INFO Refer to README.md for more information."
fi
echo "==================================================================="
if [ "$WS_PROJECT_REPO" != "$WS_DIR/$WS_DEV_MANAGER_DIR_NAME/temp" ]; then
	r2s
	r2cdw
fi
