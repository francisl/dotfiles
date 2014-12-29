#!/usr/bin/env bash


## ANDROID
if [ ! -e ./android-sdk ]; then
    wget http://dl.google.com/android/android-sdk_r23.0.2-macosx.zip
    unzip android-sdk_r23.0.2-macosx.zip
    rm android-sdk_r23.0.2-macosx.zip

    wget http://dl.google.com/android/ndk/android-ndk64-r10b-darwin-x86_64.tar.bz2
    tar -xjf android-ndk64-r10b-darwin-x86_64.tar.bz2
    rm android-ndk64-r10b-darwin-x86_64.tar.bz2
    ln -s android-ndk-r10b android-ndk
fi

# HomebrewA
brewbin=`which brew`
if [ ! -e $brewbin ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

## fish-shell
brew install fish
#chsh -s /usr/local/bin/fish

