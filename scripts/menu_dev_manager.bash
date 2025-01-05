#!/bin/bash
# Author: Mahir Sehmi
# Date: 2024-05-16
# Usage: Run this script only after initialize with dev_init.bash. Refer to README.md for instructions.
# Recommended to run by 'source dev_manager.bash' or '. dev_manager.bash' to avoid issues with sourcing files.

function display_main_menu {
    echo -e "================================================="
    echo -e "              \e[33mDEVELOPMENT MANAGER\e[0m"
    echo -e "================================================="
    echo -e "$BASH_ACTION Select an option:"
    echo -e "=   =   =   =   =   =   =   =   =   =   =   =   ="
    if [ $WS_DEV_SESSION_CHECK -eq 99 ]
    then
        echo -e "\e[33m[1]\e[0m Create new project"
        echo -e "\e[33m[2]\e[0m Clone a project from GitHub"
        echo -e "\e[33m[3]\e[0m Install ROS2 Desktop"
        echo -e "\e[33m[4]\e[0m Install Recommended Software"
    else
        echo -e "\e[33m[1]\e[0m Create new project"
        echo -e "\e[33m[2]\e[0m Create new workspace"
        echo -e "\e[33m[3]\e[0m Clone a project from GitHub"
        echo -e "\e[33m[4]\e[0m Add alias to .bashrc"
        echo -e "\e[33m[5]\e[0m Install ROS2 Desktop"
        echo -e "\e[33m[6]\e[0m Install Recommended Software"
    fi
    echo -e "=   =   =   =   =   =   =   =   =   =   =   =   ="
    echo -e "\e[33m[Q]\e[0m TO EXIT"
}

function main_menu_to_run {
    if [ $WS_DEV_SESSION_CHECK -eq 99 ]
    then
        case $1 in
            1)
                # Create new project
                source $WS_DEV_MANAGER_DIR/scripts/run_create_project_workspace.bash
                ;;
            2)
                # Clone a git workspace
                source $WS_DEV_MANAGER_DIR/scripts/run_clone_project_repo.bash
                ;;
            3)
                # Install ROS2
                source $WS_DEV_MANAGER_DIR/scripts/run_install_ros2.bash
                ;;
            4)
                # Install Recommended Software
                source $WS_DEV_MANAGER_DIR/config/recommended_pkg.bash
                source $WS_DEV_MANAGER_DIR/scripts/func_pkg_operation.bash
                install_apt_packages
                ;;
            *)
                echo -e "$BASH_ERROR Invalid option. Please select a valid option."
                ;;
        esac
    else
        case $1 in
            1)
                # Create new project
                source $WS_DEV_MANAGER_DIR/scripts/run_create_project_workspace.bash
                ;;
            2)
                # Create new workspace
                source $WS_DEV_MANAGER_DIR/scripts/run_create_project_workspace.bash create_workspace_only
                ;;
            3)
                # Clone a git workspace
                source $WS_DEV_MANAGER_DIR/scripts/run_clone_project_repo.bash
                ;;
            4)
                # Add alias to .bashrc
                source $WS_DEV_MANAGER_DIR/scripts/run_auto_add_bashrc.bash $WS_PROJECT_REPO/config/bashrc_list.bash
                ;;
            5)
                # Install ROS2
                source $WS_DEV_MANAGER_DIR/scripts/run_install_ros2.bash
                ;;
            6)
                # Install Recommended Software
                source $WS_DEV_MANAGER_DIR/config/recommended_pkg.bash
                source $WS_DEV_MANAGER_DIR/scripts/func_pkg_operation.bash
                install_apt_packages
                ;;
            *)
                echo -e "$BASH_ERROR Invalid option. Please select a valid option."
                ;;
        esac    
    fi
}

# Main
while true
do
    clear -x
    display_main_menu
    
    read -p "" choice
    if [ "$choice" == "q" ] || [ "$choice" == "Q" ]
    then
        break
    fi
    main_menu_to_run $choice
    echo -e "$BASH_ACTION Press any key to return to menu..."
    read -n 1 -s
done




