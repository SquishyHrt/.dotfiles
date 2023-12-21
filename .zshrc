# export PATH=$HOME/bin:/usr/local/bin:$PATH

alias intell='env /usr/bin/arch -x86_64 /bin/zsh'
alias archh='env /usr/bin/arch -arm64 /bin/zsh'

alias mk='vim Makefile'
alias mcc='make clean'
alias mbb='make -Bj'
alias mcb='make clean -s && make -sB'

alias bashe='vim ~/.zshrc'
alias vime='vim ~/.vimrc'
alias nvime='nvim ~/.config/nvim/'
alias alae='nvim ~/.config/alacritty/alacritty.yml'
alias confe='nvim ~/.config/i3/config'
alias ress='source ~/.zshrc'
alias cgd='gcc -Wall -Werror -Wextra -pedantic -Wvla -g -fsanitize=address'

alias glog='git log --oneline --decorate --graph --all'
alias gsync='~/.dotfiles/gsync.sh'

alias acdcenv='source ~/Python_env/mounette_env/bin/activate'
alias proj='cd /home/squishy/Documents/C_Prog/epita-ing-assistants-acu-21sh-2026-paolo.wattebled'

function cd {
    builtin cd "$@" && ls --color=tty
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
export PATH="/usr/share/dotnet:$PATH"
