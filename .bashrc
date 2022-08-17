#	╔╦╗╦═╗╔═╗  \│/  ╔═╗╔═╗╔╗╔╔═╗╦╔═╗  \│/  ╔╗ ╔═╗╔═╗╦ ╦
#	 ║ ╠╦╝║ ╦  ═╬═  ║  ║ ║║║║╠╣ ║║ ╦  ═╬═  ╠╩╗╠═╣╚═╗╠═╣
#	 ╩ ╩╚═╚═╝  /│\  ╚═╝╚═╝╝╚╝╚  ╩╚═╝  /│\  ╚═╝╩ ╩╚═╝╩ ╩
#!/bin/sh
#   ╔╦╗╦═╗╔═╗  \│/  ╔═╗╔═╗╔╗╔╔═╗╦╔═╗  \│/  ═╗ ╦╔═╗╦═╗╔═╗╔═╗╦╦  ╔═╗
#    ║ ╠╦╝║ ╦═══╬══ ║  ║ ║║║║╠╣ ║║ ╦═══╬═══╔╩╦╝╠═╝╠╦╝║ ║╠╣ ║║  ║╣
#    ╩ ╩╚═╚═╝  /│\  ╚═╝╚═╝╝╚╝╚  ╩╚═╝  /│\  ╩ ╚═╩  ╩╚═╚═╝╚  ╩╩═╝╚═╝

#export SUDO_ASKPASS="$HOME/.local/bin/dm-pass"
#export TERMINFO="$XDG_DATA_HOME"/terminfo
#export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo

export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export DOOMDIR="${XDG_CONFIG_HOME:-$HOME/.config}/doom"
export DOTBARE_DIR="$HOME/.cfg"
export DOTBARE_TREE="$HOME"
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
#export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export KITTY_CONFIG_DIRECTORY="${XDG_CONFIG_HOME:-$HOME/.config}/kitty.d"
export KITTY_CACHE_DIRECTORY="${XDG_CACHE_HOME:-$HOME/.cache/kitty}"
export LESSHISTFILE="-"
#export MOZ_LEGACY_HOME="${XDG_CONFIG_HOME:-$HOME/.config/}mozilla"
#export MOZ_PROFILE_HOME="${XDG_CONFIG_HOME:-$HOME/.config/}mozilla"
export npm_config_prefix="$HOME/.local"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME:-$HOME/.config/}/npm/npmrc"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"
export PATH=”$HOME/.emacs.d/bin:$PATH”
#export PATH=\"$(pwd)/git-fuzzy/bin:\$PATH\
#export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
#export PYENV_ROOT=$XDG_DATA_HOME/pyenv
export STARSHIP_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/starship/starship.toml"
export STARSHIP_CACHE="${XDG_CACHE_HOME:-$HOME/.cache/starship}"
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XMONAD_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/xmonad"
export XMONAD_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache/}xmonad"
export XMONAD_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config/}xmonad"
#export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"

export BROWSER="firefox"
export EDITOR="nvim"
export PAGER="bat"
export READER="xpdf"
export TERMINAL="urxvt"
export VIDEO="mpv"
#export VISUAL="emacsclient -c -a emacs"
export VISUAL="nvim"


command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PKG_CONFIG_PATH="/usr/lib/pkgconfig"
export ALTERNATE_EDITOR="nvim"
export GDK_DPI_SCALE=0
export GDK_BACKEND=x11
export GDK_SCALE=1.3
export HISTCONTROL=ignoredups:erasedups
export LC_ALL="en_US.UTF-8"
#export PLASMA_USE_QT_SCALING=1
#export QT_AUTO_SCREEN_SCALE_FACTOR=1
#export QT_QPA_PLATFORMTHEME=qt5ct
export SCREEN_SIZE="1366x768 ./scripts/xephyr"
export TERMINFO=/usr/share/terminfo
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper_lazy.sh


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

complete -c man which

if [ -n "$RANGER_LEVEL" ]; then export PS1="[ranger]$PS1"; fi






# history
HISTSIZE=5000
HISTFILESIZE=5000
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



#[ -x /bin/fish ] && SHELL=/bin/fish exec fish

cd ~


#eval `keychain --eval id_rsa --quiet`

#####################################################3
#export PYTHONPATH=/usr/bin/python3
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

[[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal

[ -f "/home/trg/.ghcup/env" ] && source "/home/trg/.ghcup/env" # ghcup-env


#export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
# export GTK2_RC_FILES="$HOME/.gtk-2.0"
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


