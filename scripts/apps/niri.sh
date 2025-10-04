#!/usr/bin/env zsh

echo -n "Do you want to configure Niri? (y/n): "
read configure_niri

# Check the user's response
if [[ "$configure_niri" == "y" || "$configure_niri" == "Y" ]]; then
    echo "Configuring Niri"
    
    # Create necessary directories
    if [[ ! -d "$HOME/.config/niri" ]]; then
        mkdir -p $HOME/.config/niri
    fi
    
    # Create a symlink to the config file
    ln -sfn $HOME/dotfiles/config/niri/config.kdl $HOME/.config/niri/config.kdl
    
    echo "Niri configuration completed successfully!"
else
    echo "Not configured: Niri"
fi