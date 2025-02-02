# This file will be sourced by the dev_manager tool during workspace initialization. You can also run this using `r2s` command.
# This file contains the list of files that need to be sourced during the initialization of the workspace.
# You can add any file that you want to be sourced during the initialization of the workspace.

SOURCE_LIST=(
    # Below are the common source list.
    "/opt/ros/$ROS_DISTRO/setup.bash"
    "/usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash"
    "$WS_PROJECT_REPO$WS_PROJECT_WORKSPACE/install/local_setup.bash"    # This is the workspace setup file. It is recommended to keep it here.
    # If you have more things to source, you can add it below.
    
)

# Below script will automatically add all the packages that start with '_' in 'pkg' directory to ensure that all the packages are sourced.
PKG_DIR_LIST=($(ls $WS_PROJECT_REPO/pkg | grep -E "^_"))
for ((i=0; i<${#PKG_DIR_LIST[@]}; i++))
do
    SOURCE_LIST+=("$WS_PROJECT_REPO/pkg/${PKG_DIR_LIST[$i]}/install/local_setup.bash")
done

# Source python environment first if WS_PYTHON_ENV_NAME is set
if [[ ! -z "$WS_PYTHON_ENV_NAME" ]]
then
    SOURCE_LIST=("$WS_PROJECT_REPO/pkg/pyenv/$WS_PYTHON_ENV_NAME/bin/activate" "${SOURCE_LIST[@]}")
fi