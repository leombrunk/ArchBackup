#!/bin/sh

# /etc/udev/rules.d/monitor-hotplug.rules

# KERNEL=="card0", SUBSYSTEM=="drm", ACTION=="change", ENV{DISPLAY}=":0", ENV{XAUTHORITY}="/home/ken    /.Xauthority", RUN+="/bin/systemctl start monitor-trigger.service"

# KERNEL=="card0", SUBSYSTEM=="drm", ACTION=="change", ENV{DISPLAY}=":0", ENV{XAUTHORITY}="/home/ken    /.Xauthority", RUN+="/bin/bash /home/ken/.screenlayout/autoDetect.sh"

# udevadm control --reload-rules

# Workaround xrandr and udev to turn on connected outputs that may be in suspend mode
/usr/bin/xrandr 1> /dev/null
/usr/bin/sleep 1
/usr/bin/xrandr 1> /dev/null

# xrandr env vars
DISPLAY=:0
XAUTHORITY=/home/ken/.Xauthority

# pactl env vars
XDG_RUNTIME_DIR=/run/user/1000

HDMI_STATUS=$(</sys/class/drm/card0/card0-HDMI-A-1/status )

if [[ "$HDMI_STATUS" == "connected" ]]; then
  sudo -u '#1000' HOME=/home/ken XDG_RUNTIME_DIR=/run/user/1000 /home/ken/.screenlayout/hdmiDuplicate.sh
else
  sudo -u '#1000' HOME=/home/ken XDG_RUNTIME_DIR=/run/user/1000 /home/ken/.screenlayout/single.sh
fi
 
