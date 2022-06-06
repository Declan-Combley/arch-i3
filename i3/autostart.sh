#!/bin/bash

picom --experimental-backends -b 
xrandr --output HDMI-0 --mode 1920x1080 --rate 165

sudo systemctl enable bluetooth
sudo systemctl start bluetooth
