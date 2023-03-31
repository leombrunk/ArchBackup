#!/bin/sh

# First we append the saved layout of workspace N to workspace M
i3-msg "workspace 10; append_layout ~/.config/i3/workspace_10.json"

# And finally we fill the containers with the programs they had
code
firefox --detach https://app.slack.com/client/T033SF0CH/G0176BC9LTX 'https://mail.google.com/mail/u/0/#inbox' https://calendar.google.com/calendar/u/0/ &>/dev/null & disown

