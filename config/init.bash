#!/bin/bash
# This file will be sourced by the dev_manager tool during workspace initialization.

WS_DEV_MANAGER_REVISION=20250101    # This is used to identify the version of the manager tool. Receommended not to change for now.

# If you want to do something during the initialization of the workspace, you can add it here. Not necessary alias.
source $WS_PROJECT_REPO/config/scripts/project_ws_setup.bash
