#!/usr/bin/env bash

echo "Installing ZSH"

if [ ! -z ~/.zprezto ]; then
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${HOME}/.zprezto"
fi

zsh << EOF
setopt EXTENDED_GLOB
for rcfile in "${HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${HOME}/.${rcfile:t}"
done
EOF

ln -sf ~/dotfiles/config/zpreztorc .zpreztorc
