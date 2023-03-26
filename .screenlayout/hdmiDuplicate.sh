#!/bin/sh
/usr/bin/xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal \
        --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate normal --set underscan on --set "underscan vborder" 30 --set "underscan hborder" 85 \
        --output DisplayPort-0 --off \
	--output DisplayPort-1 --off

HDMI=$(/usr/bin/pactl list short sinks | /usr/bin/grep "hdmi" | /usr/bin/cut -d"	" -f1)
/usr/bin/pactl set-default-sink $HDMI

/usr/bin/sleep 1
/usr/bin/i3-msg restart

