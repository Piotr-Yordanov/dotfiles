function thl
  cp $HOME/.config/termite/config_light $HOME/.config/termite/config
  cp $HOME/.config/nvim/color_customisation_light.vim $HOME/.config/nvim/color_customisation.vim
  ry
end

function thd
  cp $HOME/.config/termite/config_dark $HOME/.config/termite/config
  cp $HOME/.config/nvim/color_customisation_dark.vim $HOME/.config/nvim/color_customisation.vim
  ry
end

function thly
  thl
  ry
end

function ry
  redshift -PO 5500
end

function rb
  redshift -PO 6500
end

function tdark
  cp $HOME/.config/alacritty/alacritty.dark.yml $HOME/.config/alacritty/alacritty.yml
  cp $HOME/.config/nvim/color_customisation_dark.vim $HOME/.config/nvim/color_customisation.vim
  cp $HOME/.config/nvim/lua/theme.lua.dark $HOME/.config/nvim/lua/theme.lua
end

function tlight
  cp $HOME/.config/alacritty/alacritty.light.yml $HOME/.config/alacritty/alacritty.yml
  cp $HOME/.config/nvim/color_customisation_light.vim $HOME/.config/nvim/color_customisation.vim
  cp $HOME/.config/nvim/lua/theme.lua.light $HOME/.config/nvim/lua/theme.lua
end
