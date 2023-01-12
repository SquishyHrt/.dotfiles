# export PATH=$HOME/bin:/usr/local/bin:$PATH

alias bat='batcat'
alias dlwind='cd /mnt/c/Users/paolo/Downloads'

alias mk='vim Makefile'
alias mcc='make clean'
alias mbb='make -Bj'
alias mcb='make clean && make -Bj'

alias bashe='vim ~/.zshrc'
alias vime='vim ~/.vimrc'
alias nvime='nvim ~/.config/nvim/'
alias alae='nvim ~/.dotfiles/alacritty.yml'
alias confe='nvim ~/.config/i3/config'
alias ress='source ~/.bashrc'

alias vim='nvim'
alias nv='nvim .'

alias glog='git log --oneline --decorate --graph --all'
alias gsync='~/.dotfiles/gsync.sh'

alias pacman='sudo pacman'

function cd {
    builtin cd "$@" && ls --color=auto
}

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

CASE_SENSITIVE="true"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 2

ENABLE_CORRECTION="true"
plugins=(
    git
    zsh-autosuggestions
    )

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
