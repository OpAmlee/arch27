#	╔╦╗╦═╗╔═╗  \│/  ╔═╗╔═╗╔╗╔╔═╗╦╔═╗  \│/  ╔╗ ╔═╗╔═╗╦ ╦
#	 ║ ╠╦╝║ ╦  ═╬═  ║  ║ ║║║║╠╣ ║║ ╦  ═╬═  ╠╩╗╠═╣╚═╗╠═╣
#	 ╩ ╩╚═╚═╝  /│\  ╚═╝╚═╝╝╚╝╚  ╩╚═╝  /│\  ╚═╝╩ ╩╚═╝╩ ╩
#!/bin/sh

export TERM="xterm-kitty"                      # getting proper colors
export TERMCMD="xterm-kitty"
export HISTCONTROL=ignoredups:erasedups           # no duplicate entries
export ALTERNATE_EDITOR="nvim"                        # setting for emacsclient

export ALTERNATE_EDITOR=''
alias e='emacsclient --tty'
#export EDITOR="emacsclient -t -a ''"              # $EDITOR use Emacs in terminal
#export VISUAL="emacsclient -c -a emacs"           # $VISUAL use Emacs in GUI mode
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox"

alias rc="nvim ~/.bashrc && source ~/.bashrc"

#export SCREEN_SIZE="1366x768 ./scripts/xephyr"

# use nvim for editor in visudo
alias nvim-visudo="sudo EDITOR=nvim visudo"

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

export GDK_DPI_SCALE=0
export GDK_BACKEND=x11
export GDK_SCALE=1.5

complete -c man which


if [ -n "$RANGER_LEVEL" ]; then export PS1="[ranger]$PS1"; fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

HISTSIZE=5000
HISTFILESIZE=10000
#HISTFILE="$HOME/.bash_history"
#export HISTSIZE HISTFILESIZE HISTFILE

#echo HISTSIZE is $HISTSIZE
#echo HISTFILESIZE is $HISTFILESIZE
#echo HISTFILE is $HISTFILE


alias zathura='devour zathura'
alias sxiv='devour sxiv'

set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi
#export PS1="$PS1""\[\e]0;$1 \a\]"

# This is commented out if using starship prompt
#PS1='[\u@\h \W]\$ '


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


case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|kitty|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac


#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

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

[[ -f ~/fzf/fzf_bash ]] && . ~/fzf/fzf_bash
[[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal
[ -f "/home/trg/.ghcup/env" ] && source "/home/trg/.ghcup/env" # ghcup-env
