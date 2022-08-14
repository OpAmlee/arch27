#	╔╦╗╦═╗╔═╗  \│/  ╔═╗╔═╗╔╗╔╔═╗╦╔═╗  \│/  ╔╗ ╔═╗╔═╗╦ ╦
#	 ║ ╠╦╝║ ╦  ═╬═  ║  ║ ║║║║╠╣ ║║ ╦  ═╬═  ╠╩╗╠═╣╚═╗╠═╣
#	 ╩ ╩╚═╚═╝  /│\  ╚═╝╚═╝╝╚╝╚  ╩╚═╝  /│\  ╚═╝╩ ╩╚═╝╩ ╩
#!/bin/sh

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

complete -c man which

if [ -n "$RANGER_LEVEL" ]; then export PS1="[ranger]$PS1"; fi






# history
HISTSIZE=500
HISTFILESIZE=1000
#HISTFILE="$HOME/.bash_history"
#export HISTSIZE HISTFILESIZE HISTFILE
#echo HISTSIZE is $HISTSIZE
#echo HISTFILESIZE is $HISTFILESIZE
#echo HISTFILE is $HISTFILE



# standardizing your editing commands
set -o vi


# keybinds

# If not running interactively, don't do anything
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
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


eval `keychain --eval id_rsa --quiet`
#####################################################3
#export PYTHONPATH=/usr/bin/python3
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

[[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal

[ -f "/home/trg/.ghcup/env" ] && source "/home/trg/.ghcup/env" # ghcup-env

export PATH="/home/trg/git-fuzzy/bin:$PATH"


# FZF 
export FZF_MARKS_CMD="$HOME/.config/fzf/bin/fzf"
export FZF_MARKS_FILE="$HOME/.config/fzf/plugin/.fzf_marks"
export FZF_FZM_OPTS="--reverse --height 75% --min-height 30 --cycle +m --ansi --bind=ctrl-o:accept,ctrl-t:toggle --select-1"
export FZF_DMARK_OPTS="--reverse --height 75% --min-height 30 --cycle -m --ansi --bind=ctrl-o:accept,ctrl-t:toggle"

export FZF_COMPLETION_OPTS='--border --info=inline'
#export FZF_DEFAULT_OPTS=" \
#    --border rounded \
#    --reverse \
#    --height 75% \
#    --min-height 30 \
#    --cycle -m \
#    --ansi \
#    --bind=ctrl-o:accept,ctrl-t:toggle"

#    --color='bg:237,bg+:236,info:143,border:240,spinner:108' \
#        --color='hl:65,fg:252,header:65,fg+:252' \
#        --color='pointer:161,marker:168,prompt:110,hl+:108'

# First load fzf stuff as usual.
[ -f $HOME/.config/fzf/plugin/fzf-bash ] && source $HOME/.config/fzf/plugin/fzf-bash
[ -f $HOME/.config/fzf/plugin/fzf-bash-completion ] && source $HOME/.config/fzf/plugin/fzf-bash-completion
[ -f $HOME/.config/fzf/plugin/fzf-bash-history ] && source $HOME/.config/fzf/plugin/fzf-bash-history
[ -f $HOME/.config/fzf/fzf-ranger-opts ] && source $HOME/.config/fzf/fzf-ranger-opts
[ -f $HOME/.config/fzf/fzf-completion-opts ] && source $HOME/.config/fzf/fzf-completion-opts
# Then configure and load this plugin.
FZF_CTRL_R_EDIT_KEY=ctrl-e
FZF_CTRL_R_EXEC_KEY=enter


bind "set completion-ignore-case on"
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'
bind -x '"\C-p": __fzf_history__'

bind -x '"\t": fzf_bash_completion'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/trg/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/trg/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/trg/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/trg/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


