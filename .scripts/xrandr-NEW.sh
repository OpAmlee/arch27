#!/bin/bash

# 2mon: adjusts displays after plugging or plugging second monitor

# Main laptop display is eDP-1 3840x2160 landscape
# Second ASUS monitor is DP-1 or DP-2 1920x1080 portrait ie. 1080x1920
#                        has to have 2x2 scale or everything appears huge

# Find current monitors
tmp=~/tmp/xrandr.txt
xrandr>$tmp

# Set $dp to DP-1 or DP-2 as appropriate
# xrandr prints "DP-1 connected" and "DP-2 disconnected" or vice versa. But
# don't match eDP-1...
dp=
if   (grep "^DP-1 connected" $tmp >/dev/null);  then dp=DP-1;
elif (grep "^DP-2 connected" $tmp >/dev/null);  then dp=DP-2; fi

if [ "$dp" = "" ]; then
  echo External monitor is not connected

  # Reset pos and frame buffer size in case second monitor was previously connected
  xrandr --output eDP-1 --auto --scale 1x1 --pos 0x0 --fb 1366x768 --primary
else
  echo External monitor is on $dp

  # External monitor to right of main display

  # Main display starts at 2*1080=2160 (2* because of 2x scale)
  # Frame Buffer -fb x-direction is 2*1080=2160 (external) + 3840 (main) = 6000
  #                  y-direction is largest of 2*external y= 3840 and main y = 3840
  xrandr --output $dp   --auto --scale 2x2 --pos 1366x0 --fb 6000x3840 --right-of eDP-1
  xrandr --output eDP-1 --auto --scale 1x1 --pos 0x672 --primary
fi
