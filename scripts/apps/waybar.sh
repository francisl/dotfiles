#!/usr/bin/env zsh

echo -n "Do you want to configure Waybar? (y/n): "
read configure_waybar

# Check the user's response
if [[ "$configure_waybar" == "y" || "$configure_waybar" == "Y" ]]; then
    echo "Configuring Waybar"
    
    # Remove existing waybar config directory if it exists
    if [[ -d "$HOME/.config/waybar" ]]; then
        rm -rf $HOME/.config/waybar
    fi
    
    # Create symlink to the entire waybar configuration directory
    ln -sfn $HOME/dotfiles/config/waybar $HOME/.config/waybar
    
    # Make launch.sh executable (it will be accessible through the symlinked directory)
    chmod +x $HOME/.config/waybar/launch.sh
    
    echo "Waybar configuration completed successfully!"
    echo "All waybar files (themes, scripts, configs) are now linked as a directory"
else
    echo "Not configured: Waybar"
fi
