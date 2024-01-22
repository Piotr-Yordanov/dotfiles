##################
###   PACMAN   ###
##################
function pac_create_db
  set -l DIR $HOME/.config/_install/package_lists
  pacman -Qe | awk '{ print $1 }' > $DIR/pacman
end

# argv[1] is from the current system
# argv[2] is the default pacman db
function pac_install_missing
  diff $argv[1] $argv[2] | grep ">" | awk '{ print $2}'
end

# argv[1] is from the current system
# argv[2] is the default pacman db
function pac_remove_undesirable
  diff $argv[1] $argv[2] | grep "<" | awk '{ print $2}'
end

##################
###    NODE    ###
##################
function npm_create_db
  set -l DIR $HOME/.config/_install/package_lists
  npm list -g --depth=0 | awk '{print $2}' > $DIR/npm
end
