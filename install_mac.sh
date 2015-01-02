#!/usr/bin/env bash


## ANDROID
if [ ! -e ~/opt/android-sdk ]; then
	cd ~/opt
    wget http://dl.google.com/android/android-sdk_r23.0.2-macosx.zip
    unzip android-sdk_r23.0.2-macosx.zip
    rm android-sdk_r23.0.2-macosx.zip

    wget http://dl.google.com/android/ndk/android-ndk64-r10b-darwin-x86_64.tar.bz2
    tar -xjf android-ndk64-r10b-darwin-x86_64.tar.bz2
    rm android-ndk64-r10b-darwin-x86_64.tar.bz2
    ln -s android-ndk-r10b android-ndk
fi

## Eclipse
if [ ! -e ~/opt/eclipse ]; then
	cd ~/opt
	wget http://mirror.csclub.uwaterloo.ca/eclipse/technology/epp/downloads/release/luna/SR1/eclipse-java-luna-SR1-macosx-cocoa-x86_64.tar.gz
    tar -zxf eclipse-java-luna-SR1-macosx-cocoa-x86_64.tar.gz
fi

# HomebrewA
brewbin=`which brew`
if [ ! -e $brewbin ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

## fish-shell
if [ ! -e `which fish` ]; then
    brew install fish
fi
#chsh -s /usr/local/bin/fish

## VIM OSX
#brew install vim --override-system-vim --without-python
if [ ! -e `which nvim` ]; then
    brew tap neovim/homebrew-neovim
    brew install --HEAD neovim
fi 


