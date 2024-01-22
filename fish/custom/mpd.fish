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
    # List all items, filter for "Bondage Music Radio," and shuffle them randomly
    mpd
    set -l items (mpc listall | grep ".*Bondage Music Radio.*" | shuf -n 4)
    echo $items[3]
    mpc clear
    mpc add $items[3]
    mpc play
end

function nma
    # List all items, filter for "Bondage Music Radio," and shuffle them randomly
    set -l items (mpc listall | grep ".*Bondage Music Radio.*" | shuf -n 4)
    echo $items[3]
    mpc clear
    mpc add $items[3]
    mpc play
end
