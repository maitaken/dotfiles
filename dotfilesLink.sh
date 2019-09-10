#!/bin/sh

echo "Create $HOME/.config/nvim"
mkdir -p $HOME/.config/nvim/
mkdir -p $HOME/.local/share/fonts/

mkdir -p $HOME/.config/fontconfig/conf.d/

nerd_fonts() {
  git clone --branch=master --depth 1 https://github.com/ryanoasis/nerd-fonts.git
  cd nerd-fonts
  ./install.sh
  cd ..
  rm -rf nerd-fonts
} 


if [ "$(uname)" == "Darwin" ]; then
	brew install rbenv ruby-build
	brew install reattach-to-user-namespace

  brew tap sambadevi/powerlevel9k
  brew install zplug
  brew install powerlevel9k
  brew install fontconfig

  if [ ! -f ~/Library/Fonts/Hack\ Bold\ Nerd\ Font\ Complete.ttf ]; then
    echo "Download Font"
    nerd_fonts
  fi

  if [ ! -d ~/miniconda3 ]; then
    curl -o install.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
    sh install.sh
  fi
else
	sudo apt install rbenv ruby-build
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

# ruby setting
rbenv install 2.3,1
rbenv global 2.3.1

# colorlsの導入
gem install bundle
gem install colorls
rbenv rehash
rehash

ln -sf ~/dotfiles/init.vim $HOME/.config/nvim/init.vim
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
chmod +x installer.sh
mkdir -p $HOME/.cache/dein
sh ./installer.sh $HOME/.cache/dein
rm installer.sh
