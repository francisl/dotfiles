#!/usr/bin/env bash

platform=`uname`

# create necessary directory
mkdir ~/opt
cd ~/opt

## set environment for bash/ZSH
if [[ "$platform" == 'Linux' ]]; then
    ~/dotfiles/scripts/linux.sh
elif [[ "$platform" == 'Darwin' ]]; then
    ~/dotfiles/scripts/mac.sh
fi

if [ ! -e ~/.zsh_custom.sh ];then
  echo >> ~/.zprofile
  echo . ~/dotfiles/config/zsh_custom.sh >> ~/.zprofile
fi

## ZSH
~/dotfiles/script/zsh.sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## NODE
~/dotfiles/scripts/node/nvm.sh

# RETURN HOME
cd ~
