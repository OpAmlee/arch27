#!/usr/bin/env bash

name=sxhkd
flag=/tmp/hotkeys.flag
bin=/usr/bin/$name
config=$HOME/.config/sxhkd/sxhkdrc

function restart() {
    pkill --signal SIGUSR1 $name
}

function start() {
    cd /tmp
    DISPLAY=:1 $bin &> /tmp/$name.log
    exit
}

pgrep $name || start

if [[ "$config" -nt "$flag" ]]
then
    restart
    touch $flag
fi
