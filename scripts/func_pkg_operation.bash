#######################
# Install apt packages
#######################
function install_apt_packages() {
    local auto_confirm=false
    if [[ "$1" == "-y" ]]; then
        auto_confirm=true
    fi

    if [ ${#LIST_APT_PKG[@]} -eq 0 ]
    then
        echo -e "$BASH_INFO No apt packages to install. Skipping..."
    else
        echo -e "$BASH_INFO The following apt packages will be installed:"
        for pkg in "${LIST_APT_PKG[@]}"; do
            echo -e "\e[33m$pkg\e[0m"
        done

        if [ "$auto_confirm" = false ]; then
            echo -e "$BASH_ACTION  Do you want to continue? (y/n)"
            read -r response
        else
            response="y"
        fi

        if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
        then
            echo -e "$BASH_INFO Installing apt packages..."
            for pkg in "${LIST_APT_PKG[@]}"; do
                sudo apt install $pkg -y
            done
            r2sros
        else
            echo -e "$BASH_INFO Installation of apt packages skipped."
        fi
    fi
}


#######################
# Install Python packages
#######################
function install_python_packages() {
    local auto_confirm=false
    if [[ "$1" == "-y" ]]; then
        auto_confirm=true
    fi

    if [ ${#LIST_PYTHON_PKG[@]} -eq 0 ]
    then
        echo -e "$BASH_INFO No Python packages to install. Skipping..."
    else
        echo -e "$BASH_INFO The following Python packages will be installed:"
        for pkg in "${LIST_PYTHON_PKG[@]}"; do
            echo -e "\e[33m$pkg\e[0m"
        done

        if [ "$auto_confirm" = false ]; then
            echo -e "$BASH_ACTION  Do you want to continue? (y/n)"
            read -r response
        else
            response="y"
        fi

        if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
        then
            echo -e "$BASH_INFO Installing Python packages..."
            for pkg in "${LIST_PYTHON_PKG[@]}"; do
                pip3 install $pkg
            done
            r2sros
        else
            echo -e "$BASH_INFO Installation of Python packages skipped."
        fi
    fi
}


#######################
# Clone git packages
#######################
function clone_git_packages() {
    local auto_confirm=false
    if [[ "$1" == "-y" ]]; then
        auto_confirm=true
    fi

    if [ ${#LIST_GIT_REPO[@]} -eq 0 ]
    then
        echo -e "$BASH_INFO No git packages to clone. Skipping..."
    else
        echo -e "$BASH_INFO The following git repositories will be cloned:"
        for repo in "${LIST_GIT_REPO[@]}"; do
            echo -e "\e[33m$repo\e[0m"
        done

        if [ "$auto_confirm" = false ]; then
            echo -e "$BASH_ACTION  Do you want to continue? (y/n)"
            read -r response
        else
            response="y"
        fi

        if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
        then
            echo -e "$BASH_INFO Cloning git packages..."
            # Create src directory if not exist
            mkdir -p $CLONE_DIR
            cd $CLONE_DIR
            for repo in "${LIST_GIT_REPO[@]}"; do
                IFS=' ' read -r -a array <<< "$repo"
                git_clone ${array[0]} ${array[1]}
            done
            cd $CURRENT_TERMINAL_DIR
        else
            echo -e "$BASH_INFO Cloning of git packages skipped."
        fi
    fi
}


#######################
# Execute commands
#######################
function execute_commands() {
    local auto_confirm=false
    if [[ "$1" == "-y" ]]; then
        auto_confirm=true
    fi

    if [ ${#LIST_EXEC_CMD[@]} -eq 0 ]
    then
        echo -e "$BASH_INFO No commands to execute. Skipping..."
    else
        echo -e "$BASH_INFO The following commands will be executed:"
        for cmd in "${LIST_EXEC_CMD[@]}"; do
            echo -e "\e[33m$cmd\e[0m"
            echo
        done

        if [ "$auto_confirm" = false ]; then
            echo -e "$BASH_ACTION  Do you want to continue? (y/n)"
            read -r response
        else
            response="y"
        fi

        if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
        then
            echo -e "$BASH_INFO Executing commands..."
            for cmd in "${LIST_EXEC_CMD[@]}"; do
                echo -e "$BASH_INFO Executing: \e[36m$cmd\e[0m"
                $cmd
            done
        else
            echo -e "$BASH_INFO Execution of commands skipped."
        fi
    fi
}