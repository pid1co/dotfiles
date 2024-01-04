# Created by newuser for 5.9
#
#
autoload -Uz compinit
compinit

export XDG_CONFIG_HOME=$HOME/.config
VIM="lvim"

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export GOPATH=$HOME/go
export GIT_EDITOR=$VIM
#bindkey -s ^f "tmux-sessionizer\n"
#alias vi="lvim"
#alias vim="lvim"
#alias nvim="lvim"

cat() {
    bat $1 --theme gruvbox-dark --style plain --no-pager
}

function addToPath {
	if [ -d $1 ]; then
		export PATH=$1:$PATH
	fi
}

addToPath "/home/ian/.cargo/bin"
addToPath "/home/ian/.local/bin"
addToPath "/home/ian/bin"

if [[ -z $DISPLAY ]] then
    export PINENTRY_USER_DATA=type:curses
else
    export PINENTRY_USER_DATA=type:rofi
fi
eval "$(starship init zsh)"
eval "$(mcfly --history_format zsh-extended init zsh)"

eval "$(zoxide init zsh)"

eval "$(op completion zsh)"; compdef _op op


export OPENAPI_API_KEY={{openapi_api_key}}

