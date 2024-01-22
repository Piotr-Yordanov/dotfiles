#/bin/sh
xdotool keydown alt
# xdotool click 3
sleep 0.1
xdotool mousedown 3
sleep 1
xdotool mousemove_relative -- -100 0

sleep 0.1

xdotool keyup alt
xdotool mouseup 3
xdotool mousemove_relative -- +100 0
