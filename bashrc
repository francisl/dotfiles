# color in terminal
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export LC_ALL=en_CA.UTF-8

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$HOME/opt/bin:$PATH
#export PATH=$PATH:$HOME/opt/dart-sdk/bin
export PATH=$PATH:$HOME/opt/mongodb/bin
export DEVAPPS=$HOME/devapps

# JAVA FAMILY
export SCALA_HOME=$HOME/opt/scala
export PATH=$PATH:$HOME/opt/scala/bin
export PATH=$PATH:$HOME/opt/kotlinc/bin
export M2_HOME=$HOME/opt/apache-maven-3.2.1
export M2=$M2_HOME/bin
export PATH=$PATH:$M2

# ANDROID
export ANDROID_SDK_HOME=$HOME/opt/android-sdk-macosx
export ANDROID_HOME=$ANDROID_SDK_HOME

# PYTHON PATH
export PYTHONPATH=$PYTHONPATH:~/Programmation/python/apps

# ALIASES

alias pyma="python manage.py"
alias pyrunserv="python manage.py runserver"

alias djserv=pyrunserv
alias djshell="pyma shell"

# SMTP SERVER DEV
alias smtpserv='python -m smtpd -n -c DebuggingServer localhost:1025'

# Git
alias glog='git log --graph --decorate --pretty=oneline --abbrev-commit'

# VIRTUALENV
alias envkivy='. ~/pyenv/kivy/bin/activate'

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.history

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

