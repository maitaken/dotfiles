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

# colorlsの導入
gem install bundle
gem install colorls
rbenv rehash
rehash

if [ "$(uname)" == "Darwin" ]; then

  brew tap sambadevi/powerlevel9k
  brew install zplug
  brew install powerlevel9k
  brew install fontconfig

  nerd_fonts
fi


# Download Font
echo "Download Font"
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf ~/.local/share/fonts/

fc-cache -vf ~/.local/share/fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

ln -sf ~/dotfiles/init.vim $HOME/.config/nvim/init.vim
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
chmod +x installer.sh
mkdir -p $HOME/.cache/dein
sh ./installer.sh $HOME/.cache/dein
rm installer.sh
