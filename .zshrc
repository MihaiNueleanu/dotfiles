# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# To enable sourcing from this directory, place this inside ~/.zshrc
# if [ -r ~/dotfiles/.zshrc ]; then
#     source ~/dotfiles/.zshrc
# fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="simple"
ZSH_COLORIZE_STYLE="colorful"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    colorize
    colored-man-pages
    web-search
    brew
    history
    # kubectl
    direnv
)

source ~/.oh-my-zsh/oh-my-zsh.sh
source ~/dotfiles/.profile

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