#!/usr/bin/env bash

## BREW
if [ ! `which brew` ]; then
    echo "Installing brew .."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating brew"
brew update
brew upgrade

brew install neovim

