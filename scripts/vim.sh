#!/usr/bin/env bash

DOTFILES_DIR=${PWD}
mkdir -p ~/.vim
mkdir -p ~/.vim/colors
cp -rf $DOTFILES_DIR/config/vim/colors/* ~/.vim/colors
ln -sf $DOTFILES_DIR/config/vim/vimrc ~/.vim/vimrc

updateBundle() {
    git fetch --all
    git reset --hard origin/master
}

cloneOrUpdate() {  # $1 = git $2 = dir
    if [[ ! -d $2 ]]; then
        echo "Cloning $2"
        git clone --depth=1 $1 $2
    else
        echo "Updating $2"
        updateBundle
    fi
}

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cloneOrUpdate https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic

cloneOrUpdate https://github.com/mxw/vim-jsx.git ~/.vim/bundle/vim-jsx

cloneOrUpdate git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs

cloneOrUpdate https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim

cloneOrUpdate https://github.com/plasticboy/vim-markdown.git ~/.vim/bundle/vim-markdown

cloneOrUpdate git@github.com:Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
python3 install.py --js-completer
cd $DOTFILES_DIR

cloneOrUpdate https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

cloneOrUpdate https://github.com/MarcWeber/vim-addon-mw-utils.git ~/.vim/bundle/vim-addon-mw-utils

cloneOrUpdate https://github.com/garbas/vim-snipmate.git ~/.vim/bundle/vim-snipmate
