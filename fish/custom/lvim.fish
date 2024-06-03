function reset_lvim
  rm ~/.cache/jdtls/
  mv ~/.config/lvim/config.lua ~/.config/lvim/config.lua.bak

  bash ~/.local/share/lunarvim/lvim/utils/installer/uninstall.sh
  # set -x LV_BRANCH 'release-1.3/neovim-0.9'
  # bash (curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh | psub)
  bash (curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh | psub)


  # nvim -c "TSInstall all"

  mv ~/.config/lvim/config.lua.bak ~/.config/lvim/config.lua
end

function install_rye_jukit
  rye add --dev ipython pip matplotlib
  rye sync
  rye run python3 -m pip install --upgrade pynvim
end
