if [ -d $HOME/.local/go ]; then
  export PATH=$PATH:$HOME/.local/go/bin
  export GOPATH=$HOME/.local/gopkg
  export PATH=$PATH:$GOPATH/bin
fi
