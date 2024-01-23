# export PATH=$HOME/bin:/usr/local/bin:$PATH

alias mk='vim Makefile'
alias mcc='make clean'
alias mbb='make -Bj'
alias mcb='make clean -s && make -sB'

alias bashe='vim ~/.zshrc'
alias vime='vim ~/.vimrc'
alias nvime='nvim ~/.config/nvim/'
alias alae='vim ~/.config/alacritty/alacritty.yml'
alias confe='vim ~/.config/i3/config'
alias ress='source ~/.zshrc'
alias cgd='gcc -Wall -Werror -Wextra -pedantic -Wvla -g -fsanitize=address'
alias mvalg='valgrind --show-leak-kinds=all --track-origins=yes --leak-check=full --track-fds=yes -s'

alias glog='git log --oneline --decorate --graph --all'
alias gsync='~/.dotfiles/gsync.sh'

alias acdcenv='source ~/Python_env/ACDC_env/bin/activate'
alias proj='cd /home/squishy/Documents/C_Prog/epita-ing-assistants-acu-42sh-2026-rennes-17'
alias bb='rm -rf build && mkdir build && autoreconf --install --verbose --force && cd build && ../configure'
alias batt='cat /sys/class/power_supply/macsmc-battery/uevent | grep -e 'POWER_SUPPLY_CAPACITY=' | sed 's/POWER_SUPPLY_CAPACITY=//''

function cd {
    builtin cd "$@" && ls --color=tty
}


ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 2

ENABLE_CORRECTION="true"
plugins=(
    git
    zsh-autosuggestions
    )

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export NVM_DIR="$HOME/.nvm"
export PATH="/usr/share/dotnet:$PATH"
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Created by `userpath` on 2024-01-18 19:30:09
export PATH="$PATH:/home/squishy/.local/bin"
