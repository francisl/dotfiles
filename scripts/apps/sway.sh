#!/usr/bin/env zsh

echo -n "Do you want to configure Sway? (y/n): "
read configure_sway

# Check the user's response
if [[ "$configure_sway" == "y" || "$configure_sway" == "Y" ]]; then
    echo "Configuring Sway"
    
    # Create necessary directories
    if [[ ! -d "$HOME/.config/sway" ]]; then
        mkdir -p $HOME/.config/sway
    fi
    
    # Create a symlink to the config file
    ln -sfn $HOME/dotfiles/config/sway/config $HOME/.config/sway/config
    
    echo "Sway configuration completed successfully!"
else
    echo "Not configured: Sway"
fi 