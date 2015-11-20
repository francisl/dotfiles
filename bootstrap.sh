#!/usr/bin/env bash

platform=`uname`

# create necessary directory
mkdir -p ~/opt
cd ~/opt

if [[ "$platform" == 'Linux' ]]; then
    echo installing git
    sudo apt-get install git curl
elif [[ "$platform" == 'Darwin' ]]; then
    # Homebrew
    brewbin=`which brew`
    if [ ! $brewbin ]; then
        echo installing brew ..
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    brew install git wget
fi

cd ~
if [ ! -z ~/dotfiles ]; then
    git clone https://github.com/francisl/dotfiles.git
fi

cd ~/dotfiles
git fetch --all
git reset --hard origin/master

./scripts/install.sh
