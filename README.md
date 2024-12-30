# Development Manager for ROS 2
A terminal-based development manager for ROS 2. Designed to streamline workflows, reduce errors, and accelerate development. Compatible with any ROS 2 distro. Just change the `ROS_DISTRO` parameter in `project_repo/config/settings.bash`.

Tested working with:
- Ubuntu 20.04
- Ubuntu 22.04
- Ubuntu 24.04
- ROS 2 Foxy
- ROS 2 Humble
- ROS 2 Iron
- ROS 2 Jazzy

# Setup Tutorial
### 1. Setting up project folder
1. Install `git` and `gh`:
   ```
   sudo apt install git gh -y
   ``` 
2. Login to github account (Recommended for clonning private repo easily):
    ```
    gh auth login
    ```
3. Create an empty folder. (This is the `PROJECTS_FOLDER` as shown in the "Folder Structure" section below. This will be the folder where you will place the dev_manager and project repos.)
4. `cd` into the created folder.
5. Clone this repo as `dev_manager`:
    ```
    git clone https://github.com/mnmahir/ROS_2_DEV_MANAGER.git dev_manager
    ```
6. Done! Continue to (2.) or options in (3.)
### 2. Install ROS 2 using dev manager (Optional if you haven't install ROS 2)
1. `cd` into `dev_manager` dir and run:
    ```
    source dev_init.bash
    ```
    This will initialize a temporary session. The default ROS distro is shown in terminal. You can change the ROS 2 distro by changing the `ROS_DISTRO` parameter in `../dev_manager/template/project_repo/config/settings.bash`.
2. Type `r2dev` in terminal to open development manager menu.
   1. Choose `1` to install ROS 2.
   2. You may view and install recommended software by choosing `2`.
3. Done! Now continue to one of the options in (3.).

### 3. Adding Project Repository
- **(OPTION A)** Creating New Project Repository using Template:
    1. In `dev_manager/template`, copy the `project_repo` folder into your created `PROJECTS_FOLDER`. Refer folder structure below.
    2. `cd` into `dev_manager` dir and run:
        ```
        source dev_init.bash /project_repo /ws_robot
        ```
    3. Type `r2dev` in terminal to open development manager menu. Then, choose `5` to automatically add alias/shortcut to .bashrc.
        - An example of alias you can use will be shown on the terminal. Remember it so that you can access your project easily by typing the alias in terminal.
        - For this template, the alias it is defaulted to `wst`. You can change this in `../project_repo/config/bashrc_list.bash` and `~/.bashrc`.
    4. Done! Your project workspace is ready! Try access and initialize your project by typing `wst` in new terminal!

- **(OPTION B)** Clone Project Repository from GitHub:
    - For this option, the GitHub project repo must follow the same folder structure and files as in template.
1. Type `r2dev` in terminal to open development manager menu. Then, choose `3` to clone project repo from GitHub.
    - It will prompt whether to add aliases/shortcut to `.bashrc` automatically. Accept it.
    - After accepting, it will automatically add aliases to `.bashrc` and show examples of aliases on the terminal. Remember it so that you can access your project easily by typing the alias in terminal.
2. Done! Your project workspace is ready! Try access your project using alias in new terminal!

### 4. Configuring Your Project Repository
- __Modify your project settings__:
    1. Open `<project_repo>/config/settings.bash`.
    2. If you are accessing this from a template, you can adjust the value but do not change the existing variable name as they are critical for the workflow of this development manager tool. (example of existing variable: `DEV_PROJECT_NAME`, `OS_DISTRO`, `WS_PROJECT_REPO_DIR_NAME`, `ROS_DISTRO`, ...)
    3. You may change the value of existing variable or add new one that fits your need.
- __Add/Modify the automatic alias adder for accessing project workspace using alias__: 
    1. Open `<project_repo>/config/bashrc_list.bash`.
    2. Add/modify workspace:
        - **Modify workspace alias**: Change `wst` in `"alias wst='source $WS_DEV_INIT_PATH /$WS_PROJECT_REPO_DIR_NAME /ws_robot'"` to something else. (e.g:`wsrobot` in `"alias wsrobot='source $WS_DEV_INIT_PATH /$WS_PROJECT_REPO_DIR_NAME /ws_robot'"`).
        - **Add workspace alias**: If you wish to have more than 1 workspace, then create a folder in the same project repo and name it anything you want. Then add a new line in following this format:
        ```
        alias <alias>='source <dev_init_path> <repo dir> <ws dir>'
        ```
        the `<ws dir>` must be the same name as your newly created folder. Remember the `/` is important.
    
    3. An example of the modified `bashrc_list.bash` should look like this:
        ```
        bashrc_list=(
            "# $DEV_PROJECT_NAME Development Path"
            "alias wsrb='source $WS_DEV_INIT_PATH /$WS_PROJECT_REPO_DIR_NAME /ws_robot'"
            "alias wssim='source $WS_DEV_INIT_PATH /$WS_PROJECT_REPO_DIR_NAME /ws_sim'"
            "alias wstest='source $WS_DEV_INIT_PATH /$WS_PROJECT_REPO_DIR_NAME /ws_testing'"
        )
        ```
    4. Type `r2dev` and choose `5` to add these aliases to `~/.bashrc`. Example of output to `~/.bashrc` will look something like this:
        ```
        # TEMPLATE Development Path
        alias wsrb='source /media/L/ros/dev_manager/dev_init.bash /project_repo /ws_robot'
        alias wssim='source /media/L/ros/dev_manager/dev_init.bash /project_repo /ws_sim'
        alias wstest='source /media/L/ros/dev_manager/dev_init.bash /project_repo /ws_testing'
        ```
- Will write more tutorial for this section 4 if needed...

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
where `<repo dir>` dir is relative to PROJECTS_FOLDER dir and `<ws dir>` dir is relative to working repo dir.

eg:
```
alias wsrobot1='source ~/WORKSPACE/dev_manager/dev_init.bash /project_repo_1 /ws_robot'
alias wsrobot2='source ~/WORKSPACE/dev_manager/dev_init.bash /project_repo_2 /ws_robot'
alias wsrobot3='source ~/WORKSPACE/dev_manager/dev_init.bash /project_repo_3 /ws_robot'
```
## Project Repo Guideline
The project repo must follow the same structure as template. Inside the template contains pre-defined variables for development manager to consume.

Please use the template given if you are creating a new project.

# Future Plan
1. Add Docker support.
2. Automatic project creation using template. (For now read tutorial 3A).
3. Automatic install and integration of Gazebo Sim.

# SUPPORT! :D
 Love this project? Consider buying me a coffee to fuel more late-night coding sessions! Your support helps keep the innovation going. 🙌

<a href="https://www.buymeacoffee.com/mnmahir"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=&slug=mnmahir&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff" /></a>
