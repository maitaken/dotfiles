autoload -U compinit
compinit -u

# Vim Mode
set -o vi
bindkey '^j' vi-cmd-mode

# History
export SAVEHIST=100000
setopt share_history
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_verify

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --query="$LBUFFER" --prompt="History > ")
  CURSOR=${#BUFFER}
}
zle -N select-history
bindkey '^r' select-history

eval "$(/opt/homebrew/bin/brew shellenv)"

if type direnv &>/dev/null; then
  eval "$(direnv hook zsh)"
fi

if type starship > /dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

if type nodebrew > /dev/null 2>&1; then
  eval "$(starship init zsh)"
  export PATH=$PATH:$HOME/.nodebrew/current/bin
fi

alias gcd='cd $(ghq root)/$(ghq list | fzf)'

if type go > /dev/null 2>&1; then
  export GOPATH=$HOME/.local/gopkg
  export PATH=$PATH:$GOPATH/bin
fi

# tmux経由で起動した際に重複したPATHが定義されることを防ぐ
typeset -U path PATH
    
source <(kubectl completion zsh)
