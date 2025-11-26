# Watch The Video: "https://www.youtube.com/watch?v=WaWB3F-ffcI&t=1263s"
# These commands make me to reinstall ArchLinux faster.

nmcli dev wifi list
nmcli dev wifi connect "xiaomi13" password 12345678

sudo pacman -S hyprlock hyprpaper hypridle hyprsunset hyprshot
sudo pacman -S waybar btop yazi

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -S clash-verge-rev-bin
yay -S linuxqq

sudo nvim /etc/default/grub
sudo pacman -S os-prober
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo grub-mkfont --size=32 -o /boot/grub/fonts/new.pf2 /home/minami/Terminus.ttf

# Download Nerd Fonts on Website.
sudo pacman -S noto-fonts-emoji noto-fonts-cjk
chmod +x /home/minami/.config/waybar/switch.sh

sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo nvim -p /etc/systemd/system/getty@tty1.service.d/override.conf
sudo systemctl daemon-reload
sudo systemctl restart getty@tty1

sudo pacman -S 7zip
sudo pacman -S fd ripgrep

reboot
poweroff
