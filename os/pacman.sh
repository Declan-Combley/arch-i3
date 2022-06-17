#!/bin/bash

git clone https://aur.archlinux.org/yay-git ~/.config/yay-git && (cd ~/.config/yay-git/ && yes | makepkg -si) && echo "installed the aur"

yay -S picom-git
yes | yay -S ttc-iosevka 

yes | sudo pacman -Syyu && yes | sudo pacman -S man zsh tmux rxvt-unicode emacs polybar picom caja bluez bluez-utils pulseaudio-bluetooth unzip btop man-pages pavucontrolx feh

