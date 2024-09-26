echo "# z_custom profile ..."

export VISUAL=nvim
export EDITOR="$VISUAL"

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.history

ZSH_THEME="miloshadzic"

# ###############
# ALIASES
echo " > creating aliases"

# Utils
## Search
alias grepctxt='grep -n -A 1 -B 1 --color '

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


# #############
# RUST

#  export PATH="$HOME/.cargo/bin:$PATH"

. ~/.customrc

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
    echo "~~~~~~~ ><((('>   ~~~~"
    echo "><><{{*>  ~~~~ ><((("
    echo "~~~~ ><{{*> ~~~~"
    echo "  ~~~~~><><>  ~~~~"
fi


cat << EndOf
Available Commands:

${gitCmds}

${utilsCmds}

${nodeCmds}

EndOf
