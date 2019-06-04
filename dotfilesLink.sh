#!/bin/sh

ln -sf ~/dotfiles/init.vim $XDG_CONFIG_HOME/nvim/init.vim
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
chmod +x installer.sh
mkdir -p $HOME/.cache/dein
sh ./installer.sh $HOME/.cache/dein
rm installer.sh
