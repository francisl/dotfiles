#!/usr/bin/env bash

echo "Installing ZSH"

if [ ! -z ~/.zprezto ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${HOME}/.zprezto"
fi

zsh ~/dotfiles/plugins/zsh_config.zsh

ln -sf ~/dotfiles/config/zpreztorc .zpreztorc

chsh -s $(which zsh)

cat > file.tmp <<'endconfig'
. /Users/lavoifr1/dotfiles/config/customrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
endconfig
