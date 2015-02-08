#!/usr/bin/env bash

platform=`uname`

# create necessary directory
mkdir ~/opt
cd ~/opt

## CONFIGURE LOCAL FILES
if [ -e ~/.profile -a ! -e ~/.local_profile ];then
    mv ~/.profile ~/.local_profile
fi


if [[ "$platform" == 'Linux' ]]; then
    ~/dotfiles/install_linux.sh
elif [[ "$platform" == 'Darwin' ]]; then
    ~/dotfiles/install_mac.sh
fi

## set environment for bash/ZSH
if [[ "$platform" == 'Linux' ]]; then
    ln -sf ~/dotfiles/profile ~/.bash_profile
	ln -sf ~/dotfiles/bashrc ~/.bashrc
elif [[ "$platform" == 'Darwin' ]]; then
    ln -sf ~/dotfiles/profile ~/.profile
	ln -sf ~/dotfiles/bashrc ~/.bashrc
fi

## Setup OH-MY-FISH
if [ ! -e ~/.config/fish ];then
    git clone git://github.com/bpinto/oh-my-fish.git ~/.oh-my-fish
    curl https://raw.githubusercontent.com/francisl/dotfiles/master/config.fish > ~/.config/fish/config.fish
fi


## ZSH
cd ~
ln -sf ~/dotfiles/zpreztorc .zpreztorc


## JAVA
if [ ! -e eclim_2.4.0.jar ]; then
    wget http://downloads.sourceforge.net/project/eclim/eclim/2.4.0/eclim_2.4.0.jar
fi
home=$HOME
echo "HOME ============= $home"
java -Dvim.files=$home/.vim -Declipse.home=$home/opt/eclipse -jar eclim_2.4.0.jar install

## VIM
~/dotfiles/vim_config.sh 


## 


# RETURN HOME
cd ~

