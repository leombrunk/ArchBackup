#!/bin/sh

# First we append the saved layout of workspace N to workspace M
i3-msg "workspace 10; append_layout ~/.config/i3/workspace_10.json"

# And finally we fill the containers with the programs they had
google-chrome-stable --profile-directory="Profile 1"
code
firefox https://app.slack.com/client/T033SF0CH/G0176BC9LTX
