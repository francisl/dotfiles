#!/usr/bin/env zsh


echo -n "Do you want to install node fnm? (y/n): " 
read install_fnm

# Check the user's response
if [[ "$install_fnm" == "y" || "$install_fnm" == "Y" ]]; then
  echo "Installing FNM"
  curl -fsSL https://fnm.vercel.app/install | bash
  fnm completions --shell zsh
  echo 'eval "$(fnm env --use-on-cd --shell zsh)"' >> ~/.zshenv

  source ~/.zshenv

  fnm install node
  npm install -g typescript-language-server typescript

else
    echo "Not Install: fnm"
fi
