#!/usr/bin/env zsh


echo -n "Do you want to install oh-my-zsh? (y/n): " 
read install_ohmyzsh

# Check the user's response
if [[ "$install_ohmyzsh" == "y" || "$install_ohmyzsh" == "Y" ]]; then
    echo "Installing ZSH"
    chsh -s $(which zsh)
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Not Install: oh-my-zsh"
fi
