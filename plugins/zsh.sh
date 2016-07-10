#!/usr/bin/env bash

echo "Installing ZSH"

if [ ! -z ~/.zprezto ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${HOME}/.zprezto"
fi

zsh ~/dotfiles/plugins/zsh_config.zsh

ln -sf ~/dotfiles/config/zpreztorc .zpreztorc

chsh -s $(which zsh)
