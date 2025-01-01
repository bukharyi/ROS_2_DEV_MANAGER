# Development Manager for ROS 2
A terminal-based development manager for ROS 2. Designed to streamline workflows, reduce errors, and accelerate development. Compatible with any ROS 2 distro.

Tested with:
- ROS 2 Humble in Ubuntu 22.04
- ROS 2 Jazzy in Ubuntu 24.04

Known issue:
- In Ubuntu 24.04, you may face "EXTERNALLY-MANAGED" error when using python pip package installer and rosdep. Two solutions:
    1. Use python environment as suggested. OR
    2. Remove `/usr/lib/python3.XX/EXTERNALLY-MANAGED` file.


# First Time Basic Setup Tutorial
## 1) Prepare Project Folder
1. Create an empty folder anywhere in your system. (This is the `PROJECTS_FOLDER` as shown in the [Folder Structure] section below. This will be the folder where you will place the dev_manager and project repos.)
2. `cd` into the created folder.
3. Clone this repo as `dev_manager`:
    ```
    git clone https://github.com/mnmahir/ROS_2_DEV_MANAGER.git dev_manager
    ```
## 2) Create New ROS 2 Project using Template
1. `cd` into `dev_manager` dir and run:
    ```
    source dev_init.bash
    ```
    Note:
    - This will initialize a temporary session.
    - The default ROS distro is shown in terminal. You can change the ROS 2 distro supported by your current Ubuntu system by changing the `ROS_DISTRO` parameter in `../dev_manager/temp/config/settings.bash`.
2. Open development manager menu by running this command:
    ```
    r2dev
    ```
    Note:
    - You should see development the menu looking like this:
        ```
        =================================================
              DEVELOPMENT MANAGER
        =================================================
        [ACTION] Select an option:
        =   =   =   =   =   =   =   =   =   =   =   =   =
        [1] Install ROS2
        [2] Install Recommended Software
        [3] Clone a project from GitHub
        [4] Create a new project using template
        [5] Add alias to .bashrc
        =   =   =   =   =   =   =   =   =   =   =   =   =
        [Q] TO EXIT
        ```
3. Choose option `[3]`.
    - Expected output:
        ```
        [ACTION] Select compatible project repository to clone:
        =   =   =   =   =   =   =   =   =   =   =   =   =
        [0] Use custom URL
        [1] https://github.com/mnmahir/ROS_2_DEV_MANAGER.git project_template my_new_project
        PRESS [CTRL] + [C] TO EXIT
        ```
4. Choose option `[1]`.
    - Note:
        - This will create a `my_new_project` folder and clone the content from `project_template` branch.
5. It will ask whether you want to add an alias to `~/.bashrc` which is a shortcut to access your project and initialize this manager from terminal. For this tutorial, just type `y`.
    - Note:
        - This will add an alias to your `~/.bashrc` file. Depending where your `PROJECTS_FOLDER` is located, there will be lines in your `~/.bashrc` looking something like this:
            ```
            # TEMPLATE Development Path
            alias wst='source /media/L/ros/dev_manager/dev_init.bash /my_new_project /ws_robot'
            ```
        - In example above, my `PROJECTS_FOLDER` is `/media/L/ros`.
        - The alias added here is `wst`.
        - By default, your workspace will be in `ws_robot` folder inside `my_new_project` folder.
6. Done! Now you can just type `wst` to access your project workspace. Read the [[Useful Aliases]] section below for shortcuts.
## 3) Modify the Project Settings
1. Go to your`../my_new_project/config` folder, and open `settings.bash`.
2. You can change the default value to your need such as `DEV_PROJECT_NAME`, `ROS_DISTRO`, `ROS_DOMAIN_ID`, etc. or you can add your own.
    - Note:
        - Do not rename or remove the default variable name in `ENVIRONMENT` and `ROS SETTINGS` as it is required by this manager. But, you may change the value.
3. After modifying, type `wst` to re initialize.

# Advanced Setup Tutorial
- Will write full detail soon!
    - For now, explore the `my_new_project` folder:
        - You can change the alias or add more alias in `~/.bahsrc`if you have more than 1 workspace in a single project. Remember to match your directory name and follow the format as shown in [Folder Structure] section below. If your project folder name is not `my_new_project` then change it as well.
        - Inside `pkg` directory of the project, you can change, remove or add the folder name that starts with `_`. This manager will smartly identify the folders inside `pkg` that follow this folder naming format. An example `pkg_list.bash` in the folder can be modified.
        - `pkg_list.bash` is where you can add your frequently used packages and dependencies. See the examples inside the file.
        - I will try write more details about what each files in `pkg` and `config` means in `project_template` branch.

# Recommendation
## 1) Install GitHub CLI
If you want to use this manager with your private GitHub repo, I recommend using GitHub CLI so that this manager can clone your private without issue.
1. Install `git` and `gh`:
    ```
    sudo apt install git gh -y
    ``` 
2. Login to github account:
    ```
    gh auth login
    ```

# Useful Aliases
After initializing the workspace, these are useful aliases you can use. Adding or modifying aliases can be done in project repo under `config` folder.
|Alias|Description|
|-|-|
|`r2dev`|To open development manager.|
|`r2pkg`|To open package manager.|
|`r2s`|Source the `setup.bash` or `local_setup.bash` of ROS environment, currently initialized workspace, `pkg` directories and active workspace (eg: `ws_robot`) workspace. |
|`r2sros`|Source ROS environment.|
|`r2info`|Show information of current active project and workspace.|
|`r2alias`|Currently only show list of aliases that begins with `r2`.|

Operation on project repo directory.
|Alias|Description|
|-|-|
|`r2b`|Colcon build in the initialized `ws_...` workspace.|
|`r2bf`|Same as `r2b` but will run `rosdep` update and install first (Install dependencies). Recommended for first time setup so that all dependencies is installed before building the package.|
|`r2del`|Delete `build`, `install` and optional `log` directory from active `ws_...` workspace directory. Recommended to restart terminal to completely remove traces of sourced packages.|
|`r2cdw`|Change directory to active workspace directory (`ws_...`).|
|`r2cdr`|Change directory to active project directory (eg: `project_repo`).|


# Folder Structure
Recommended to place this development manager repo within the same directory as project repo as shown below:
<pre>
PROJECTS_FOLDER
├── dev_manager (development manager repo)
|   ├── config
|   ├── scripts
|   ├── dev_init.bash
|   └── ...
├── project_repo_1 (project repo)
|   ├── config
|   ├── pkg
|   ├── ws_robot
|   ├── ws_my_stuff
|   └── ...
├── project_repo_2 (project repo)
|   ├── config
|   ├── pkg
|   ├── ws_robot
|   ├── ws_another_one
|   └── ...
└── project_repo_3 (project repo)
    ├── config
    ├── pkg
    ├── ws_robot
    └── ...
</pre>

To use the dev manager, add alias using below format into `.bashrc`:
```
alias <alias>='source <dev_init_path> <repo dir> <ws dir>'
```
where `<repo dir>` dir is relative to PROJECTS_FOLDER dir and `<ws dir>` dir is relative to working repo dir. Make sure the spaces and placement of `/` character is correct.

eg:
```
alias wsr1='source /PROJECTS_FOLDER/dev_manager/dev_init.bash /project_repo_1 /ws_robot'
alias wsr1ms='source /PROJECTS_FOLDER/dev_manager/dev_init.bash /project_repo_1 /ws_mystuff'
alias wsproject2='source /PROJECTS_FOLDER/dev_manager/dev_init.bash /project_repo /ws_robot'
```
You can test the alias and check the `Project Path`, `Project Package Path` and `Active Workspace` is correct. It should look like this for `wsr1` alias:
```
[INFO] Project Path: /PROJECTS_FOLDER/project_repo_1
[INFO] Project Package Path: /PROJECTS_FOLDER/project_repo_1/pkg
[INFO] Active Workspace: /ws_robot
```

## Project Repo Guideline
The project repo must follow the same structure as template. Inside the template contains pre-defined variables for development manager to consume.

Please use the template given if you are creating a new project.

# Future Plan
1. Add Docker support.
2. Add Python environment support.
3. Substitute git repo in pkg with git submodule.
4. `r2b` selected package.
5. Better automatic project creation using template. (For now, read tutorial above)
6. Automatic install and integration of the new Gazebo Sim.

# SUPPORT! :D
 Love this project? Consider buying me a coffee to fuel more late-night coding sessions! Your support helps keep the innovation going. 🙌

<a href="https://www.buymeacoffee.com/mnmahir"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=&slug=mnmahir&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff" /></a>
