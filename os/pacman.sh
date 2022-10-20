#!/bin/bash

sudo pacman -Syyu

git clone https://aur.archlinux.org/yay-git ~/.config/yay-git && (cd ~/.config/yay-git/ && yes | makepkg -si) && echo "installed the aur"

yay -S picom-git
yes | yay -S ttc-iosevka 

sudo pacman -S man zsh tmux rxvt-unicode emacs polybar picom caja bluez bluez-utils pulseaudio-bluetooth unzip btop pavucontrol feh rlwrap evince flameshot man-pages noto-fonts noto-fonts-extra noto-fonts-cjk
sudo pacman -Fy

