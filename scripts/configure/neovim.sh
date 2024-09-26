#!/usr/bin/env bash


read -p "Do you want to configure neovim? (y/n): " configure_neovim

# Check the user's response
if [[ "$configure_neovim" == "y" || "$configure_neovim" == "Y" ]]; then
    echo "Configuring neovim"
    git clone git@github.com:francisl/neovim-config.git $HOME/.config/nvim 
else
    echo "Not configured: neovim"
fi
