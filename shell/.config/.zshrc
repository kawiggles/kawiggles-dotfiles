# Compinit for tab complete
autoload -Uz compinit
compinit

# Histfile for using arrows to get old commands
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Env Variables: sets up ssh agent, nvim as editor, gopath, etc
export SSH_AUTH_SOCK=/temp/ssh-agent.sock
export EDITOR="/usr/bin/nvim"
export VISUAL="$EDITOR"
export GOPATH="$HOME/.go"
export PROMPT="%F{cyan}%n@%m%f %~%# "
[ -f "/home/kawiggles/.ghcup/env" ] && . "/home/kawiggles/.ghcup/env" # ghcup-env

# Aliases to make life easier
alias ..="cd .."
alias ls="ls --color=auto --group-directories-first"
alias ll="ls -lah --color=auto --group-directories-first "
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
eval $(keychain --eval uss-monitor-key)
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Keybinds
bindkey '^[[Z' autosuggest-accept
bindkey -v
