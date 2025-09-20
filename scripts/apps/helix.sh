#!/usr/bin/env zsh

echo -n "Do you want to configure helix? (y/n): " 
read configure_helix

# Check the user's response
if [[ "$configure_helix" == "y" || "$configure_helix" == "Y" ]]; then
    echo "Configuring helix"
    if [[ -d "$HOME/.config/helix" ]]; then
        rm -rf $HOME/.config/helix
    fi
    ln -sfn $HOME/dotfiles/config/helix $HOME/.config/helix
else
    echo "Not configured: helix"
fi 
