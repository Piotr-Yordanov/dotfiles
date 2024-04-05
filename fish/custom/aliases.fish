# ============= #
#    ALIASES    #
# ============= #

# git
alias g="gitui"
alias gs="git-fuzzy status"
# alias ga="git add -A"
# alias gl="git log --graph --oneline --all"
alias gl="glo"
alias gb="git branch"
alias gp="git push"
alias gpp="git push; npm run pub"
alias gpl="git pull"
alias gcm="git commit -m"
alias Gco="git checkout"

# general
alias l="exa --group-directories-first -L=1 -ahlT"
alias ll="exa --group-directories-first -ahlT"
alias cat="bat"
alias c="bat"
alias mk="mkdir"
alias rm='rm -rv'
alias rmm='fzf | xargs -I '{}' rm {}'
alias cp='cp -rv'
alias mv='mv -v'
alias du1='du -hc -d 1'
alias gz="tar -zcvf"
alias pi="ping google.com"
alias Ifconfig="nmcli dev show | grep IP4.ADDRESS"

# directories
alias dwn="cd $HOME/Downloads"
alias conf="cd $HOME/.config"
alias pro="cd $HOME/.config/stimming"
alias Cd="cd $HOME/workspace"
alias CD="cd $HOME/warehouse"
alias cdw="cd $HOME/warehouse"

# apps
alias v="~/.local/bin/lvim"
alias nv='nvim'

alias a="begin; alias; functions; end | fzf -i --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias f="vim -c 'History'"
alias h="glances -t 1 -b"
alias y='ytfzf'
alias ,C="v -c 'Calendar'"
alias ,c="v -c 'NV'"
alias mpvnv="mpv --no-video"
alias neo="neomutt"
alias xc="xclip -selection clipboard"
alias mc="env EDITOR=nvim ranger"
alias dd="diskonaut"
alias sdcv="env HOME=$HOME/.local/share/sdcv sdcv"
alias q0="pactl set-sink-volume 0 +2%"
alias q-="pactl set-sink-volume 0 -2%"
alias calc="insect"

# Trizen / Pacman
# alias t="trizen"
# alias tfs="trizen -Fs"
# alias tn="trizen --noconfirm -S"
alias p="pacui i"
# alias pr="sudo pacman -Rns"
alias pr="pacui r"
alias pls="pacui ls"
alias pps="sudo pacman -S"

# Poetry
alias poi="poetry install"
alias poia="poetry install --all-extras"
alias pos="poetry shell"
alias poa="poetry add"
alias pocc="poetry cache clear PyPI --all"

function def
  sdcv $argv | less
end

# development
alias ni="pnpm install"
alias ns="pnpm start"
alias nd="pnpm run dev"
alias nt="pnpm test"

# ps
alias psa="ps aux"
alias psg="ps aux | grep "

# human friendly numbers and colors
alias df='df -h'
# alias du='du -h -d 2'
alias du='du -h -d 1 --apparent-size'
alias dus='du -h -d 1 . | sort -h'

# global
alias ...='cd ../..'
alias ....='cd ../../..'

# Fisher
alias fu='curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher; fisher u'

# Task warrior
alias t='task import rc.hooks=0 ~/warehouse/taskwarrior/all-tasks.json; taskwarrior-tui'
alias ts='task export > all-tasks.json'
alias ti="task add"
alias tcn="task context none"

# VimWiki
alias vp="nvim ~/warehouse/vimwiki/__projects.md"
alias vpo="nvim ~/warehouse/vimwiki/__one_day_maybe.md"
alias vpw="nvim ~/warehouse/vimwiki/__weekly.md"
alias vpi="nvim ~/warehouse/vimwiki/index.md"

# Youtube-dl
alias yt="yt-dlp --extract-audio --embed-thumbnail --ffmpeg-location /usr/bin/ffmpeg"
alias untar="tar -zxvf "

# Personal
alias wei="vf activate weight; python $HOME/.config/stats/weight/main.py"
alias spf="python $HOME/.config/stats/journal_food/main.py"
alias spm="python $HOME/.config/stats/journal_medical/main.py"
alias spw="python $HOME/.config/stats/journal_workout/main.py"
alias spj="python $HOME/.config/stats/journal/main.py"

# alias xm="setxkbmap -option compose:ralt; xmodmap $HOME/.config/Xmodmap; xset r rate 270 70"
alias sp="python $HOME/.config/stats/main.py"

alias restart="sudo shutdown -r now"

## Fan control on dell
# Reference: https://www.reddit.com/r/Dell/comments/aavmo5/does_anybody_else_have_horrible_overheating/
alias fan-perf="sudo smbios-thermal-ctl --set-thermal-mode performance"
alias fan-cool="sudo smbios-thermal-ctl --set-thermal-mode cool-bottom"
alias fan="sudo sensors | grep Fan"

# Tailscale and other VPN
alias tsu="sudo tailscale up --accept-routes"
alias tsd="sudo tailscale down"
alias tss="sudo tailscale status"
alias nord="sudo nordvpn"

# DOcker and built tools
alias dim='docker image'
alias dsa='docker stop $(docker ps -aq)'
alias drma='docker rm $(docker ps -aq)'
alias drmna='docker network ls --filter "type=custom" -q | xargs -r docker network rm'
alias drmia='docker rmi -f $(docker images -q)'
alias drmva='docker volume rm $(docker volume ls -q)'
alias m="make"
alias mr="make run"
alias mb="make build"
alias mw="make backtest"
alias ms="make shell"

alias vnn="vncviewer -passwd ~/workspace/rocket-bot/MT5-Docker/assets/vnc/passwd localhost:5900"
alias dca="dunstctl close-all"

alias maintomaster="git branch master; git branch --set-upstream-to=origin/master master; git push origin master; git push origin --delete main; git branch -d main"
# alias code="code --ozone-platform-hint=auto"

# Grp into everything
alias urg="ugrep -Q *"
alias russ="russ --database-path ~/.config/russ/db"


alias eurusd="curl http://www.floatrates.com/daily/eur.json | jq .usd"
alias te="poetry run pytest"

alias nc="ncmpcpp"

alias davinci="/opt/resolve/bin/resolve"


alias shut="tsd; nordvpn d; shutdown now"
alias r="rye"
alias rr="rye run"
alias rd="rye run dev"
alias rdd="rye run rdev"
alias rs="rye sync"
alias ra="rye add"

alias bb="git add .; git commit -m 'heartbeat'; git push"
