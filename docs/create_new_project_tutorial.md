### [ [HOME](../README.md) ]
# Create New Project Tutorial
## Fast Tutorial
1. Create an empty folder.
2. Clone this repository into that folder.
3. Source the `dev_init.bash`.
4. (Optional: If you haven't install ROS 2) Type `r2dev`to open menu and choose the option to Install ROS 2.
5. Type `r2devp` to create a new project and follow the instruction.

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
    r2devp
    ```
    You will be prompted to enter details of your project. To make sure we are on the same page, follow this:
    1. Project Name: `My First Project`
    2. Project Directory Name: `my_first_project`
    3. Workspace Directory Name: `ws_robot`
    4. At this point, it will ask for ROS 2 distro for this project. Either proceed as suggested with [ENTER] or change it to the one compatible with your system.
    5. After the above, you should see something like this in your terminal:
        <pre>
        [INFO] Creating project My First Project in my_first_project
        [INFO] Creating new My First Project project in /PROJECTS_FOLDER/my_first_project
        [SUCCESS] Project My First Project created at /PROJECTS_FOLDER/my_first_project
        </pre>
    6. Next, it will ask whether you want to access and initialize the project work space now. Just press [ENTER] to accept.
    7. After the above, you should see your workspace being initialized looking like this in your terminal:
        <pre>
        ===================================================================
            ROS 2 Development Manager (by Mahir Sehmi)
        ===================================================================
        [INFO] Initializing...
        ===================================================================
        [INFO] Project Name: My First Project
        [INFO] Project Path: /PROJECTS_FOLDER/my_first_project
        [INFO] Project Package Path: /PROJECTS_FOLDER/my_first_project/pkg
        [INFO] Active Workspace: /ws_robot
        [INFO] OS Distro: noble
        [INFO] ROS Distro: jazzy
        [INFO] RMW Implementation: rmw_fastrtps_cpp
        [INFO] ROS ID: 8
        [INFO] Current IP: 192.168.1.50
        ===================================================================
        [INFO] Sourcing files
        [SUCCESS] Sourced /opt/ros/jazzy/setup.bash.
        [SUCCESS] Sourced /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash.
        [WARNING] Source failed. Can't find /PROJECTS_FOLDER/my_first_project/ws_robot/install/local_setup.bash.
        [WARNING] Source failed. Can't find /PROJECTS_FOLDER/my_first_project/pkg/_others/install/local_setup.bash.
        [WARNING] Source failed. Can't find /PROJECTS_FOLDER/my_first_project/pkg/_robot/install/local_setup.bash.
        [WARNING] Source failed. Can't find /PROJECTS_FOLDER/my_first_project/pkg/_sims/install/local_setup.bash.
        [WARNING] Source failed. Can't find /PROJECTS_FOLDER/my_first_project/pkg/_tools/install/local_setup.bash.
        [INFO] Successfully sourced 2/7 file(s).
        [WARNING] Unable to source 5 file(s). Program depending on this source may fail. Check if they are installed correctly or wrong path provided.
        [INFO] Done sourcing.
        [INFO] Type 'r2pkg' for package manager menu.
        ===================================================================</pre>
    8. Next, accept creating alias in ~/.bashrc with [ENTER]
    9. Alias name: `wsfirst`
    10. After above, you should see this result in your terminal:
        <pre>
        [SUCCESS] alias wsfirst="source /PROJECTS_FOLDER/dev_manager/dev_init.bash /my_first_project /ws_robot" added to ~/.bashrc
        [INFO] Just type wsfirst to access the project workspace.
        </pre>
7. At this point, your folder structure should look like this:
    <pre>
    PROJECTS_FOLDER
    ├── dev_manager (development manager directory)
    |   ├── config
    |   ├── scripts
    |   ├── dev_init.bash
    |   └── ...
    └── my_first_project (project directory)
        ├── config
        ├── pkg
        ├── ws_robot
        └── ...</pre>

8. We are done! Now you can just type `wsfirst` to access your project's workspace. Happy creating!

# Next Step
In your project, you can configure your project settings under `config` directory and also the packages that you want to use under `pkg` directory. You can try open the bash files as I have explained how to use them there.


# SUPPORT! 😃
 Love this project? Consider buying me a coffee to fuel more late-night coding sessions! Your support helps keep the innovation going. 🙌

<a href='https://ko-fi.com/H2H818H9M3' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://storage.ko-fi.com/cdn/kofi2.png?v=6' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>

If you have a suggestion or an interesting idea that you want me to add into this tool, let me know! Feel free to contribute!