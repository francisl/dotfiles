
platform=`uname`

# create necessary directory
mkdir ~/opt
cd ~/opt

## CONFIGURE LOCAL FILES
if [[ -e ~/.profile -a ! -e ~/.local_profile ]];then
    mv ~/.profile ~/.local_profile
fi


if [[ "$platform" == 'Linux' ]]; then
    . install_linux.sh
elif [[ "$platform" == 'Darwin' ]]; then
    . install_mac.sh
fi

## set environment for bash/ZSH
if [[ "$platform" == 'Linux' ]]; then
    ln -sf ~/dotfiles/profile ~/.bash_profile
elif [[ "$platform" == 'Darwin' ]]; then
    ln -sf ~/dotfiles/profile ~/.profile
fi
## Setup OH-MY-FISH
git clone git://github.com/bpinto/oh-my-fish.git ~/.oh-my-fish
curl https://raw.githubusercontent.com/francisl/dotfiles/master/config.fish > ~/.config/fish/config.fish

## ZSH
cd ~
ln -sf ~/dotfiles/zpreztorc .zpreztorc


## VIM
. install_vim.sh 

