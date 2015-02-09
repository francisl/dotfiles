# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme robbyrussell

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump git
set -x fish_plugins autojump git python django

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish cofiguration.
. $fish_path/oh-my-fish.fish


set -x PATH /usr/local/bin $PATH
set PATH $PATH $HOME/devapp
set PATH $PATH $HOME/opt/mongodb/bin
set -x NODE_PATH $HOME/opt/lib/node_mobules
set -x PATH $HOME/opt/bin $PATH
set -x PATH $PATH $HOME/opt/dart/dart-sdk/bin
set -x PATH $PATH $HOME/opt/scala-2.10.3/bin
set -x PATH $PATH $HOME/opt/fantom-1.0.65/bin
set -x PATH $PATH $HOME/opt/robovm-0.0.9/bin
set -x PATH $PATH $HOME/opt/kotlinc/bin
set -x PATH $PATH $HOME/opt/gradle/bin
set -x PATH $PATH $HOME/opt/groovy/bin
set -x PATH $PATH $HOME/opt/ldc/bin
set -x PATH $PATH $HOME/opt/nimrod/bin

function pyma
	python manage.py
end

function pyrunserv
	python manage.py runserver
end

function djserv
	pyrunserv
end

function djshell
	pyma shell
end

# Git
function glog
	git log --graph --decorate --pretty=oneline --abbrev-commit
end

# VIRTUALENV
function env-onf
	. ~/pyenv/onf/bin/activate.fish
end

function env-ficby
  . ~/pyenv/ficby/bin/activate.fish
end

set -x PATH $PATH /usr/local/mysql/bin
