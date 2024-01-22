function wsl
  sudo pacman -Sc
  sudo pacman -Rns (pacman -Qtdq)
  trizen -Scc --noconfirm
  rm -ra $HOME/.config/trizen/sources
  yarn cache clean
  npm cache clean --force
  nvim -c 'PackerClean'
end
