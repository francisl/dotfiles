#!/usr/bin/env zsh
#

if [ ! -e ~/.zsh_custom.sh ];then
  if ! grep -qF '. ~/dotfiles/config/zsh_custom.sh' ~/.zprofile; then
    echo >> ~/.zprofile
    echo '. ~/dotfiles/config/zsh_custom.sh' >> ~/.zshrc
fi
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

