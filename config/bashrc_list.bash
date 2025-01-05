bashrc_list=(
    # When you run `r2dev` command and choose "Add alias to .bashrc". This is the list of aliases that will be added to .bashrc file.
    # Technically, you can add anything to this list. It doesn't have to be an alias. It can be anything that you want to add to .bashrc file.
    # It will check if each line is already in .bashrc file. If it's not, it will add it to the end of the file.
    "# $DEV_PROJECT_NAME Development Path"      # A comment that describe the project so that you can identify it easily.
    "alias wst='source $WS_DEV_INIT_PATH /$WS_PROJECT_REPO_DIR_NAME /ws_template'"        # Format: (alias <alias>='source $WS_DEV_INIT_PATH <repo dir> <ws dir>'). <repo dir> is relative to PROJECTS_FOLDER dir. <ws dir> is relative to repo dir.
)
