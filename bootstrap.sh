#!/usr/bin/env bash


# Homebrew
brewbin=`which brew`
if [ ! -e $brewbin ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
