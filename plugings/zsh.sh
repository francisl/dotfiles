## ZSH
echo "Installing ZSH"
if [[ "$platform" == 'Linux' ]]; then
    apt-get -y install zsh
elif [[ "$platform" == 'Darwin' ]]; then
    brew install zsh
fi

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${HOME}/.zprezto"

zsh
setopt EXTENDED_GLOB
for rcfile in "${HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${HOME}/.${rcfile:t}"
done

ln -sf ~/dotfiles/zpreztorc .zpreztorc
