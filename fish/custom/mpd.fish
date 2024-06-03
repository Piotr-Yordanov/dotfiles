# function m
#   rm /tmp/playlist
#   set query (mpc playlist | fzf --reverse --select-1 )
#   mpc playlist >> /tmp/playlist
#   set index (grep -n $query /tmp/playlist | string split -f 1 : )
#   mpc play $index
# end
#
# function ml
#   rm /tmp/playlist
#   set query (mpc ls | fzf --reverse --select-1 )
#   mpc ls >> /tmp/playlist
#   mpc clear
#   mpc load $query
#   mpc play
# end
#


function n
    mpd
    set -l items (mpc listall | grep -E ".*Bondage Music Radio.*|.*Africa.*" | shuf -n 4)
    echo $items[3]
    mpc clear
    mpc add $items[3]
    mpc play
end

function na
    mpd
    set -l items (mpc listall | grep -E ".*Africa.*" | shuf -n 4)
    echo $items[3]
    mpc clear
    mpc add $items[3]
    mpc play
end

function nsot
    mpd
    set -l items (mpc listall | grep -E ".*ASOT.*" | shuf -n 4)
    echo $items[3]
    mpc clear
    mpc add $items[3]
    mpc play
end
