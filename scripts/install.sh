#!/usr/bin/env bash

platform=`uname`

# create necessary directory
mkdir ~/opt
cd ~/opt

## set environment for bash/ZSH
if [[ "$platform" == 'Linux' ]]; then
    ~/dotfiles/scripts/install_linux.sh
    if [ -e ~/.bashrc -a ! -e ~/.local_profile ];then
        mv ~/.bashrc ~/.local_profile
    fi
	ln -sf ~/dotfiles/config/bashrc ~/.bashrc

elif [[ "$platform" == 'Darwin' ]]; then
    ~/dotfiles/scripts/install_mac.sh
    if [ -e ~/.profile -a ! -e ~/.local_profile ];then
        mv ~/.profile ~/.local_profile
    fi
	ln -sf ~/dotfiles/config/bashrc ~/.bashrc
	ln -sf ~/dotfiles/config/bash_profile ~/.bash_profile
fi

## ZSH
~/dotfiles/plugins/zsh.sh

# Node
echo "Installing NVM"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash

# RETURN HOME
cd ~
