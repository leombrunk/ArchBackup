#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Set colors according to wal
source "${HOME}/.cache/wal/colors.sh"
background=$color0
background_alt=$color3
foreground=$color15
foreground_alt=$color2
highlight=$color4

# Set env for all monitors and launch
if type "xrandr"; then
  PRIMARY=$(xrandr --query | grep "primary" | cut -d" " -f1)
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do 
    POSITION=$(xrandr --query | grep $m | awk -v FS="(+|+)" '{print $2}') 
    if [[ $POSITION != 0 ]] && [[ $m != $PRIMARY ]]
    then
      echo "Set polybar on non 0 non primary monitor $m"
      MONITOR=$m polybar --reload main &
    fi
    if [[ $PRIMARY == $m ]]
    then
      echo "Set polybar on primary monitor $m"
      MONITOR=$m polybar --reload main &
    fi
  done
else
  polybar --reload main &
fi

