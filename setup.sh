#!/bin/sh

base_dir=`dirname $0`

exist() {
  type $1 > /dev/null 2>&1 
  return $?
}

# install rc
cur_shell=$(basename $SHELL)
echo current shell is $cur_shell
if [ "$cur_shell" = "zsh" ]; then
  echo install .zshrc
  ln ${base_dir}/.zshrc $HOME/.zshrc
  source $HOME/.zshrc
elif [ "$cur_shell" = "bash" ]; then
  echo install .bashrc
  ln ${base_dir}/.bashrc $HOME/.bashrc
  source $HOME/.bashrc
fi



if [ ! -f $HOME/.vimrc ]; then
  echo "install vimrc"
  ln `pwd`/.vimrc $HOME/.vimrc
fi

if [ ! -d ${HOME}/.local ]; then
  echo "create ${HOME}/.local"
  mkdir -p ${HOME}/.local
fi

# install go
if ! exist go; then
  curl https://gist.githubusercontent.com/maitaken/47fe12e2e80cd11769b508f228d494c9/raw/3455ee47436852ca336ecbf48ad80decacab70e0/go_install.sh | bash
fi

# install ghq, fzf
if ! exist ghq; then
  echo install ghq
  go install github.com/x-motemen/ghq@latest
fi

if ! exist fzf; then
  echo fzf
  go install github.com/junegunn/fzf@latest
fi
