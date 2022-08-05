
#     ██╗  ██╗██╗███╗   ██╗██╗████████╗██████╗  ██████╗
#     ╚██╗██╔╝██║████╗  ██║██║╚══██╔══╝██╔══██╗██╔════╝
#      ╚███╔╝ ██║██╔██╗ ██║██║   ██║   ██████╔╝██║     
#      ██╔██╗ ██║██║╚██╗██║██║   ██║   ██╔══██╗██║     
#  ██╗██╔╝ ██╗██║██║ ╚████║██║   ██║   ██║  ██║╚██████╗
#  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝
#                                                      

#Keyboard
	
#Display
#xrandr --output DP-1 --primary --pos 1366x0 --mode 2560x1440 --rate 140 --output eDP-1 --pos 0x672 --mode 1366x768 --rate 60 
#Loop
#
# Start the D-Bus session daemon
eval `dbus-launch`
export DBUS_SESSION_BUS_ADDRESS
#
#
VIMRUNTIME=/usr/bin

# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

# Here dusk is kept as default
#session=${1:-dusk}

#case $session in
#    dusk              ) exec dusk;;
#    dwm               ) exec dwm;;
    
    # No known session, try to run it as command
    #                 ) exec $1;;
#esac


systemctl --user import-environment DISPLAY


while true; do
	xmonad >/dev/null 2>&1
done

	exec xmonad
