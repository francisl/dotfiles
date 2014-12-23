
platform=`uname`

# create necessary directory
mkdir ~/opt
cd ~/opt

if [[ "$platform" == 'Linux' ]]; then
    . install_linux.sh
elif [[ "$platform" == 'Darwin' ]]; then
    . install_mac.sh
fi

git clone git://github.com/bpinto/oh-my-fish.git ~/.oh-my-fish
curl https://raw.githubusercontent.com/francisl/dotfiles/master/config.fish > ~/.config/fish/config.fish

## ZSH
cd ~
ln -sf ~/dotfiles/zpreztorc .zpreztorc

