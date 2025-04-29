#!/usr/bin/env zsh

echo -n "Do you want to configure Ghostty? (y/n): " 
read configure_ghostty

# Check the user's response
if [[ "$configure_ghostty" == "y" || "$configure_ghostty" == "Y" ]]; then
    echo "Configuring Ghostty"
    mkdir -p $HOME/.config/ghostty
    ln -sfn $HOME/dotfiles/config/ghostty/config $HOME/.config/ghostty/config
else
    echo "Not configured: Ghostty"
fi 