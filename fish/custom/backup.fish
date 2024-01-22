function backup
  set -l d (date +%s)
  echo $d
  tar --exclude-from=$HOME/.config/.gitignore -cvzf /tmp/$d.tgz $WS
  # mv $d.tgz.gpg ~/Dropbox
end

alias gdecrypt="gpg -o backup.tgz -d "
