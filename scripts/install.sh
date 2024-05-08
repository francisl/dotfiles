#!/usr/bin/env bash

platform=`uname`

# create necessary directory
mkdir ~/opt
cd ~/opt

## set environment for bash/ZSH
if [[ "$platform" == 'Linux' ]]; then
    ./deps/linux.sh
elif [[ "$platform" == 'Darwin' ]]; then
    ./deps/mac.sh
fi

./link_config.sh

~/dotfiles/script/zsh.sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## NODE
~/dotfiles/scripts/node/nvm.sh

# RETURN HOME
cd ~
