if [ -d $HOME/.local/go ]; then
  export PATH=$PATH:$HOME/.local/go/bin
  export GOPATH=$HOME/.local/gopkg
  export PATH=$PATH:$GOPATH/bin
fi

if type starship > /dev/null 2>&1; then
  eval "$(starship init bash)"
else
  export PS1="[\d \t] \W \n\$ "
fi
