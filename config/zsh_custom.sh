echo "# z_custom profile ..."

export VISUAL=nvim
export EDITOR="$VISUAL"

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.history

# export CLICOLOR=1
# export LC_ALL=en_CA.UTF-8
# export PATH=${PATH}:/usr/local/sbin
# export PATH=/usr/local/bin:${PATH}

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

cat << EndOf
Available Commands:

${gitCmds}

${utilsCmds}

${nodeCmds}

EndOf
