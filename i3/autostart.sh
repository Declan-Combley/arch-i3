#!/bin/bash

picom --experimental-backends -b 
xrandr --output HDMI-0 --mode 1920x1080 --rate 165

sudo systemctl start bluetooth
