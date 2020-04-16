#!/bin/bash

xrandr --output HDMI-0 --auto --output DP-4 --left-of HDMI-0
xrandr --output HDMI-0 --auto --output DP-1 --right-of HDMI-0
xrandr --output DP-1 --mode 800x600
xrandr --output DP-1 --mode 1920x1080
xrandr --output DP-4 --mode 800x600
xrandr --output DP-4 --mode 1920x1080
xrandr --output HDMI-0 --primary
