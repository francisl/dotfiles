#!/usr/bin/env zsh

echo -n "Do you want to configure Rofi? (y/n): "
read configure_rofi

# Check the user's response
if [[ "$configure_rofi" == "y" || "$configure_rofi" == "Y" ]]; then
    echo "Configuring Rofi"
    
    # Create necessary directories
    if [[ ! -d "$HOME/.config/rofi" ]]; then
        mkdir -p $HOME/.config/rofi
    fi
    
    # Create a symlink to the config file
    ln -sfn $HOME/dotfiles/config/rofi/config.rasi $HOME/.config/rofi/config.rasi
    
    echo "Rofi configuration completed successfully!"
else
    echo "Not configured: Rofi"
fi