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

alias masitp='. ~/.virtualenvs/masi-py3/bin/activate && python -m jupyter notebook'

alias mgcc='gcc -std=c99 -pedantic -Werror -Wall -Wextra -Wvla -g -fsanitize=address'
alias proj='cd ~/Documents/EPITA/S6/Prog/epita-ing-assistants-yaka-tiger-2026-rennes-6/'
alias bb='rm -rf build && mkdir build && autoreconf --install --verbose --force && cd build && ../configure'

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

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/opt/homebrew/opt/bison/bin:$PATH"
