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

## Setup OH-MY-FISH
if [ ! -e ~/.config/fish ];then
    git clone git://github.com/bpinto/oh-my-fish.git ~/.oh-my-fish
    curl https://raw.githubusercontent.com/francisl/dotfiles/master/config/config.fish > ~/.config/fish/config.fish
fi

## ZSH
cd ~
ln -sf ~/dotfiles/zpreztorc .zpreztorc


## JAVA
if [ ! -e eclim_2.4.0.jar ]; then
    wget http://downloads.sourceforge.net/project/eclim/eclim/2.4.0/eclim_2.4.0.jar

    home=$HOME
    echo "HOME ============= $home"
    java -Dvim.files=$home/.vim -Declipse.home=$home/opt/eclipse -jar eclim_2.4.0.jar install

fi

## VIM
~/dotfiles/scripts/vim_config.sh 

# RETURN HOME
cd ~

