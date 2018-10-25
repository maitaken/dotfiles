# Created by newuser for 5.6.2
export ZPLUG_HOME=/usr/local/opt/zplug
setopt IGNOREEOF

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export LC_ALL=ja_JP.UTF-8
export LANG=ja_JA.UTF-8

autoload -Uz colors
colors
autoload -Uz compinit
compinit
autoload colors
colors

setopt share_history
setopt histignorealldups

alias cot=' open $1 -a /Applications/CotEditor.app '

# bindkey -v
TERM=xterm-256color


PROMPT="%{$fg[green]%}[%n]%(!.#.$) %{$reset_color%}"
PROMPT2="%{$fg[green]%}%_> %{$reset_color%}"
SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"
RPROMPT="%{$fg[cyan]%}[%~]%{$reset_color%}"

