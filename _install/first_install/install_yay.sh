sudo pacman -Sy --noconfirm --needed git base-devel go
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
