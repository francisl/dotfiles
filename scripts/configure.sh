#!/usr/bin/env zsh

platform=`uname`

if [[ "$platform" == 'Linux' ]]; then
    # Install software
    zsh ~/dotfiles/scripts/linux/dependencies.sh
elif [[ "$platform" == 'Darwin' ]]; then
    # Install software
    echo "Installing dependencies for macOS - none yet"
else
    echo "Unsupported platform: $platform"
    exit 1
fi

zsh ~/dotfiles/scripts/ssh_key.sh

## zsh
zsh ~/dotfiles/scripts/install/oh-my-zsh.sh

## NODE
zsh ~/dotfiles/scripts/install/nvm.sh

## CONFIGURE
zsh ~/dotfiles/scripts/apps/link_config.sh

## NEOVIM
zsh ~/dotfiles/scripts/apps/neovim.sh

## STARSHIP
zsh ~/dotfiles/scripts/apps/starship.sh

## TMUX
zsh ~/dotfiles/scripts/install/tmux.sh

# RETURN HOME
cd ~

