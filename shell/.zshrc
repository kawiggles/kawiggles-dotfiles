autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

export SSH_AUTH_SOCK=/temp/ssh-agent.sock
export EDITOR="/usr/bin/vim"

alias ..="cd .."
alias ls="ls --color=auto --group-directories-first"
alias ll="ls -lah --color=auto --group-directories-first"

nvif() {
	local file
	file=$(fzf --query="$1") && [ -n "$file" ] && nvim "$file"
}

cd ~
fastfetch
eval "$(keychain --eval great-eastern-key)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
eval "$(starship init zsh)"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey '^[[Z' autosuggest-accept
