#!/usr/bin/env zsh

echo -n "Do you want to configure wezterm? (y/n): " 
read configure_wezterm

# Check the user's response
if [[ "$configure_wezterm" == "y" || "$configure_wezterm" == "Y" ]]; then
    echo "Configuring wezterm"
    if [[ ! -d "$HOME/.config/wezterm" ]]; then
        mkdir -p $HOME/.config/wezterm
    fi
    ln -sfn $HOME/dotfiles/config/wezterm.lua $HOME/.wezterm.lua
else
    echo "Not configured: wezterm"
fi 
