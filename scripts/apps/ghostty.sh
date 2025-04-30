#!/usr/bin/env zsh

echo -n "Do you want to configure Ghostty? (y/n): " 
read configure_ghostty

# Check the user's response
if [[ "$configure_ghostty" == "y" || "$configure_ghostty" == "Y" ]]; then
    echo "Configuring Ghostty"
    if [[ ! -d "$HOME/.config/ghostty" ]]; then
        mkdir -p $HOME/.config/ghostty
    fi
    ln -sfn $HOME/dotfiles/config/ghostty/config $HOME/.config/ghostty/config
else
    echo "Not configured: Ghostty"
fi 