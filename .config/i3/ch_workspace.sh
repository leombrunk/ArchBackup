#!/bin/bash

Help()
{
   # Display Help
   echo "Increment or decrement i3 workspace by 1."
   echo
   echo "Syntax: scriptTemplate [up|down]"
   echo "options:"
   echo "up    Increment i3 workspace by 1"
   echo "down  Decrement i3 workspace by 1"
   echo
}

CURR_I3_WORKSPACE=`i3-msg -t get_workspaces | jq '.[] | select(.focused).num'`

Change()
{
  if [[ $CURR_I3_WORKSPACE -ge 0 ]] && [[ $CURR_I3_WORKSPACE -le 10 ]]
  then
    i3-msg workspace number $CURR_I3_WORKSPACE
  fi
}

if [[ $1 == 'up' ]]
then
  CURR_I3_WORKSPACE=$((CURR_I3_WORKSPACE+1))
  Change
elif [[ $1 == 'down' ]]
then
  CURR_I3_WORKSPACE=$((CURR_I3_WORKSPACE-1))
  Change
else
  Help
fi

#if [[ $CURR_I3_WORKSPACE >= 0 ]] && [[ $CURR_I3_WORKSPACE <= 10 ]]
#then
#  i3-msg workspace number $CURR_I3_WORKSPACE
#fi

