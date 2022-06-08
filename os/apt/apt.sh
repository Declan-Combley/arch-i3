#!/bin/bash

sudo apt update -y && sudo apt upgrade -y

yes | sudo apt install build-essential cmake-data pkg-config libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev pkg-config libuv sudo apt install cmake gcc-arm-none-eabi libnewlib-arm-none-eabi libstdc++-arm-none-eabi-newlib 

curl https://baltocdn.com/i3-window-manager/signing.asc | sudo apt-key add -
sudo apt install apt-transport-https --yes
echo "deb https://baltocdn.com/i3-window-manager/i3/i3-autobuild/ all main" | sudo tee /etc/apt/sources.list.d/i3-autobuild.list
sudo apt update
sudo apt install i3

tar xvf ~/dotfiles/os/apt/polybar-3.6.2.tar.gz

(cd polybar/ ; mkdir build ; cd build ; cmake .. ; make -j$(nproc) ; sudo make install)

export DEBIAN_FRONTEND=noninteractive
apt-get update -q
apt-get upgrade -q -y

apt-get install -q -y	-o Dpkg::Options::="--force-confdef" \
						-o Dpkg::Options::="--force-confold" \
dmenu 



