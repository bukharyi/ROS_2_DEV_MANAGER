bashrc_list=(
    # You can add more aliases here. How it work is it will add everyline below to .bashrc file. It doesn't matter if it's an alias or something else.
    "# $DEV_PROJECT_NAME Development Path"      # A comment that describe the project so that you can identify it easily.
    "alias wst='source $WS_DEV_INIT_PATH /$WS_PROJECT_REPO_DIR_NAME /ws_robot'"        # Format: (alias <alias>='source $WS_DEV_INIT_PATH <repo dir> <ws dir>'). <repo dir> is relative to PROJECTS_FOLDER dir. <ws dir> is relative to repo dir.
)
