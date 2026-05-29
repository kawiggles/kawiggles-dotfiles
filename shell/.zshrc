# Compinit for better tab complete
autoload -Uz compinit
compinit

# Histfile setup
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Environmental variables
export SSH_AUTH_SOCK=/temp/ssh-agent.sock
export PROMPT="%F{cyan}%n@%m%f %~%# "
export EDITOR="/usr/bin/nvim"
export VISUAL="$EDITOR"
export GOPATH=$HOME/.go
[ -f "/home/kawiggles/.ghcup/env" ] && . "/home/kawiggles/.ghcup/env" # ghcup-env

alias matrix="~/Programming/Small\\ Projects/Learning\\ Bash/matrix.sh"
alias cmatrix="~/Programming/Community\\ Projects/cmatrix/build/cmatrix"

# Aliases
alias ..="cd .."
alias ls="ls --color=auto --group-directories-first"
alias ll="ls -lah --color=auto --group-directories-first"
alias hypr="start-hyprland"

alias cbake="cmake --build ."
alias cr="cargo run"
alias cb="cargo build"
alias cc="cargo check"
alias gr="go run"
alias gb="go build"
alias gc="go test"

alias gitlines="git ls-files | xargs wc -l"
alias vm="virt-viewer -c qemu+ssh://kawiggles@whydah-gally/system windows"

# Startup commands
cd ~
fastfetch
eval $(keychain --eval yamato-key)
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Keybinds
bindkey -v
bindkey '^[[Z' autosuggest-accept
