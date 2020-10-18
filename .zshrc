# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="simple"
ZSH_COLORIZE_STYLE="colorful"
ZSH_DISABLE_COMPFIX="true"

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    colorize
    colored-man-pages
    web-search
    brew
    history
    kubectl
)

source ~/.oh-my-zsh/oh-my-zsh.sh
source ~/dotfiles/.profile