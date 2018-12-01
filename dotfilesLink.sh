#!/bin/sh
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
chmod +x install.sh
sh ./install.sh clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
