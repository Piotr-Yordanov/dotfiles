#/bin/sh
#
sh -c 'eval `xdotool getactivewindow getwindowgeometry --shell`; xdotool mousemove $((X+WIDTH-20)) $((Y+HEIGHT/2))'
# sh ./move.sh
sleep 0.1

xdotool keydown alt
xdotool mousedown 3
xdotool mousemove_relative -- +100 0

xdotool keyup alt
xdotool mouseup 3
xdotool mousemove_relative -- -100 0
