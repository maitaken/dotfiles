export TERM=xterm-256color
autoload -Uz colors
autoload -Uz compinit
colors
compinit

case ${OSTYPE} in
	darwin*)
		export ZPLUG_HOME=/usr/local/opt/zplug
		if [ -d "${HOME}/miniconda3/" ]; then
			. "/Users/maitake/miniconda3/etc/profile.d/conda.sh"
		fi

		alias cot='open $1 -a /Applications/CotEditor.app '   	
		;;
	linux*)
			export ZPLUG_HOME=$HOME/.zplug
		;;
esac

source $ZPLUG_HOME/init.zsh

# ruby
eval "$(rbenv init - zsh)"

# define environment variable
export GOPATH=$HOME/dev
export GOBIN=$GOPATH/bin
export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH

export PATH="$HOME/.cargo/bin:$PATH"

export LC_ALL=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

# define alias
alias g='git'
alias gs='git status'
alias ga='git add'
alias gl='glt log'
alias gp='git push'
alias gc='git commit'

if type "nvim" > /dev/null 2>&1; then
	alias v="nvim"
	alias vi="nvim"
fi

# alias

# powerlevel9kの設定
# zplug "bhilburn/powerlevel9k", use:"powerlevel9k.zsh-theme"
# source ${HOME}/dotfiles/powerlevel9k.zsh
zplug "zsh-users/zsh-completions"
# Starship
eval "$(starship init zsh)"

if test -e ~/dotfiles/.zshlocalrc; then
	source ~/dotfiles/.zshlocalrc
fi

if ! zplug check --verbose; then
  zplug install
fi

zplug load
