#!/bin/bash
current_sxhkd_pid=$(ps -ef | awk '/[s]xhkd/\{print $2\}') && kill -9 "$\{current_sxhkd_pid\}" && notify-send -u low -t 5000 "Update: Restarting sxhkd."\
