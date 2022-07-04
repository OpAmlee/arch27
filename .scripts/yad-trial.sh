#!/usr/bin/env bash
#[ -n /tmp/tmp.Nl0h01gjEa ] && yad --text "$(cat /tmp/tmp.Nl0h01gjEa)" || echo "helper file not found"

yad --notification --image=update.png --text "System update necessary!" --command "xterm -e apt-get upgrade"
