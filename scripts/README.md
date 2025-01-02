# Scripts
This is an example of how this scripts directory can look like.

# Example scripts
The example script `interface_bringup.bash` here will check for usb status and bind usb devices to your system using the rules in `usb_rules` directory. See `pkg/aliases.bash` to see aliases that runs the `interface_bringup.bash` script in this directory. After initializing the project workspace, try type `r2link` to see it in action.

# Modification
You also can place this scripts folder somewhere else if you want. For example, `ws_robot`. Then you may want to change the value of `r2link` alias in `pkg/aliases.bash` so that the path match where the script is located.