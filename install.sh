dot_list=".zshrc .vimrc"
pkg_list="bat nodejs npm sl tree zsh vim valgrind neofetch python3 git curl libtool-bin gettext cmake unzip"


update_shell() {
    sudo apt update
    sudp apt upgrade
    sudo apt install $pkg_list -y
    sudo apt upgrade
}

link_files() {
    for f in $dot_list; do
        rm -rf ~/$f
        ln -sF ~/.dotfiles/$f ~/$f
    done
}

install_zsh() {
    OH_MY_DIR=~/.oh-my-zsh
    if [ -d "$OH_MY_DIR" ];
    then
        rm -rf ~/.oh-my-zsh/
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    else
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

update_nodejs() {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    source ~/.bashrc
    nvm install v18.13.0
}

link_alacritty() {
    rm -rf ~/.config/alacritty/
    mkdir ~/.config/alacritty
    ln -sF ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
}

all() {
    echo "-----UPDATING SHELL------"
    update_shell

    echo "----INSTALING ZSH-----"
    install_zsh

    echo "----LINKING zshrc vimrc ------"
    link_files
}



"$@"




