#!/bin/sh
# Generate Pacman List
touch $HOME/.config/_install/pacman_install_db.sh
rm $HOME/.config/_install/pacman_install_db.sh
rm $HOME/.config/_install/pacman_list
echo yay -S --noconfirm > prompt
pacman -Qe | awk '{print $1}' > list1
pacman -Qet | awk '{print $1}' > list2
cat prompt list1 list2 > $HOME/.config/_install/pacman_list
cat list1 list2 | sort -u | paste -d' ' -s > temp
cat prompt temp | paste -d' ' -s > $HOME/.config/_install/pacman_install_db.sh
chmod +x $HOME/.config/_install/pacman_install_db.sh
rm list1 list2 temp prompt
rm pacman_list
