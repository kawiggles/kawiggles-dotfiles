autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

export PROMPT="F{red}%n@%m%f %~%# "
export EDITOR="/usr/bin/vim"

alias ..="cd .."
alias ls="ls --color=auto --group-directories-first"
alias ll="ls -lah --color=auto --group-directories-first"

cd ~
fastfetch
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey -v
bindkey '^[[Z' autosuggest-accept
