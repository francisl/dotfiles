#!/usr/bin/env zsh

echo -n "Do you want to configure tmux? (y/n): " 
read configure_tmux

if [[ "$configure_tmux" == "y" || "$configure_tmux" == "Y" ]]; then
  echo "Configuring tmux"
  ln -sfn $HOME/dotfiles/config/tmux.conf $HOME/.tmux.conf
  if [ -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "Updating tpm..."
    cd "$HOME/.tmux/plugins/tpm" && git pull
  else
    echo "Installing tpm..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
  tmux source ~/.tmux.conf

  echo "Installing tmux dependencies"
  if [ -d "$HOME/.tmuxifier" ]; then
    echo "Updating tmuxifier..."
    cd "$HOME/.tmuxifier" && git pull
  else
    echo "Installing tmuxifier..."
    git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
  fi
  
  # Check if lines exist in .zshrc before adding them
  if ! grep -q 'export PATH="$HOME/.tmuxifier/bin:$PATH"' ${HOME}/.zshrc; then
    echo 'export PATH="$HOME/.tmuxifier/bin:$PATH"' >> ${HOME}/.zshrc
  fi
  if ! grep -q 'export TMUXIFIER_LAYOUT_PATH="$HOME/dotfiles/config/tmuxifier/layouts"' ${HOME}/.zshrc; then
    echo 'export TMUXIFIER_LAYOUT_PATH="$HOME/dotfiles/config/tmuxifier/layouts"' >> ${HOME}/.zshrc
  fi
  if ! grep -q 'eval "$(tmuxifier init -)"' ${HOME}/.zshrc; then
    echo 'eval "$(tmuxifier init -)"' >> ${HOME}/.zshrc
  fi
else
  echo "Not configured: tmux"
fi
