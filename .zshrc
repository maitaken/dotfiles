# Created by newuser for 5.6.2
export ZPLUG_HOME=/usr/local/opt/zplug
setopt IGNOREEOF

export LANG=ja_JA.UTF-8

autoload -Uz colors
colors

autoload -Uz compinit
compinit

setopt share_history

setopt histignorealldups

alias cot=' open $1 -a /Applications/CotEditor.app '


# bindkey -v
TERM=xterm-256color
autoload colors
colors


PROMPT="%{$fg[green]%}[%n]%(!.#.$) %{$reset_color%}"
PROMPT2="%{$fg[green]%}%_> %{$reset_color%}"
SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"
RPROMPT="%{$fg[cyan]%}[%~]%{$reset_color%}"

