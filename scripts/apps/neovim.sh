#!/usr/bin/env zsh

echo -n "Do you want to configure neovim? (y/n): " 
read configure_neovim

# Check the user's response
if [[ "$configure_neovim" == "y" || "$configure_neovim" == "Y" ]]; then
    echo "Configuring neovim"
    if [[ -d "$HOME/.config/nvim" ]]; then
        echo "Neovim config already exists, updating..."
        cd "$HOME/.config/nvim" && git pull
    else
        git clone git@github.com:francisl/neovim-config.git $HOME/.config/nvim
    fi
else
    echo "Not configured: neovim"
fi