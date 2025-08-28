#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export BROWSER="chromium"
export EDITOR="nvim"
export VISUAL="nvim"

alias vim=nvim
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# PS1='[\u@\h \W]\$ ' 󰣇  
PS1="\[\e[1;37m\]\w \[\e[1;36m\]\[\e[0m\] "
