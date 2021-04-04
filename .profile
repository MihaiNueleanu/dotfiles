# General
NEWLINE=$'\n'

export PS1='${NEWLINE}$(pwd)${NEWLINE}> '

alias ic="ibmcloud"
alias la="ls -lah"
alias python=python3
alias pip=pip3
alias weather="curl wttr.in"
alias profile="code ~/dotfiles"
alias hyper="code /mnt/c/Users/mn/AppData/Roaming/Hyper/.hyper.js"
alias ~="cd ~"

case `uname` in
  Darwin)
    # commands for OS X go here
    alias draw.io='/Applications/draw.io.app/Contents/MacOS/draw.io'
  ;;
  Linux)
    # commands for Linux go here
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac

# Path variables
export GOROOT=/usr/local/go
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.istioctl/bin"
export PATH="$HOME/bin:$PATH"

# Golang
export PATH=$PATH:/usr/local/go/bin

# Heroku
export HEROKU_ORGANIZATION=kiosk

export PATH="$HOME/bin:$PATH"
export PATH="$PATH:/Users/mihainueleanu/Library/Python/3.8/bin"
