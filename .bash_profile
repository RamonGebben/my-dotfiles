#!/bin/bash

source ~/.git-completion.bash
source ~/.git-prompt.sh

GREY="\[\033[1;30m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[34m\]"
LIGHT_BLUE="\[\033[1;34m\]"
MAGENTA="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
LIGHT_GRAY="\[\033[0;37m\]"

GIT_PS1_SHOWDIRTYSTATE=true
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export ANDROID_HOME=/usr/local/opt/android-sdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home
export EDITOR=/usr/local/bin/emacs

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*; }

export PS1=$MAGENTA"\u$GREEN@$CYAN\h $GREY--($(date +%d-%b-%y) )--"'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    # a file has been modified but not added
    then echo "'$YELLOW'"$(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
    # a file has been added, but not commited
    then echo "'$MAGENTA'"$(__git_ps1 " (%s)")
    # the state is clean, changes are commited
    else echo "'$CYAN'"$(__git_ps1 " (%s)")
    fi)'$GREY" \w "$YELLOW"» "$GREEN

alias ll='ls -lash'

# Git
alias :gg='git status -s'
alias :add='git add .'
alias :commit='git commit -m'
alias :conflict='git commit'
alias :push='git push origin $(git rev-parse --abbrev-ref HEAD 2> /dev/null)'
alias :pull='git pull origin $(git rev-parse --abbrev-ref HEAD 2> /dev/null)'
alias :log="git log --graph --oneline --decorate --date=relative --all"
alias :master="git pull origin master"
alias :dev="git pull origin develop"

alias whatsmyip="ifconfig | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'"

export NVM_DIR="/Users/ramon/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
