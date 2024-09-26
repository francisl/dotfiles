#!/usr/bin/env bash
#

if [ ! -e ~/.zsh_custom.sh ];then
  echo >> ~/.zprofile
  echo '. ~/dotfiles/config/zsh_custom.sh' >> ~/.zprofile
fi

#!/usr/bin/env bash

read -p "Do you want to configure aerospace? (y/n): " configure_aerospace

if [[ "$configure_aerospace" == "y" || "$configure_aerospace" == "Y" ]]; then
    echo "Configuring aerospace"
    ln -sfn $HOME/dotfiles/config/aerospace $HOME/.config/aerospace
else
    echo "Not configured: aerospace"
fi

read -p "Do you want to configure wezterm? (y/n): " configure_wezterm

if [[ "$configure_wezterm" == "y" || "$configure_wezterm" == "Y" ]]; then
    echo "Configuring wezterm"
    ln -sfn $HOME/dotfiles/config/.wezterm.lua $HOME/.wezterm.lua
else
    echo "Not configured: wezterm"
fi
