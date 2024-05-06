eos-update
sudo pacman -Syyu
sh ./first_install/install_yay.sh
sh ~/.config/polybar/__fonts/install.sh
sudo cp ./first_install/10-installer /etc/sudoers.d/
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

sudo chsh -s /usr/bin/fish alpha
npm config set prefix '~/.npm-global'

sudo pacman -S --noconfirm exa bat zellij gitui
sudo pacman -S --noconfirm neovim tree-sitter-cli python-pynvim fd ripgrep 

sudo pacman -S --noconfirm polybar zoxide xsel ttf-hack python-i3ipc vivaldi keepassxc
sudo pacman -S --noconfirm task taskwarrior-tui timew ranger python-taslib

yes | yay -S oh-my-posh light greenclip libsmbios 
yes | yay -S lf npm i3-resurrect diskonaut
yes | yay -S mpd mpc ncmpcpp wildmidi pulsemixer
yes | yay -S bluetuith bluez bluez-utils
yes | yay -S synology-drive
yes | yay -S obs-studio bitwig-studio

yes | yay -S wine docker remmina remmina-plugin-ultravnc libvncserver freerdp
yes | yay -S larksuite-bin
yes | yay -S obsidian discord slack
yes | yay -S commitlint nodejs-commitizen



sh ./first_install/install_lvim.sh


ln -s $HOME/.config/.Xresources.default $HOME/.Xresources
