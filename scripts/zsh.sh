#!/usr/bin/env bash

echo "Installing ZSH"

chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

