#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# auto hyprland
if [[ $(tty) == /dev/tty1 ]]; then
    exec hyprland
fi
