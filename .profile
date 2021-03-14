# General
NEWLINE=$'\n'

export PS1='${NEWLINE}$(pwd)${NEWLINE}> '

# Autocomplete
autoload -U compinit
compinit 


# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'


# Network discovery
network() {
    # ifconfig
    sudo arp-scan -I  en0 -l
}
bindkey -s '^n' 'network\n'


# Natural key bindings
bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word

# Aliases
alias python=/usr/bin/python3
alias pip=/usr/bin/pip3
alias weather="curl wttr.in"
alias profile="code ~/dotfiles"
alias ~="cd ~"
alias pasc="passCopy"
alias nr="npm run"
alias filebox="ssh -L 8384:localhost:8384 root@filebox.nueleanu.com"

passCopy() {
  if type clip.exe > /dev/null; then
    pass $1 | clip.exe
  fi
}

# Platform specific
case `uname` in
  Darwin)
    # commands for OS X go here
    alias draw.io='/Applications/draw.io.app/Contents/MacOS/draw.io'
    eval "$(direnv hook zsh)"
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
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.poetry/bin