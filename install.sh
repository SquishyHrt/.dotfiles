dot_list=".zshrc .vimrc .oh-my-zsh .vim"

pkg_list="bat nodejs npm sl tree zsh vim valgrind btop neofetch onefetch python3 git curl"

sudo pacman -Syu
sudo pacman -S $pkg_list -y

#for p in $pkg_list; do
#    sudo pacman -S $p
#done

for f in $dot_list; do
  rm -rf ~/$f
  ln -sF ~/.dotfiles/$f ~/$f
done
