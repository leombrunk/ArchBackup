#!/bin/sh
/usr/bin/xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal \
	--output HDMI-A-0 --off \
	--output DisplayPort-0 --off \
	--output DisplayPort-1 --off

ANALOG=$(/usr/bin/pactl list short sinks | /usr/bin/grep "analog" | /usr/bin/cut -d"	" -f1)
/usr/bin/pactl set-default-sink $ANALOG 

/usr/bin/sleep 1
/usr/bin/i3-msg restart

