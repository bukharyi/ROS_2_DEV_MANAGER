SOURCE_LIST=(
    # Below are the default source list. Recommended to not change it.
    "/opt/ros/$ROS_DISTRO/setup.bash"
    "/usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash"
    "$WS_PROJECT_REPO$WS_PROJECT_WORKSPACE/install/local_setup.bash"
    # If you have more things to source, you can add it below.
    
)

# Below script will automatically add all the packages that start with '_' in 'pkg' directory to ensure that all the packages are sourced.
PKG_DIR_LIST=($(ls $WS_PROJECT_REPO/pkg | grep -E "^_"))
for ((i=0; i<${#PKG_DIR_LIST[@]}; i++))
do
    SOURCE_LIST+=("$WS_PROJECT_REPO/pkg/${PKG_DIR_LIST[$i]}/install/local_setup.bash")
done