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

## Fish shell

### Setup OH-MY-FISH
if [ ! -e ~/.config/fish ];then
    curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish
fi

### Fish config
ln -fs ~/dotfiles/config/config.fish ~/.config/fish/config.fish

## ZSH
cd ~
ln -sf ~/dotfiles/zpreztorc .zpreztorc

## VIM
~/dotfiles/scripts/vim_config.sh 

# RETURN HOME
cd ~

