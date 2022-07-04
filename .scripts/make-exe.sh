#!/usr/bin/bash

#create a new exe document for scripts

#chmod +x new.sh

# 2-or without new command you can just type
# mkdir folder && touch $_/file.txt

$ echo 'mkfile() { mkdir -p "$(dirname "$1")" && touch "$1" ;  }' >> ~/.bashrc
$ source ~/.bashrc
$ mkfile ./fldr1/fldr2/file.txt
