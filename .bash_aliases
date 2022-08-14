#!/bin/bash


#neofetch
alias fzfprev="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

alias setbg="feh --no-fehbg --bg-fill '/usr/share/backgrounds/trg-wallpapers/black-bg.jpg'"

alias zathura='devour zathura'
alias sxiv='devour sxiv'
alias rc="nvim ~/.bashrc && source ~/.bashrc"
alias e='emacsclient --tty'

alias nvim-visudo="sudo EDITOR=nvim visudo"
alias c='clear'
alias r=ranger-cd

alias ua-drop-caches='sudo paccache -rk3; yay -Sc --aur --noconfirm'
alias ua-update-all='export TMPFILE="$(mktemp)"; \
    sudo true; \
    rate-mirrors --save=$TMPFILE arch --max-delay=21600 \
      && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
      && sudo mv $TMPFILE /etc/pacman.d/mirrorlist \
      && ua-drop-caches \
      && yay -Syyu --noconfirm'
