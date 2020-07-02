# General
NEWLINE=$'\n'

export PS1='${NEWLINE}$(pwd)${NEWLINE}> '

alias ic="ibmcloud"
alias la="ls -lah"
alias python=/usr/local/bin/python3
alias pip=/usr/local/bin/pip3
alias weather="curl wttr.in"
alias profile="code ~/dotfiles"
alias hyper="code /mnt/c/Users/mn/AppData/Roaming/Hyper/.hyper.js"
alias ~="cd ~"


# Path variables
export GOROOT=/usr/local/go
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.istioctl/bin"
export PATH="$HOME/bin:$PATH"

# Golang
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
