if type go > /dev/null 2>&1; then
  export GOPATH=$HOME/.local/gopkg
  export PATH=$PATH:$GOPATH/bin
fi

if type starship > /dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
