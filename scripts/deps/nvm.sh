#!/usr/bin/env bash

echo "Installing NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

if [ -z "$NVM_DIR" ]
then
  echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshenv
  echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.zshenv
  echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> ~/.zshenv
fi

source ~/.zshenv

nvm install node
