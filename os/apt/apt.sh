#!/bin/bash

sudo apt update -y && sudo apt upgrade -y

yes | sudo apt install build-essential git cmake cmake-data pkg-config libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev pkg-config libuv cairo libxcb python3 xcb-proto xcb-util-image xcb-util-wm python-sphinx python-packaging

tar xvf ~/dotfiles/os/apt/polybar-3.6.2.tar.gz

(cd polybar/ ; mkdir build ; cd build ; cmake .. ; make -j$(nproc) ; sudo make install)


export DEBIAN_FRONTEND=noninteractive
apt-get update -q
apt-get upgrade -q -y

# depencies of i3-gaps
add-apt-repository ppa:aguignard/ppa -y
apt-get update -q
apt-get install -q -y	-o Dpkg::Options::="--force-confdef" \
						-o Dpkg::Options::="--force-confold" \
git automake libtool libxcb-xrm0 libxcb-xrm-dev

apt-get install -q -y   -o Dpkg::Options::="--force-confdef" \
                        -o Dpkg::Options::="--force-confold" \
libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev \
libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev \
libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev \
libxkbcommon-dev libxkbcommon-x11-dev autoconf

# install i3-gaps from source using random script I found online

git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
make install

apt-get install -q -y	-o Dpkg::Options::="--force-confdef" \
						-o Dpkg::Options::="--force-confold" \
dmenu 



