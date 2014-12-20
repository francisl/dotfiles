ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update

