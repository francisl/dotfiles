#!/usr/bin/env bash

DOTFILES_DIR=${PWD}
EMACS_CONFIG=$DOTFILES_DIR/config/emacs

if [[ ! -d ~/.emacs.d ]]; then
    mkdir ~/.emacs.d
fi

cd ~/.emacs.d
# wget -O init-frontmacs.el https://raw.githubusercontent.com/thefrontside/frontmacs/master/scripts/init-frontmacs.el

ln -sf $EMACS_CONFIG/initializers ~/.emacs.d/initializers
ln -sf $EMACS_CONFIG/init-frontmacs.el ~/.emacs.d/init-frontmacs.el
ln -sf $EMACS_CONFIG/init.el ~/.emacs.d/init.el

emacs --batch -Q --script $EMACS_CONFIG/install.el

cd $DOTFILES_DIR
