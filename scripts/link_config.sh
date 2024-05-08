#!/usr/bin/env bash
#

if [ ! -e ~/.zsh_custom.sh ];then
  echo >> ~/.zprofile
  echo . ~/dotfiles/config/zsh_custom.sh >> ~/.zprofile
fi

ln -s  ~`pwd`/config/alacritty.toml ~/.config/alacritty/alacritty.toml

