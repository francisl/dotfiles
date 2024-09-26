#!/usr/bin/env zsh


echo -n "Do you want to configure neovim? (y/n): " 
read configure_neovim

# Check the user's response
if [[ "$configure_neovim" == "y" || "$configure_neovim" == "Y" ]]; then
    echo "Configuring neovim"
    git clone git@github.com:francisl/neovim-config.git $HOME/.config/nvim 
else
    echo "Not configured: neovim"
fi
