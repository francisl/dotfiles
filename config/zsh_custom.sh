echo "# z_custom profile ..."

export VISUAL=nvim
export EDITOR="$VISUAL"
set -o vi

HISTSIZt=10000
SAVEHIST=10000
HISTFILE=~/.history

ZSH_THEME="miloshadzic"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ###############
# ALIASES
echo " > creating aliases"

# Utils
## Search
alias grepctxt='grep -n -A 1 -B 1 --color '
alias ls='ls --color'

# SMTP SERVER DEV
# alias smtpserv='python -m smtpd -n -c DebuggingServer localhost:1025'

read -r -d '' utilsCmds <<- EOM
Utils:
  grepctxt  |   grep text with colored output
  smtpserv  |   start a debuggun smtp server on port 1025
EOM

# ###############
# Git
alias gpush='git push'
alias glog='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias gcommit='git commit -m '
alias grebase='git rebase -i '
alias gdoh='git checkout -- '

read -r -d '' gitCmds <<- EOM
Git:
  gpush   |   git push
  glog    |   nice git log
  gcommit |   git commit with message
  grebase |   git rebase -i
  gdoh    |   git checkout 
EOM


# ###############
# Node
echo " > node configuration"
jstableflip () {
  echo '(╯°□°）╯︵ ┻━┻'
  rm -rf node_modules && npm cache clean && npm install
}

read -r -d '' nodeCmds <<- EOM
Node:
  jstableflip   |   Clean all 
EOM

source <(fzf --zsh)

if [ -f ~/.customrc ]; then
    . ~/.customrc
fi

rand=$(( RANDOM % 3 ))

if [ "$rand" -eq 0 ]; then
  cat << EndOf
        _T      .,,.    ~--~ ^^
  ^^   // \                    ~
        ][O]    ^^      ,-~ ~
    /''-I_I         _II____
  __/_  /   \ ______/ ''   /'\_,__
    | II--'''' \,--:--..,_/,.-{ },
  ; '/__\,.--';|   |[] .-.| O{ _ }
  :' |  | []  -|   ''--:.;[,.'\,/
  '  |[]|,.--'' '',   ''-,.    |
    ..    ..-''    ;       ''. '

EndOf

elif [ "$rand" -eq 1 ]; then
  cat << EndOf

~~~~~~~  ~~~~  ~~~~~~~ ~~~~ ~~~~~~~   ~~~~~~~~  ~~~~  ~~~~~~~ ~~~~  ~~~~~~~~
  ><(((('>   ~~~~ ><((('>   ~~~~  ><>    ><{{*>   ><(((('>   ~~~~   ><{{*>
~~~~   ~~~~  ~~~~~ ~~~~ ><{{{{*>  ~~~~~ ~~~~ ~~~~   ><(((('>   ~~~~~ ~~~~
  ><((('>   ~~~ ><((((*>   ><{{{'> ~~~~ ><{{*>  ~~~~  ><((('>   ><((('> ~~~
  //\\///\\//\\///\\///\\///\\//\\///\\///\\//\\///\\///\\///\\\\///\\///\\//
//\\||//\\||//\\||//\\|||//\\||//\\\\|///\\||//\\|||//\\||///\\||//\\\\||//

EndOf
else
    echo -e "\n~~~~~~~ ><((('>   ~~~~"
    echo "><><{{*>  ~~~~ ><((("
    echo "~~~~ ><{{*> ~~~~"
    echo -e "  ~~~~~><><>  ~~~~\n"
fi


cat << EndOf
Available Commands:

${gitCmds}

${utilsCmds}

${nodeCmds}

EndOf
