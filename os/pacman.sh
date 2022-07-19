#!/bin/bash

sudo pacman -Syyu
sudo pacman -S man-pages

git clone https://aur.archlinux.org/yay-git ~/.config/yay-git && (cd ~/.config/yay-git/ && yes | makepkg -si) && echo "installed the aur"

yay -S picom-git
yes | yay -S ttc-iosevka 

sudo pacman -S man zsh tmux rxvt-unicode emacs polybar picom caja bluez bluez-utils pulseaudio-bluetooth unzip btop pavucontrol feh rlwrap 

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
