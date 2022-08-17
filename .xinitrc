
#     ██╗  ██╗██╗███╗   ██╗██╗████████╗██████╗  ██████╗
#     ╚██╗██╔╝██║████╗  ██║██║╚══██╔══╝██╔══██╗██╔════╝
#      ╚███╔╝ ██║██╔██╗ ██║██║   ██║   ██████╔╝██║     
#      ██╔██╗ ██║██║╚██╗██║██║   ██║   ██╔══██╗██║     
#  ██╗██╔╝ ██╗██║██║ ╚████║██║   ██║   ██║  ██║╚██████╗
#  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝
#                                                      

# Make sure this is before the 'exec' command or it won't be sourced.

# Start the D-Bus session daemon
eval `dbus-launch`
export DBUS_SESSION_BUS_ADDRESS
#
#
VIMRUNTIME=/usr/bin



# Here dusk is kept as default
#session=${1:-dusk}

#case $session in
#    dusk              ) exec dusk;;
#    dwm               ) exec dwm;;
    
    # No known session, try to run it as command
    #                 ) exec $1;;
#esac
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile


systemctl --user import-environment DISPLAY


while true; do
	xmonad >/dev/null 2>&1
done

	exec xmonad
