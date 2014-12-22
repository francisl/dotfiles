ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
curl -LSso ~/dotfiles/vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update

# install python depencies
pip install rope
pip install ropemode
pip install ropevim
pip install pep8
