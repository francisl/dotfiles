#!/usr/bin/env zsh

echo -n "Do you want to configure Hyprland? (y/n): "
read configure_hyprland

# Check the user's response
if [[ "$configure_hyprland" == "y" || "$configure_hyprland" == "Y" ]]; then
    echo "Configuring Hyprland"
    
    # Create necessary directories
    if [[ ! -d "$HOME/.config/hypr" ]]; then
        mkdir -p $HOME/.config/hypr
    fi
    
    # Create a symlink to the config file
    ln -sfn $HOME/dotfiles/config/hypr/hyprland.conf $HOME/.config/hypr/hyprland.conf
    
    echo "Hyprland configuration completed successfully!"
else
    echo "Not configured: Hyprland"
fi 