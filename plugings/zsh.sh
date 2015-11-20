## ZSH
echo "Installing ZSH"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${HOME}/.zprezto"

zsh
setopt EXTENDED_GLOB
for rcfile in "${HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${HOME}/.${rcfile:t}"
done

ln -sf ~/dotfiles/zpreztorc .zpreztorc
