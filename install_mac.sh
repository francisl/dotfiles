#!/usr/bin/env bash


## ANDROID
wget http://dl.google.com/android/android-sdk_r23.0.2-macosx.zip
unzip android-sdk_r23.0.2-macosx.zip
rm android-sdk_r23.0.2-macosx.zip

wget http://dl.google.com/android/ndk/android-ndk64-r10b-darwin-x86_64.tar.bz2
tar -xjf android-ndk64-r10b-darwin-x86_64.tar.bz2
rm android-ndk64-r10b-darwin-x86_64.tar.bz2
ln -s android-ndk-r10b android-ndk

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


## fish-shell
brew install fish
chsh -s /usr/local/bin/fish

