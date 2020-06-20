# General
NEWLINE=$'\n'

export PS1='${NEWLINE}$(pwd)${NEWLINE}> '

alias ic="ibmcloud"
alias la="ls -lah"
alias python=/usr/local/bin/python3
alias pip=/usr/local/bin/pip3
alias weather="curl wttr.in"
alias profile="code ~/.profile"
alias zshrc="code ~/.zshrc"


# Path variables
export GOROOT=/usr/local/go
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.istioctl/bin"
export PATH="$HOME/bin:$PATH"

# DirEnv
eval "$(direnv hook bash)"
