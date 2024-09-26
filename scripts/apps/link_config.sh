#!/usr/bin/env zsh
#

if [ ! -e ~/.zsh_custom.sh ];then
  echo >> ~/.zprofile
  echo '. ~/dotfiles/config/zsh_custom.sh' >> ~/.zprofile
fi

#!/usr/bin/env bash

echo -n "Do you want to configure aerospace? (y/n): " 
read configure_aerospace

if [[ "$configure_aerospace" == "y" || "$configure_aerospace" == "Y" ]]; then
    echo "Configuring aerospace"
    ln -sfn $HOME/dotfiles/config/aerospace $HOME/.config/aerospace
else
    echo "Not configured: aerospace"
fi


echo -n "Do you want to configure wezterm? (y/n): " 
read configure_wezterm

if [[ "$configure_wezterm" == "y" || "$configure_wezterm" == "Y" ]]; then
    echo "Configuring wezterm"
    ln -sfn $HOME/dotfiles/config/.wezterm.lua $HOME/.wezterm.lua
else
    echo "Not configured: wezterm"
fi
