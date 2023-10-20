# export PATH=$HOME/bin:/usr/local/bin:$PATH

alias intell='env /usr/bin/arch -x86_64 /bin/zsh'
alias archh='env /usr/bin/arch -arm64 /bin/zsh'

alias mk='vim Makefile'
alias mcc='make clean'
alias mbb='make -Bj'
alias mcb='make clean && make -Bj'

alias bashe='vim ~/.zshrc'
alias vime='vim ~/.vimrc'
alias nvime='nvim ~/.config/nvim/'
alias alae='nvim ~/.dotfiles/alacritty.yml'
alias confe='nvim ~/.config/i3/config'
alias ress='source ~/.zshrc'

alias vim='nvim'
alias nv='nvim .'

alias glog='git log --oneline --decorate --graph --all'
alias gsync='~/.dotfiles/gsync.sh'

function cd {
    builtin cd "$@" && ls -G
}

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"


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

# opam configuration
[[ ! -r /Users/paolowattebled/.opam/opam-init/init.zsh ]] || source /Users/paolowattebled/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

