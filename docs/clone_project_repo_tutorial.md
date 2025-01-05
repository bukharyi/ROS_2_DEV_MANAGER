### [ [HOME](../README.md) ]
# Clone Project from Existing Remote Git Repository Tutorial
### Note: 
Your project must follow the structure as in `temp/project_template`. If you have been using this tool for your project, then you can proceed with this tutorial. If not, you still can try this tutorial to see how it work.

### Recommendation:
If your project is a private GitHub repo, I recommend using GitHub CLI so that this manager can clone your private GitHub repo without issue.
1. Install `git` and `gh`:
    ```
    sudo apt install git gh -y
    ``` 
2. Login to github account:
    ```
    gh auth login
    ```
## Fast Tutorial
1. Create an empty folder.
2. Clone this repository into that folder.
3. Source the `dev_init.bash`.
4. (Optional: If you haven't install ROS 2) Type `r2dev`to open menu and choose the option to Install ROS 2.
5. Type `r2devg` to clone project from remote git repository.

That's it! You can now start inventing!

## Detailed Tutorial
1. Create an empty folder (e.g.: `PROJECTS_FOLDER`). This will be the folder to place all your projects and this manager tool.
2. Inside the folder, clone this repository. To make sure we are on the same page, clone it as `dev_manager` directory. Run this:
    ```
    git clone https://github.com/mnmahir/ROS_2_DEV_MANAGER.git dev_manager
    ```
3. At this point, your folder structure should look like this:
    <pre>
    PROJECTS_FOLDER
    └── dev_manager (development manager directory)
        ├── config
        ├── scripts
        ├── dev_init.bash
        └── ...    </pre>
4. Now, inside dev_manager, source the `dev_init.bash` file. Run this:
    ```
    source dev_init.bash
    ```
    After sourcing, you should see this in your terminal:
    <pre>
    ===================================================================
            ROS 2 Development Manager (by Mahir Sehmi)
    ===================================================================
    [INFO] Initializing...
    ===================================================================
    [INFO] WELCOME TO ROS 2 DEVELOPMENT MANAGER
    ===================================================================
    [INFO] Type 'r2devp' to create a new project.
    [INFO] Type 'r2devg' to clone git project.
    [INFO] Type 'r2dev' for menu.
    [INFO] Refer to README.md for more information.
    </pre>
5. (Optional: If you haven't install ROS 2)<br>
    1. Type `r2dev`to open manager menu. You should see:
    <pre>
    =================================================
              DEVELOPMENT MANAGER
    =================================================
    [ACTION] Select an option:
    =   =   =   =   =   =   =   =   =   =   =   =   =
    [1] Create new project
    [2] Clone a project from GitHub
    [3] Install ROS2 Desktop
    [4] Install Recommended Software
    =   =   =   =   =   =   =   =   =   =   =   =   =
    [Q] TO EXIT</pre>
    2. Choose option `[3]` to Install ROS 2.
    3. It will prompt whether you whether the ROS 2 distro that it is going to install is correct. If not, change it to the one compatible with your system.
6. To create a new project, you can just type:
    ```
    r2devg
    ```
    1. You should see this menu:
        <pre>=================================================
            Git Project Repository Cloner          
        =================================================
        [INFO] A git project repository will be cloned in /PROJECTS_FOLDER 
        [ACTION] Select git project repository to clone:
        =   =   =   =   =   =   =   =   =   =   =   =   =
        [0] Use custom URL</pre>
    2. Type `[0]` and it will ask you to enter the details of your project. You can follow along the example below:
    
        `[ACTION] Enter the URL of the repository:`
        ```
        https://github.com/mnmahir/ROS_2_DEV_MANAGER.git
        ```
        `[ACTION] Enter the branch/commit ID/tag of the repository (If empty will clone default branch):`
        ```
        project_template
        ```
        `[ACTION] Enter the directory name of the repository (If empty will use the name from URL):`
        ```
        my_new_project
        ```
    3. After entering the details above, you should see this:
        <pre>
        [INFO] Cloning https://github.com/mnmahir/ROS_2_DEV_MANAGER.git at /PROJECTS_FOLDER.
        [INFO] into 'my_project' directory.
        Cloning into 'my_project'...
        remote: Enumerating objects: 180, done.
        remote: Counting objects: 100% (180/180), done.
        remote: Compressing objects: 100% (139/139), done.
        remote: Total 180 (delta 80), reused 118 (delta 32), pack-reused 0 (from 0)
        Receiving objects: 100% (180/180), 58.73 KiB | 4.89 MiB/s, done.
        Resolving deltas: 100% (80/80), done.
        [INFO] Checking out project_template
        branch 'project_template' set up to track 'origin/project_template'.
        Switched to a new branch 'project_template'
        fatal: No names found, cannot describe anything.
        [SUCCESS] Successfuly checked out 'project_template'.
        [INFO] Initializing any submodule.
        [SUCCESS] Done cloning 'https://github.com/mnmahir/ROS_2_DEV_MANAGER.git'.</pre>
    4. It will then ask you whether you want to add the project workspace initializer. Type 'y' or [ENTER] and you should see this:
        
        (Note: you can configure this feature in your project `config/bashrc_list.bash`)
        <pre>[ACTION] Do you want to add the project workspace initializer alias to .bashrc? Accepting this will also intialize default 'ws_robot' workspace. [y/n]
        y
        [INFO] Adding aliases to .bashrc...
        bash: source: /PROJECTS_FOLDER: is a directory
        [INFO] Project Name: NAME_OF_PROJECT
        [INFO] The following lines will be added to the .bashrc file:
        =================================================
        # NAME_OF_PROJECT Development Path
        alias wst='source /PROJECTS_FOLDER/dev_manager/dev_init.bash /my_new_project /ws_robot'
        =================================================
        [SUCCESS] Added to .bashrc: # NAME_OF_PROJECT Development Path
        [SUCCESS] Added to .bashrc: alias wst='source /PROJECTS_FOLDER/dev_manager/dev_init.bash /my_new_project /ws_robot'
        =================================================</pre>
        

7. At this point, your folder structure should look like this:
    <pre>
    PROJECTS_FOLDER
    ├── dev_manager (development manager directory)
    |   ├── config
    |   ├── scripts
    |   ├── dev_init.bash
    |   └── ...
    └── my_project (project directory)
        ├── config
        ├── pkg
        └── ...</pre>

8. We are done! You can either use your defined alias to initialize and access your project's workspace. If you haven't setup your `config/bashrc_list.bash` to access your workspaces in your project, you can always do this way:
    ```
    source dev_init.bash <project dir> <ws dir>
    ```
    Example:
    ```
    source dev_init.bash /project_dir_1 /ws_robot
    ```



# SUPPORT! 😃
 Love this project? Consider buying me a coffee to fuel more late-night coding sessions! Your support helps keep the innovation going. 🙌

<a href='https://ko-fi.com/H2H818H9M3' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://storage.ko-fi.com/cdn/kofi2.png?v=6' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>

If you have a suggestion or an interesting idea that you want me to add into this tool, let me know! Feel free to contribute!