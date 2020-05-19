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

if [ ! -e ~/.z_custom_profile ];then
  echo >> ~/.zprofile
  echo . ~/dotfiles/config/z_custom_profile >> ~/.zprofile
fi

## ZSH
~/dotfiles/script/zsh.sh

## NODE
~/dotfiles/scripts/node/nvm.sh

## SDKMAN
~/dotfiles/scripts/jvm/sdkman.sh

# RETURN HOME
cd ~
