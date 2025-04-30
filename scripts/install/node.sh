#!/usr/bin/env zsh


echo -n "Do you want to install node fnm? (y/n): " 
read install_fnm

# Check the user's response
if [[ "$install_fnm" == "y" || "$install_fnm" == "Y" ]]; then
  echo "Installing FNM"
  curl -fsSL https://fnm.vercel.app/install | bash
  fnm completions --shell zsh
  curl -fsSL https://bun.sh/install | bash

  # Check if FNM eval line already exists in .zshrc
  if ! grep -q 'eval "$(fnm env --use-on-cd --shell zsh)"' ~/.zshrc; then
    echo 'eval "$(fnm env --use-on-cd --shell zsh)"' >> ~/.zshrc
  fi

  source ~/.zshrc

  fnm install 22
  npm install -g typescript-language-server typescript

else
    echo "Not Install: fnm"
fi
