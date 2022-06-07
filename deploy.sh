#!/bin/sh

git clone https://aur.archlinux.org/yay-git ~/.config/yay-git && (cd ~/.config/yay-git/ && yes | makepkg -si)

yay -S picom-git
yay -S nerd-fonts-iosevka
yes | yay -S ttc-iosevka 

yes | sudo pacman -Syyu && yes | sudo pacman -S zsh tmux rxvt-unicode emacs polybar picom caja bluez bluez-utils pulseaudio-bluetooth unzip

if [ -f ~/.bashrc ] ; then ; rm ~/.bashrc ; fi
if [ -f ~/.emacs ] ; then ; rm ~/.emacs ; fi
if [ -d ~/.config/i3/ ] ; then ; rm -rf ~/.config/i3/ ; fi

SCRIPT_DIR="$( cd "$( dirname "$BASH_SOURCE[0]" )" && pwd )"

symlinkFile() {
    filename="$SCRIPT_DIR/$1"
    destination="$HOME/$2/$1"

    mkdir -p $(dirname "$destination")
    
    if [ ! -L "$destination" ]; then
        if [ -e "$destination" ]; then
            echo "[ERROR] $destination exists but it's not a symlink. Please fix that manually" && exit 1
        else
            ln -s "$filename" "$destination"
            echo "[OK] $filename -> $destination"
        fi
    else
        echo "[WARNING] $filename already symlinked"
    fi
}

deployManifest() {
    for row in $(cat $SCRIPT_DIR/$1); do
        filename=$(echo $row | cut -d \| -f 1)
        operation=$(echo $row | cut -d \| -f 2)
        destination=$(echo $row | cut -d \| -f 3)

        case $operation in
            symlink)
                symlinkFile $filename $destination
                ;;

            *)
                echo "[WARNING] Unknown operation $operation. Skipping..."
                ;;
        esac
    done
}

echo "--- Common configs ---"
deployManifest MANIFEST
echo "--- Linux configs ---"
deployManifest MANIFEST.linux
