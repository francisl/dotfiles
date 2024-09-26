#!/usr/bin/env zsh


echo -n "Do you want to configure starship? (y/n): " 
read configure_starship

# Check the user's response
if [[ "$configure_starship" == "y" || "$configure_starship" == "Y" ]]; then
    echo "Configuring starship"
    echo 'eval "$(starship init zsh)"' >> ~/.zshrc
else
    echo "Not configured: starship"
fi
