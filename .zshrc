autoload -Uz compinit
compinit

source ~/.zsh/plugins/antigen/antigen.zsh
source ~/.zsh/plugins/zsh-completions/zellij_completion.plugin.zsh
export XDG_CONFIG_HOME=$HOME/.config
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export GOPATH=$HOME/go
export GIT_EDITOR=nvim
export BROWSER=brave

ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_AUTOCONNECT=false
#bindkey -s ^f "tmux-sessionizer\n"
#alias vi="lvim"
#alias vim="lvim"
#alias nvim="lvim"

alias ls="exa"
alias ll="exa -l -snewest"
alias llr="exa -l -snewest -R"
alias lla="ll -a"

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

source ~/.antigenrc

if [[ -z $DISPLAY ]] then
    export PINENTRY_USER_DATA=type:curses
else
    export PINENTRY_USER_DATA=type:rofi
fi
eval "$(starship init zsh)"
eval "$(mcfly --history_format zsh-extended init zsh)"

eval "$(zoxide init zsh)"

eval "$(op completion zsh)"; compdef _op op
eval "$(direnv hook zsh)"

#eval "$(zellij setup --generate-auto-start zsh)"
#eval "$(sheldon source)"
export OPENAI_API_KEY={{openapi_api_key}}

export BASE16_TMUX_OPTION_STATUSBAR=1
export BASE16_TMUX_OPTION_ACTIVE=1
setopt INTERACTIVE_COMMENTS
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[comment]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#cba6f7'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#b4befe'
ZSH_HIGHLIGHT_STYLES[command]='fg=#a6e3a1'


isup() {
	local uri=$1

	if curl -s --head  --request GET "$uri" | grep "200 OK" > /dev/null ; then
		notify-send --urgency=critical "$uri is down"
	else
		notify-send --urgency=low "$uri is up"
	fi
}
