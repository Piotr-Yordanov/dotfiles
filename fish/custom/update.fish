function update
  # if test ! -d /boot/EFI
  #   sudo mount /dev/sda1 /boot
  # end
  # sh $HOME/.config/_install/generate_pacman_db.sh
  sudo pacman -Fyy
  sudo pacman -Syyu
  # trizen -Syyu --noconfirm
  yay -Syyu
  # paru -Sua
  fisher
  npm update -g
  ~/.local/bin/lvim -c 'Lazy sync'
end

function update_openpyn
  cd $HOME/.config/openpyn-nordvpn
  git pull
  sudo python setup.py install
end

function purge
  cd /var/lib/systemd/coredump/
  find . -name "core.*" | xargs sudo rm
  sudo rm -r /var/log/journal/*
  sudo pacman -Sc
  sudo pacman -Rns (pacman -Qtdq)
  # trizen -Scc 
  yay -Scc 
  # sudo rm -r $HOME/.config/trizen/sources
  # rm $HOME/.mozilla


  rm -r ~/.config/google-chrome/Default/File System
  rm -r ~/.config/google-chrome/Default/Service Worker
end


function purge
  cd /var/lib/systemd/coredump/
  find . -name "core.*" | xargs sudo rm
  sudo rm -r /var/log/journal/*
  sudo pacman -Sc
  sudo pacman -Rns (pacman -Qtdq)
  # trizen -Scc 
  yay -Scc 
  # sudo rm -r $HOME/.config/trizen/sources
  # rm $HOME/.mozilla


  rm -r ~/.config/google-chrome/Default/File System
  rm -r ~/.config/google-chrome/Default/Service Worker
end

function ststat
  ll /var/lib/systemd/coredump/
  ll /var/log/journal/
end
