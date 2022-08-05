# Setup fzf
# ---------
if [[ ! "$PATH" == */home/trg/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/trg/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/trg/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/trg/.fzf/shell/key-bindings.bash"
