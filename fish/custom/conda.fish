function hum --description "Start humminggot"
    kitty +kitten themes Adwaita darker
    cp ~/.config/kitty/default-theme.conf ~/.config/kitty/current-theme.conf
    conda activate hummingbot
    ./start
end
