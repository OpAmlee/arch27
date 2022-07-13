#!/bin/sh

#  ╔╗ ╔═╗╔═╗╦ ╦  ╔═╗╔═╗╔╗╔╔═╗╦╔═╗  \│/  ╔╦╗╦═╗╦╔═╗╔═╗╔═╗╔═╗╦═╗╦═╗╦═╗
#  ╠╩╗╠═╣╚═╗╠═╣  ║  ║ ║║║║╠╣ ║║ ╦  ─ ─   ║ ╠╦╝║║ ╦║ ╦║ ╦║╣ ╠╦╝╠╦╝╠╦╝
#  ╚═╝╩ ╩╚═╝╩ ╩  ╚═╝╚═╝╝╚╝╚  ╩╚═╝  /│\   ╩ ╩╚═╩╚═╝╚═╝╚═╝╚═╝╩╚═╩╚═╩╚═

# BIG THANKS TO DEREK TAYLOR AT DISTROTUBE AND ERIC DEBOIS WITH ARCO LINUX
#  ____ _____
# |  _ \_   _|  Derek Taylor (DistroTube)
# | | | || |    http://www.youtube.com/c/DistroTube
# | |_| || |    http://www.gitlab.com/dwt1/
# |____/ |_|

#  ╔═╗═╗ ╦╔═╗╔═╗╦═╗╔╦╗
#  ║╣ ╔╩╦╝╠═╝║ ║╠╦╝ ║
#  ╚═╝╩ ╚═╩  ╚═╝╩╚═ ╩

export TERM="xterm -kitty"                      # getting proper colors
export HISTCONTROL=ignoredups:erasedups           # no duplicate entries
export ALTERNATE_EDITOR="nvim"                        # setting for emacsclient
#export PATH=$PATH:$HOME/.emacs.d/bin
#export PATH="$HOME/bin:$PATH"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

export ALTERNATE_EDITOR=''
alias e='emacsclient --tty'
#export EDITOR="emacsclient -t -a ''"              # $EDITOR use Emacs in terminal
#export VISUAL="emacsclient -c -a emacs"           # $VISUAL use Emacs in GUI mode
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox"

alias rc="nvim ~/.bashrc && source ~/.bashrc"

# use nvim for editor in visudo
alias nvim-visudo="sudo EDITOR=nvim visudo"

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

export GDK_DPI_SCALE=0
export GDK_BACKEND=x11
export GDK_SCALE=1

complete -c man which
#export PATH=$PATH':~/.gem/ruby/3.0.0/bin'
#export GEM_HOME=$HOME/.gem
#export GEM_PATH=$HOME/.gem
#GEM_HOME='/home/trg/.rvm/gems/ruby-1.9.3-p551' 
#export GEM_PATH='/home/trg/.rvm/rubies/ruby-1.9.3-p551/bin/ruby'
#  ╔╦╗╔═╗╔╗╔╔═╗╔═╗╔═╗╔═╗╦═╗
#  ║║║╠═╣║║║╠═╝╠═╣║ ╦║╣ ╠╦╝
#  ╩ ╩╩ ╩╝╚╝╩  ╩ ╩╚═╝╚═╝╩╚═

### Uncomment only one of these!

### "bat" as manpager
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"

### "vim" as manpager
#export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### "nvim" as manpager
#export MANPAGER="nvim -c 'set ft=man' -"

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

################################################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# path
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi
# Git completion
if [ -f /usr/share/bash-completion/git-completion.bash ]; then
  . /usr/share/bash-completion/git-completion.bash
fi

HISTFILE=$HOME/.local/share/history/bash_history

# Prompt
# define the color of the simple-bash-prompt
simple_bash_prompt_bracket_color="\033[1;32m"
simple_bash_prompt_command_color="\033[0;97m"
simple_bash_prompt_device_color="\033[1;34m"
simple_bash_prompt_dir_color="\033[1;37m"
simple_bash_prompt_git_branch_color="\033[1;33m"
simple_bash_prompt_git_color="\033[0;33m"
simple_bash_prompt_user_color="\033[1;36m"
simple_bash_prompt_separator_color="\033[1;37m"
simple_bash_prompt_symbol_color="\033[1;31m"
simple_bash_prompt_reset="\033[m"

# define the prompt terminator character
simple_bash_prompt_symbol="\\$"

# set the color with the exit status of the last command
simple_bash_prompt_exit_status_color () {
    if [ $1 -eq 0 ]; then
        echo -e "\033[0;32m"
    else
        echo -e "\033[0;31m"
    fi
}

# check if current directory is a git repo
simple_bash_prompt_is_git_repo () {
    git rev-parse 2> /dev/null
}

# print the git branch
simple_bash_prompt_get_git_branch () {
    simple_bash_prompt_git_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    if [ "$simple_bash_prompt_git_branch" = "HEAD" ]; then
        echo "no branch"
    else
        echo $simple_bash_prompt_git_branch
    fi
}

# define the simple-bash-prompt
simple_bash_prompt_build_prompt () {
simple_bash_prompt_exit_status=$?
simple_bash_prompt="\[\$(simple_bash_prompt_exit_status_color $simple_bash_prompt_exit_status)\]┬─\
\[$simple_bash_prompt_bracket_color\][\
\[$simple_bash_prompt_user_color\]\u\
\[$simple_bash_prompt_separator_color\]@\
\[$simple_bash_prompt_device_color\]\h\
\[$simple_bash_prompt_separator_color\]:\
\[$simple_bash_prompt_dir_color\]\w\
\[$simple_bash_prompt_bracket_color\]]\
\[\$(simple_bash_prompt_exit_status_color $simple_bash_prompt_exit_status)\]─\
\[$simple_bash_prompt_bracket_color\][\
\[\$(simple_bash_prompt_exit_status_color $simple_bash_prompt_exit_status)\]\t\
\[$simple_bash_prompt_bracket_color\]]"
if $(simple_bash_prompt_is_git_repo); then
    simple_bash_prompt+="\[\$(simple_bash_prompt_exit_status_color $simple_bash_prompt_exit_status)\]─"
    simple_bash_prompt+="\[$simple_bash_prompt_git_color\]["
    simple_bash_prompt+="\[$simple_bash_prompt_git_branch_color\]\$(simple_bash_prompt_get_git_branch)"
    simple_bash_prompt+="\[$simple_bash_prompt_git_color\]]"
fi
if [ "$TERM" = "linux" ]; then
    simple_bash_prompt+="\n\[\$(simple_bash_prompt_exit_status_color $simple_bash_prompt_exit_status)\]└─>"
    simple_bash_prompt+="\[$simple_bash_prompt_symbol_color\]$simple_bash_prompt_symbol \[$simple_bash_prompt_reset\]"
else
    simple_bash_prompt+="\n\[\$(simple_bash_prompt_exit_status_color $simple_bash_prompt_exit_status)\]╰─>"
    simple_bash_prompt+="\[$simple_bash_prompt_symbol_color\]$simple_bash_prompt_symbol \[$simple_bash_prompt_reset\]"
fi
PS1=$simple_bash_prompt
}
export PROMPT_COMMAND=simple_bash_prompt_build_prompt

#PS1='${arch_chroot:+($arch_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[33m\] ▸▹ \[\033[00m\]'
alias zathura='devour zathura'
alias sxiv='devour sxiv'

################################################################################

alias setbg="feh --no-fehbg --bg-fill '/usr/share/backgrounds/trg-wallpapers/black-bg.jpg'"

#  ╔═╗╔═╗╔╦╗  ╦  ╦╦  ╔╦╗╔═╗╔╦╗╔═╗
#  ╚═╗║╣  ║   ╚╗╔╝║  ║║║║ ║ ║║║╣
#  ╚═╝╚═╝ ╩    ╚╝ ╩  ╩ ╩╚═╝═╩╝╚═╝

# Comment this line out to enable default emacs-like bindings
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

#  ╔═╗╦ ╦╔╦╗╔═╗  ╔═╗╔═╗╔╦╗╔═╗╦  ╔═╗╔╦╗╔═╗  ╔═╗╔╗╔╔╦╗  ╦ ╦╦╔═╗╦ ╦╦  ╦╔═╗╦ ╦╔╦╗  ╔═╗╔═╗╦  ╔═╗╦═╗╔═╗
#  ╠═╣║ ║ ║ ║ ║  ║  ║ ║║║║╠═╝║  ║╣  ║ ║╣   ╠═╣║║║ ║║  ╠═╣║║ ╦╠═╣║  ║║ ╦╠═╣ ║   ║  ║ ║║  ║ ║╠╦╝╚═╗
#  ╩ ╩╚═╝ ╩ ╚═╝  ╚═╝╚═╝╩ ╩╩  ╩═╝╚═╝ ╩ ╚═╝  ╩ ╩╝╚╝═╩╝  ╩ ╩╩╚═╝╩ ╩╩═╝╩╚═╝╩ ╩ ╩   ╚═╝╚═╝╩═╝╚═╝╩╚═╚═╝

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi
#  ╔═╗╦═╗╔═╗╔╦╗╔═╗╔╦╗
#  ╠═╝╠╦╝║ ║║║║╠═╝ ║
#  ╩  ╩╚═╚═╝╩ ╩╩   ╩

#export PS1="$PS1""\[\e]0;$1 \a\]"

# This is commented out if using starship prompt
#PS1='[\u@\h \W]\$ '

#  ╔═╗╔═╗╔╦╗╦ ╦
#  ╠═╝╠═╣ ║ ╠═╣
#  ╩  ╩ ╩ ╩ ╩ ╩

#if [ -d "$HOME/.bin" ] ;
#  then PATH="$HOME/.bin:$PATH"
#fi

#if [ -d "$HOME/.local/bin" ] ;
#  then PATH="$HOME/.local/bin:$PATH"
#fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

for _entry in /usr/lib/ruby/gems/*; do
  if [[ -d $_entry ]]; then
    # TODO: Add only if not there already
    export GEM_PATH=$_entry:$GEM_PATH
  fi
done
unset _entry

#  ╔═╗╦ ╦╔═╗╔╗╔╔═╗╔═╗  ╔╦╗╦╔╦╗╦  ╔═╗  ╔═╗╔═╗  ╔╦╗╔═╗╦═╗╔╦╗╦╔╗╔╔═╗╦  ╔═╗
#  ║  ╠═╣╠═╣║║║║ ╦║╣    ║ ║ ║ ║  ║╣   ║ ║╠╣    ║ ║╣ ╠╦╝║║║║║║║╠═╣║  ╚═╗
#  ╚═╝╩ ╩╩ ╩╝╚╝╚═╝╚═╝   ╩ ╩ ╩ ╩═╝╚═╝  ╚═╝╚     ╩ ╚═╝╩╚═╩ ╩╩╝╚╝╩ ╩╩═╝╚═╝

### CHANGE TITLE OF TERMINALS
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|kitty|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

### SHOPT
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks term size when bash regains control

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

#  ╔═╗╦═╗╔═╗╦ ╦╦╦  ╦╔═╗  ╔═╗═╗ ╦╔╦╗╦═╗╔═╗╔═╗╔╦╗╦╔═╗╔╗╔
#  ╠═╣╠╦╝║  ╠═╣║╚╗╔╝║╣   ║╣ ╔╩╦╝ ║ ╠╦╝╠═╣║   ║ ║║ ║║║║
#  ╩ ╩╩╚═╚═╝╩ ╩╩ ╚╝ ╚═╝  ╚═╝╩ ╚═ ╩ ╩╚═╩ ╩╚═╝ ╩ ╩╚═╝╝╚╝

# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#  ╔╗ ╔═╗╔═╗╦ ╦  ╔═╗╦  ╦╔═╗╔═╗  ╦  ╦╔═╗╔╦╗
#  ╠╩╗╠═╣╚═╗╠═╣  ╠═╣║  ║╠═╣╚═╗  ║  ║╚═╗ ║
#  ╚═╝╩ ╩╚═╝╩ ╩  ╩ ╩╩═╝╩╩ ╩╚═╝  ╩═╝╩╚═╝ ╩

# root privileges
alias doas="doas --"

#  ╔╗╔╔═╗╦  ╦╦╔═╗╔═╗╔╦╗╦╔═╗╔╗╔
#  ║║║╠═╣╚╗╔╝║║ ╦╠═╣ ║ ║║ ║║║║
#  ╝╚╝╩ ╩ ╚╝ ╩╚═╝╩ ╩ ╩ ╩╚═╝╝╚╝

up () {
  local d=""
  local limit="$1"

  # Default to limit of 1
  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i=1;i<=limit;i++)); do
    d="../$d"
  done

  # perform cd. Show error if cd fails
  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs.";
  fi
}

#  ╔═╗╔╦╗╔═╗╔═╗╔═╗  \│/  ╦  ╦╦╔╦╗  \│/  ╔╗╔╦  ╦╦╔╦╗
#  ║╣ ║║║╠═╣║  ╚═╗  ─ ─  ╚╗╔╝║║║║  ─ ─  ║║║╚╗╔╝║║║║
#  ╚═╝╩ ╩╩ ╩╚═╝╚═╝  /│\   ╚╝ ╩╩ ╩  /│\  ╝╚╝ ╚╝ ╩╩ ╩

alias vim='nvim'
alias em='/usr/bin/emacs -nw'
alias emacs="emacsclient -c -a 'emacs'"
alias doomsync="~/.emacs.d/bin/doom sync"
alias doomdoctor="~/.emacs.d/bin/doom doctor"
alias doomupgrade="~/.emacs.d/bin/doom upgrade"
alias doompurge="~/.emacs.d/bin/doom purge"

#  ╦  ╔═╗  ╔╦╗╔═╗  ╔═╗═╗ ╦╔═╗
#  ║  ╚═╗   ║ ║ ║  ║╣ ╔╩╦╝╠═╣
#  ╩═╝╚═╝   ╩ ╚═╝  ╚═╝╩ ╚═╩ ╩

alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

#  ╔═╗╔═╗╔═╗╔╦╗╔═╗╔╗╔  \│/  ╦ ╦╔═╗╦ ╦  \│/  ╔═╗╔═╗╦═╗╦ ╦
#  ╠═╝╠═╣║  ║║║╠═╣║║║  ─ ─  ╚╦╝╠═╣╚╦╝  ─ ─  ╠═╝╠═╣╠╦╝║ ║
#  ╩  ╩ ╩╚═╝╩ ╩╩ ╩╝╚╝  /│\   ╩ ╩ ╩ ╩   /│\  ╩  ╩ ╩╩╚═╚═╝

alias pacsyu='sudo pacman -Syyu'                 # update only standard pkgs
alias parsua='paru -Sua --noconfirm'             # update only AUR pkgs (paru)
alias parsyu='paru -Syu --noconfirm'             # update standard pkgs and AUR pkgs (paru)
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'  # remove orphaned packages

#  ╔╦╗╦╦═╗╦═╗╔═╗╦═╗╔═╗
#  ║║║║╠╦╝╠╦╝║ ║╠╦╝╚═╗
#  ╩ ╩╩╩╚═╩╚═╚═╝╩╚═╚═╝

alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
#shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"
#update betterlockscreen images
alias bls="betterlockscreen -u /usr/share/backgrounds/arcolinux/"

#  ╔═╗╦═╗╔═╗╔═╗  ╦  ╦╔╗╔╦ ╦═╗ ╦
#  ╠═╣╠╦╝║  ║ ║  ║  ║║║║║ ║╔╩╦╝
#  ╩ ╩╩╚═╚═╝╚═╝  ╩═╝╩╝╚╝╚═╝╩ ╚═

alias att="arcolinux-tweak-tool"
alias adt="arcolinux-desktop-trasher"
alias abl="arcolinux-betterlockscreen"
alias agm="arcolinux-get-mirrors"
alias amr="arcolinux-mirrorlist-rank-info"
alias aom="arcolinux-osbeck-as-mirror"
alias ars="arcolinux-reflector-simple"
alias atm="arcolinux-tellme"
alias avs="arcolinux-vbox-share"
alias awa="arcolinux-welcome-app"

#  ╔═╗╦═╗╔═╗╔═╗  ╔═╗╔═╗╦  ╔═╗╦═╗
#  ║ ╦╠╦╝║╣ ╠═╝  ║  ║ ║║  ║ ║╠╦╝
#  ╚═╝╩╚═╚═╝╩    ╚═╝╚═╝╩═╝╚═╝╩╚═

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#  ╔═╗╔═╗╔╗╔╔═╗╦╦═╗╔╦╗  ╔╗ ╔═╗╔═╗╔═╗╦═╗╔═╗  ╔═╗╦  ╦╔═╗╦═╗╦ ╦╦═╗╦╔╦╗╔═╗
#  ║  ║ ║║║║╠╣ ║╠╦╝║║║  ╠╩╗║╣ ╠╣ ║ ║╠╦╝║╣   ║ ║╚╗╔╝║╣ ╠╦╝║║║╠╦╝║ ║ ║╣
#  ╚═╝╚═╝╝╚╝╚  ╩╩╚═╩ ╩  ╚═╝╚═╝╚  ╚═╝╩╚═╚═╝  ╚═╝ ╚╝ ╚═╝╩╚═╚╩╝╩╚═╩ ╩ ╚═╝

alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias lynx='lynx -cfg=~/.lynx/lynx.cfg -lss=~/.lynx/lynx.lss -vikeys'
alias vifm='./.config/vifm/scripts/vifmrun'
alias ncmpcpp='ncmpcpp ncmpcpp_directory=$HOME/.config/ncmpcpp/'
alias mocp='mocp -M "$XDG_CONFIG_HOME"/moc -O MOCDir="$XDG_CONFIG_HOME"/moc'

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# Merge Xresources
alias merge='xrdb -merge ~/.Xresources'

### DTOS ###
# Copy/paste all content of /etc/dtos over to home folder. A backup of config is created. (Be careful running this!)
alias dtoscopy='[ -d ~/.config ] || mkdir ~/.config && cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S) && cp -rf /etc/dtos/* ~'
# Backup contents of /etc/dtos to a backup folder in $HOME.
alias dtosbackup='cp -Rf /etc/dtos ~/dtos-backup-$(date +%Y.%m.%d-%H.%M.%S)'

### BASH INSULTER ###
if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi

#[ -x /bin/fish ] && SHELL=/bin/fish exec fish

cd ~


#####################################################3
export PYTHONPATH=/usr/bin/python3
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

[[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal

#[ -f "/home/trg/.ghcup/env" ] && source "/home/trg/.ghcup/env" # ghcup-env
[ -f "/home/trg/.ghcup/env" ] && source "/home/trg/.ghcup/env" # ghcup-env
