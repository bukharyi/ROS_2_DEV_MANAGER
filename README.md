# Development Manager for ROS 2
A terminal-based ROS 2 project workspace management and development framework. Designed to streamline workflows, reduce errors and mistakes, and accelerate development with smart and automated features. Compatible with any ROS 2 distro.

### Why use this?
- You just got a new PC and want to start working on your ROS 2 project with minimal setup and configuration process.
- You have multiple ROS 2 projects but each using different package version or environment configuration and don't want to mix them up. But, you are lazy to go through setup and configuration process.
- You have a list of your favourite packages for your project but don't have a way to install them automatically.
- You keep forgetting to source your package after building.
- You build your package in the wrong directory and ended up wasting time debugging and have to clean up your workspace.
- You want a clean and organized workspace so that you can navigate your project easily.

Well... Give this tool a try. Most common multi-step processes has been consodilated into one smart push button (See useful aliases below)😃


### Tested with
- ROS 2 Humble in Ubuntu 22.04 (x86 and ARM)
- ROS 2 Jazzy in Ubuntu 24.04 (x86 and ARM)


# Tutorial
- [Create New Project](docs/create_new_project_tutorial.md) - If you are new, start here!
- [Clone Project from Existing Remote Git Repository](docs/clone_project_repo_tutorial.md)

# Recommendation
If you want to use this manager with your private GitHub repo, I recommend using GitHub CLI so that this manager can clone your private GitHub repo without issue.
1. Install `git` and `gh`:
    ```
    sudo apt install git gh -y
    ``` 
2. Login to github account:
    ```
    gh auth login
    ```

# Aliases
I have consolidated several common commands and processes into a few aliases which you can use. Adding or modifying aliases can be done in project repo under `config` folder.

### Setup Operation.
|Alias|Description|
|-|-|
|`r2devp`|To create a new project.|
|`r2devg`|To clone existing project from remote repo such as GitHub.|
|`r2devw`|To create a new workspace dir under project dir.|

### General
|Alias|Description|
|-|-|
|`r2dev`|To open development manager menu.|
|`r2pkg`|To open package manager menu.|
|`r2s`|Source the `setup.bash` or `local_setup.bash` of ROS environment, currently initialized workspace, `pkg` directories and active workspace (eg: `ws_robot`) workspace. |
|`r2sros`|Source ROS environment.|
|`r2info`|Show information of current active project and workspace.|
|`r2alias`|Currently only show list of aliases that begins with `r2`.|

### Operation on workspace directory.
|Alias|Description|
|-|-|
|`r2b`|Colcon build in the initialized `ws_...` workspace.|
|`r2bf`|Same as `r2b` but will run `rosdep` update and install first (Install dependencies). Recommended for first time setup so that all dependencies is installed before building the package.|
|`r2del`|Delete `build`, `install` and optional `log` directory from active `ws_...` workspace directory. Recommended to restart terminal to completely remove traces of sourced packages.|
|`r2cdw`|Change directory to active workspace directory (`ws_...`).|
|`r2cdr`|Change directory to active project directory (eg: `project_dir`).|

# Guideline Overview
## Structure Guideline
You need to place this development manager within the same directory level as project directory as shown below:
<pre>
PROJECTS_FOLDER
├── dev_manager (development manager directory)
|   ├── config
|   ├── scripts
|   ├── dev_init.bash
|   └── ...
├── project_dir_1 (project directory)
|   ├── config
|   ├── pkg
|   ├── ws_robot
|   ├── ws_my_stuff
|   └── ...
├── project_dir_2 (project directory)
|   ├── config
|   ├── pkg
|   ├── ws_robot
|   ├── ws_another_one
|   └── ...
└── project_dir_3 (project directory)
    ├── config
    ├── pkg
    ├── ws_robot
    └── ...
</pre>

As shown above, you can manage multiple projects using this manager tool. You also can have multiple workspaces within the same project. Workspaces in the same project will share the same packages from `pkg` directory inside the project.

## Project Repo Guideline
The project repo must follow the same structure as template as shown in `temp/project_template` directory. Inside the template contains pre-defined variables for development manager to consume.

## Project's Workspace Initizalization Guideline
To initialize a workspace, just source the `dev_init.bash` using format as shown below:
```
source dev_init.bash <project dir> <ws dir>
```
Example:
```
source dev_init.bash /project_dir_1 /ws_robot
```

To make workspace initialization easier, you can just add it to `.bashrc` file.

### Using alias to initialize project's workspace
If you are working on multiple workspaces/projects you can add alias `.bashrc` using format as shown below:
```
alias <alias>='source <dev_init_path> <project dir> <ws dir>'
```
where `<project dir>` directory is relative to PROJECTS_FOLDER directory and `<ws dir>` directory is relative to working project dir. Make sure the spaces and placement of `/` character is correct.

Example:
```
alias wsr1='source /PROJECTS_FOLDER/dev_manager/dev_init.bash /project_dir_1 /ws_robot'
alias wsr1ms='source /PROJECTS_FOLDER/dev_manager/dev_init.bash /project_dir_1 /ws_mystuff'
alias wsproject2='source /PROJECTS_FOLDER/dev_manager/dev_init.bash /project_dir /ws_robot'
```
You can test the alias and check the `Project Path`, `Project Package Path` and `Active Workspace` is correct. It should look like this for `wsr1` alias:
```
[INFO] Project Path: /PROJECTS_FOLDER/project_dir_1
[INFO] Project Package Path: /PROJECTS_FOLDER/project_dir_1/pkg
[INFO] Active Workspace: /ws_robot
```



# SUPPORT! 
 Love this project? Consider buying me a coffee to fuel more late-night coding sessions! Your support helps keep the innovation going. 🙌

<a href='https://ko-fi.com/H2H818H9M3' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://storage.ko-fi.com/cdn/kofi2.png?v=6' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>

If you have a suggestion or an interesting idea that you want me to add into this tool, let me know! Feel free to contribute!

### Planned features
1. Add Docker support.
2. Add Python environment support.
3. Substitute git repo in pkg with git submodule.
4. `r2b` selected package.
5. Automatic install and integration of the new Gazebo Sim.
