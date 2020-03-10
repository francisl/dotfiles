#!/usr/bin/env bash

platform=`uname`

# create necessary directory
mkdir ~/opt
cd ~/opt

## set environment for bash/ZSH
if [[ "$platform" == 'Linux' ]]; then
    ~/dotfiles/scripts/install_linux.sh
elif [[ "$platform" == 'Darwin' ]]; then
    ~/dotfiles/scripts/install_mac.sh
fi

if [ ! -e ~/.local_profile ];then
  echo >> ~/.bashrc
  echo . ~/dotfiles/config/customrc >> ~/.bashrc
fi

## ZSH
~/dotfiles/plugins/zsh.sh

# Node
echo "Installing NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash


# RETURN HOME
cd ~
