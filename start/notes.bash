# Watch The Video: "https://www.youtube.com/watch?v=WaWB3F-ffcI&t=1263s"
# These commands make me to reinstall ArchLinux faster.

iwctl station wlan0 scan
iwctl station wlan0 get-networks
iwctl station wlan0 connect xiaomi13
iwctl station wlan0 show

nmcli dev wifi list
nmcli dev wifi connect "xiaomi13" password 12345678

sudo pacman -S hyprland hyprlock hyprpaper hypridle hyprsunset hyprshot
sudo pacman -S nvim waybar btop yazi fastfetch dunst

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
sudo fc-cache -fv
chmod +x /home/minami/.config/waybar/switch.sh

sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo nvim -p /etc/systemd/system/getty@tty1.service.d/override.conf
sudo systemctl daemon-reload
sudo systemctl restart getty@tty1

sudo pacman -S 7zip
sudo pacman -S fd ripgrep
sudo pacman -S ncdu

sudo pacman -S bluez bluez-utils blueman
sudo systemctl start bluetooth
blueman-manager

sudo pacman -S power-profiles-daemon
powerprofilesctl set performance

yay -S simple-mtpfs
simple-mtpfs -l
simple-mtpfs --device 1 -o allow_other ~/myphone
fusermount -u ~/myphone

pacman -Qdt
sudo pacman -Scc
sudo pacman -Rns $(pacman -Qdtq)
sudo ncdu /

export https_proxy=http://127.0.0.1:7890 # mixed
git remote set-url origin git@github.com:HelloStupID404/arch-linux-config.git

reboot
poweroff
sudo shutdown -h 10:30

# When uninstalling packages with -Rns, something else may be deleted too!
