#!/bin/sh

# First we append the saved layout of workspace N to workspace M
i3-msg "workspace 2; append_layout ~/.config/i3/workspace_2.json"

# And finally we fill the containers with the programs they had
google-chrome-stable --profile-directory="Default"
