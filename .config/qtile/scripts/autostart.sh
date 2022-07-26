#!/bin/env bash

# Merge Refresh Xresources{{{
xrdb -merge ~/.Xresources
#}}}

# Functions {{{
    function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
    }
#}}}

run "urxvtd -q"

run "$HOME/.scripts/xrandr-login.sh"

run "touchegg"



# Keyboard remaps & sxhkd{{{
run sxhkd -c ~/.config/qtile/sxhkd/sxhkdrc
$HOME/.scripts/change-caps2esc.sh &
$HOME/.scripts/change-rctrl2esc.sh &

#}}}

# Conky{{{
#sleep 2 && conky -c ~/.config/conky/conky-bar-time &
#}}}

# Draw wallpaper{{{
run  feh --bg-fill ~/.config/qtile/wallpapers/wallpaper.jpg
#}}}

# Run compositor{{{
if pgrep -x "picom" > /dev/null
then
	killall picom
	sleep 1
	picom -b --config $HOME/.config/qtile/picom.conf
else
	picom -b --config $HOME/.config/qtile/picom.conf
fi
#}}}

#$HOME/.scripts/startonsecond.sh

run dunst -config $HOME/.config/qtile/dunstrc &

if [[ ! `pidof xfce-polkit` ]]; then
    /usr/lib/xfce-polkit/xfce-polkit &
fi


