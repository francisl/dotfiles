#!/usr/bin/env zsh


echo -n "Do you want to configure starship? (y/n): " 
read configure_starship

# Check the user's response
if [[ "$configure_starship" == "y" || "$configure_starship" == "Y" ]]; then
    echo "Configuring starship"
    
    # Check if starship is already configured in .zshrc
    if ! grep -q 'eval "$(starship init zsh)"' ~/.zshrc; then
        echo 'eval "$(starship init zsh)"' >> ~/.zshrc
    else
        echo "Starship is already configured in .zshrc"
    fi

    echo "Configuring wezterm"
    ln -sfn $HOME/dotfiles/config/starship.toml $HOME/.config/starship.toml
else
    echo "Not configured: starship"
fi
