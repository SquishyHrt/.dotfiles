# export PATH=$HOME/bin:/usr/local/bin:$PATH

alias cat='bat'
alias bat='batcat'

alias mk='vim Makefile'
alias mcc='make clean'
alias mbb='make -Bj'
alias mcb='make clean && make -Bj'

alias bashe='vim ~/.zshrc'
alias vime='vim ~/.vimrc'
alias nvime='nvim ~/.config/nvim/'
alias ress='source ~/.bashrc'

alias vim='nvim'
alias nv='nvim .'

alias glog='git log --oneline --decorate --graph --all'
alias gsync='~/.dotfiles/gsync.sh'

function cd {
    builtin cd "$@" && ls -F --color=auto
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
