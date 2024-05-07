#!/usr/bin/env bash
# ln -s ~/dotfiles/config/inputrc ~/.inputrc


distro_id=`cat /etc/os-release | grep "^ID="`
readarray -d = -t distro <<< $distro_id

if [ "$distro" = "ubuntu" ]; then
  sudo apt-get -y install setuptools
  sudo apt-get -y install cmake
  sudo apt-get -y install zsh
  sudo apt-get -y install neovim
fi



if [ "$distro" = "manjaro" ]; then
  pamac install neovim
fi
