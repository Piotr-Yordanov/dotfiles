eos-update
sudo pacman -Syyu
sh ./first_install/install_yay.sh
sh ~/.config/polybar/__fonts/install.sh
sudo cp ./first_install/10-installer /etc/sudoers.d/
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

sudo chsh -s /usr/bin/fish alpha
npm config set prefix '~/.npm-global'
pnpm install -g md-to-pdf

sudo pacman -S --noconfirm exa bat zellij gitui
sudo pacman -S --noconfirm neovim tree-sitter-cli python-pynvim fd ripgrep 

sudo pacman -S --noconfirm polybar zoxide xsel ttf-hack python-i3ipc vivaldi keepassxc
sudo pacman -S --noconfirm task taskwarrior-tui timew ranger python-taslib

yes | yay -S betterlockscreen
yes | yay -S rofimoji-git gitflow-avh
yes | yay -S zathura zathura-pdf-mupdf
yes | yay -S oh-my-posh light greenclip libsmbios 
yes | yay -S lf npm i3-resurrect diskonaut
yes | yay -S mpd mpc ncmpcpp wildmidi pulsemixer yt-dlp python-mutagen spotify_player
yes | yay -S bluetuith bluez bluez-utils
yes | yay -S synology-drive
yes | yay -S code code-marketplace
yes | yay -S onlyoffice-bin
yes | yay -S obs-studio bitwig-studio
yes | yay -S npm nodejs-nodemon rye pyright pnpm yarn pm2 maturin
yes | yay -S fava diceware
yes | yay -S xcolor


yes | yay -S wine docker remmina remmina-plugin-ultravnc libvncserver freerdp docker-compose
yes | yay -S larksuite-bin
yes | yay -S obsidian discord slack-desktop xclip  imagemagick ueberzugpp
yes | yay -S commitlint nodejs-commitizen

# VPN
yes | yay -S tailscale nordvpn-bin
sudo systemctl enable --now systemd-resolved
sudo systemctl enable --now nordvpnd



sh ./first_install/install_lvim.sh


ln -s $HOME/.config/.Xresources.default $HOME/.Xresources
