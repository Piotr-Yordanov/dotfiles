function sync
  set -l DIR $HOME/.config/_install/package_lists

  # Create local backup
  pac_create_db
  npm_create_db
  command cp $DIR/pacman /tmp/pacman.old
  command cp $DIR/npm /tmp/npm.old

  # Create remove package databases
  # ssh $argv[1]@192.168.1.$argv[2] 'pac_create_db'
  # ssh $argv[1]@192.168.1.$argv[2] 'npm_create_db'
  #
  # # Run the sync
  # rsync -zPa --delete $argv[1]@192.168.1.$argv[2]:/home/$argv[1]/stimming $HOME
  # fisher u
  #
  # # Output missing packages
  # echo ""
  # echo "Here are the missing pacman packages"
  # pac_install_missing /tmp/pacman.old $DIR/pacman
  # echo ""
  # echo "Here are the missing npm packages"
  # pac_install_missing /tmp/npm.old $DIR/npm
end
