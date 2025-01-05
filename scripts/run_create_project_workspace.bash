#!/bin/bash
# Author: Mahir Sehmi
# Date: 2025-01-03
# Usage: Make sure to source dev_init.bash first before running this script.


# To check if dev_init.bash has been sourced.
if [[ -z "$WS_DEV_SESSION_CHECK" ]]
then
 echo -e "$BASH_ERROR Make sure dev_init.bash is sourced. Refer to README.md for instructions."
 echo -e "$BASH_ACTION PRESS [ENTER] TO EXIT"
 read
 exit 1
fi

function init_workspace {
    PROJECT_DIR_NAME=/${1:-$WS_PROJECT_DIR_NAME}
    WS_PROJECT_WORKSPACE=/${2:-$WS_PROJECT_WORKSPACE}

    echo -e "$BASH_ACTION Would you like to access and initialize the project workspace now? [y/n]"
    read -p "" INIT_PROJECT

    if [[ ! $INIT_PROJECT =~ ^([nN][oO]|[nN])$ ]]
    then
        source $WS_DEV_MANAGER_DIR/dev_init.bash $PROJECT_DIR_NAME $WS_PROJECT_WORKSPACE
        echo -e "==================================================================="
    fi

    echo -e "$BASH_INFO You can access and initialize your project workspace by running:"
    echo -e "\e[36msource $WS_DEV_MANAGER_DIR/dev_init.bash $PROJECT_DIR_NAME $WS_PROJECT_WORKSPACE\e[0m"
    echo -e "$BASH_ACTION Would you like to create an alias for it in \e[36m~/.bashrc\e[0m? [y/n]"
    read -p "" CREATE_ALIAS

    if [[ ! $CREATE_ALIAS =~ ^([nN][oO]|[nN])$ ]]
    then
        echo -e "$BASH_ACTION Enter the alias name:"
        read -p "" ALIAS_NAME
        while [[ ! $ALIAS_NAME =~ ^[a-zA-Z0-9_]+$ ]]
        do
            echo -e "$BASH_ERROR Alias name must be alphanumeric separated by underscore."
            echo -e "$BASH_ACTION Enter the alias name:"
            read -p "" ALIAS_NAME
        done
        echo -e "alias $ALIAS_NAME=\"source $WS_DEV_MANAGER_DIR/dev_init.bash $PROJECT_DIR_NAME $WS_PROJECT_WORKSPACE\"" >> ~/.bashrc
        # check if the line is added
        if grep -qF "alias $ALIAS_NAME=\"source $WS_DEV_MANAGER_DIR/dev_init.bash $PROJECT_DIR_NAME $WS_PROJECT_WORKSPACE\"" ~/.bashrc; then
            alias $ALIAS_NAME="source $WS_DEV_MANAGER_DIR/dev_init.bash $PROJECT_DIR_NAME $WS_PROJECT_WORKSPACE"
            echo -e "$BASH_SUCCESS \e[36malias $ALIAS_NAME=\"source $WS_DEV_MANAGER_DIR/dev_init.bash $PROJECT_DIR_NAME $WS_PROJECT_WORKSPACE\"\e[0m added to \e[36m~/.bashrc\e[0m"
            echo -e "$BASH_INFO Just type \e[36m$ALIAS_NAME\e[0m to access the project workspace."
        else
            echo -e "$BASH_ERROR Could not add alias: \e[36m$ALIAS_NAME\e[0m"
            echo -e "$BASH_ACTION Add the alias manually in $WS_DEV_MANAGER_DIR/config/aliases.bash"
        fi
    fi
}

function create_project {
    PROJECT_DIR_NAME=${1:-"new_project"}
    WS_PROJECT_WORKSPACE=/${2:-"ws_robot"}
    ROS_DISTRO=${3:-"jazzy"}
    DEV_PROJECT_NAME=${4:-"New Project"}

    echo -e "$BASH_INFO Creating project \e[36m$DEV_PROJECT_NAME\e[0m in \e[36m$PROJECT_DIR_NAME\e[0m"

    if [ -d "$WS_DIR/$PROJECT_DIR_NAME" ]
    then
        echo -e "$BASH_ERROR Project directory \e[36m$PROJECT_DIR_NAME\e[0m already exists. Cannot create project."
    else
        echo -e "$BASH_INFO Creating new \e[36m$DEV_PROJECT_NAME\e[0m project in \e[36m$WS_DIR/$PROJECT_DIR_NAME\e[0m"
        cp -r $WS_DEV_MANAGER_DIR/temp/project_template $WS_DIR/$PROJECT_DIR_NAME
        
        # replace values and names
        sed -i "s/NAME_OF_PROJECT/$DEV_PROJECT_NAME/g" $WS_DIR/$PROJECT_DIR_NAME/config/settings.bash
        sed -i "s/jazzy/$ROS_DISTRO/g" $WS_DIR/$PROJECT_DIR_NAME/config/settings.bash

        mv $WS_DIR/$PROJECT_DIR_NAME/ws_template $WS_DIR/$PROJECT_DIR_NAME$WS_PROJECT_WORKSPACE

        if [ -d "$WS_DIR/$PROJECT_DIR_NAME" ]
        then
            echo -e "$BASH_SUCCESS Project \e[36m$DEV_PROJECT_NAME\e[0m created at \e[36m$WS_DIR/$PROJECT_DIR_NAME\e[0m"
            init_workspace $PROJECT_DIR_NAME $WORKSPACE_DIR_NAME
        else
            echo -e "$BASH_ERROR Could not create project \e[36m$DEV_PROJECT_NAME\e[0m"
        fi   
    fi

}

function create_workspace {
    WS_PROJECT_WORKSPACE=/${1:-"ws_robot"}
    PROJECT_DIR_NAME=$WS_PROJECT_DIR_NAME
    
    if [ -d "$WS_DIR/$PROJECT_DIR_NAME$WS_PROJECT_WORKSPACE" ]
    then
        echo -e "$BASH_ERROR Workspace directory \e[36m$WS_PROJECT_WORKSPACE\e[0m already exists. Cannot create workspace."
    else
        echo -e "$BASH_INFO Creating workspace \e[36m$WS_PROJECT_WORKSPACE\e[0m in \e[36m$PROJECT_DIR_NAME\e[0m"
        cp -r $WS_DEV_MANAGER_DIR/temp/project_template/ws_template $WS_DIR/$PROJECT_DIR_NAME$WS_PROJECT_WORKSPACE
        # check if the workspace is created successfully
        if [ -d "$WS_DIR/$PROJECT_DIR_NAME$WS_PROJECT_WORKSPACE" ]
        then
            echo -e "$BASH_SUCCESS Workspace \e[36m$WS_PROJECT_WORKSPACE\e[0m created in \e[36m$WS_DIR/$PROJECT_DIR_NAME\e[0m"
            init_workspace $PROJECT_DIR_NAME $WORKSPACE_DIR_NAME
        else
            echo -e "$BASH_ERROR Could not create workspace \e[36m$WS_PROJECT_WORKSPACE\e[0m"
        fi
    fi
}




function create_project_menu {
    echo -e "$BASH_INFO A new project will be created in \e[36m$WS_DIR\e[0m "
    echo -e "$BASH_ACTION Project Name:"
    read -p "" PROJECT_NAME

    echo -e "$BASH_ACTION Project Directory Name (e.g.: my_project):"
    read -p "" PROJECT_DIR_NAME
    while [[ ! $PROJECT_DIR_NAME =~ ^[a-zA-Z0-9_]+$ ]]
    do
        echo -e "$BASH_ERROR Project directory name must be alphanumeric separated by underscore."
        echo -e "$BASH_ACTION Project Directory Name (e.g.: my_project):"
        read -p "" PROJECT_DIR_NAME
    done

    # Workspace related information
    echo -e "$BASH_ACTION Workspace Directory Name (e.g.: ws_robot):"
    read -p "" WORKSPACE_DIR_NAME
    while [[ ! $WORKSPACE_DIR_NAME =~ ^[a-zA-Z0-9_]+$ ]]
    do
        echo -e "$BASH_ERROR Workspace directory name must be alphanumeric separated by underscore."
        echo -e "$BASH_ACTION Workspace Directory Name (e.g.: ws_robot):"
        read -p "" WORKSPACE_DIR_NAME
    done

    echo -e "$BASH_ACTION Set this project using ROS 2 \e[33m$ROS_DISTRO\e[0m distro?"
    echo "PRESS [ENTER] TO CONTINUE"
    echo "PRESS [N] TO CHANGE DISTRO"
    read -p "" USE_DISTRO
    if [[ $USE_DISTRO =~ ^([nN][oO]|[nN])$ ]]
    then
        echo -e "$BASH_ACTION Enter the ROS 2 distro you want to use (e.g.: foxy/galactic/humble/iron/jazzy/...):"
        read -p "" ROS_DISTRO
    fi

    create_project $PROJECT_DIR_NAME $WORKSPACE_DIR_NAME $ROS_DISTRO "$PROJECT_NAME"
}

function create_workspace_menu {
    echo -e "$BASH_INFO A new workspace will be created in \e[36m$WS_PROJECT_REPO\e[0m "
    echo -e "$BASH_ACTION Workspace Directory Name (e.g.: ws_robot):"
    read -p "" WORKSPACE_DIR_NAME
    while [[ ! $WORKSPACE_DIR_NAME =~ ^[a-zA-Z0-9_]+$ ]]
    do
        echo -e "$BASH_ERROR Workspace directory name must be alphanumeric separated by underscore."
        echo -e "$BASH_ACTION Workspace Directory Name (e.g.: ws_robot):"
        read -p "" WORKSPACE_DIR_NAME
    done

    create_workspace $WORKSPACE_DIR_NAME
}

echo -e "================================================="
echo -e "          Project and Workspace Creator          "
echo -e "================================================="

if [[ $1 == "create_workspace_only" ]]
then
    create_workspace_menu
else
    create_project_menu
fi


