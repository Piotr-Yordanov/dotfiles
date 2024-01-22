#!/bin/bash

export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0;
export WAYLAND_DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0;
export GDK_SCALE=2
export QT_SCALE_FACTOR=2
export GTK_THEME=Adwaita:dark
export GTK_FONT_NAME="DejaVu Sans 8"


# export GDK_DPI_SCALE=1
# export PULSE_SERVER=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0;
# export PULSE_SERVER=/mnt/wslg/PulseServer

# export XDG_SESSION_TYPE="x11"

# export XDG_RUNTIME_DIR=~/xdg

# export XDG_SESSION_CLASS="user"
#

# /mnt/c/Program\ Files/VcXsrv/vcxsrv.exe -ac -wgl -dpms -nodecoration&
i3
