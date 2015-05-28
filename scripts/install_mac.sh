#!/usr/bin/env bash

## ANDROID
if [ ! -e ~/opt/android-sdk ]; then
	cd ~/opt
    wget http://dl.google.com/android/android-sdk_r23.0.2-macosx.zip
    unzip android-sdk_r23.0.2-macosx.zip
    rm android-sdk_r23.0.2-macosx.zip
    mv android-sdk-macosx android-sdk
fi

if [ ! -e ~/opt/android-ndk ]; then
    wget http://dl.google.com/android/ndk/android-ndk64-r10b-darwin-x86_64.tar.bz2
    tar -xjf android-ndk64-r10b-darwin-x86_64.tar.bz2
    rm android-ndk64-r10b-darwin-x86_64.tar.bz2
    ln -s android-ndk-r10b android-ndk
fi

if [ ! `which javac` ]; then
    cd ~/Downloads
    curl http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-macosx-x64.dmg
    open jdk-8u25-macosx-x64.dmg
fi

## Eclipse
if [ ! -e ~/opt/eclipse ]; then
	cd ~/opt
	wget http://mirror.csclub.uwaterloo.ca/eclipse/technology/epp/downloads/release/luna/SR1/eclipse-java-luna-SR1-macosx-cocoa-x86_64.tar.gz
    tar -zxf eclipse-java-luna-SR1-macosx-cocoa-x86_64.tar.gz
fi


## BREW
if [ ! `which brew` ]; then
    echo "Installing brew .."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating brew"
brew update
brew upgrade

## fish-shell
if [ ! `which fish` ]; then
    brew install fish
fi
#chsh -s /usr/local/bin/fish

## VIM OSX
brew install vim --override-system-vim --without-python
if [ ! `which nvim` ]; then
    brew tap neovim/homebrew-neovim
    brew install --HEAD neovim
fi 

## EMACS
brew install emacs --with-cocoa
cp -r /usr/local/Cellar/emacs/24.5/Emacs.app /Applications
sudo rm /usr/bin/emacs
sudo rm -rf /usr/share/emacs
