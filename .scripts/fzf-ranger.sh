#!/bin/bash

find ~/.config/ranger -type f | fzf --height 95% --reverse --border=rounded \
--preview 'bat --style=numbers --color=always --line-range :500 {}' \
--color 'fg:#928374,fg+:#18E406,bg:#121212,preview-bg:#1F2022,border:#F47309' \
--bind 'enter:execute(-e nvim)'
