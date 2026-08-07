# Compinit for better tab complete
autoload -Uz compinit
compinit

# Histfile setup
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Environmental variables
export SSH_AUTH_SOCK=/temp/ssh-agent.sock
export EDITOR="/usr/bin/nvim"
export VISUAL="$EDITOR"
export GOPATH=$HOME/.go
[ -f "/home/kawiggles/.ghcup/env" ] && . "/home/kawiggles/.ghcup/env" # ghcup-env
if [ -d "/var/lib/flatpak/exports/share" ]; then
    export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$XDG_DATA_DIRS"
fi
if [ -d "$HOME/.local/share/flatpak/exports/share" ]; then
    export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$XDG_DATA_DIRS"
fi

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
alias ct="cargo test"
alias gr="go run"
alias gb="go build -o bin/\$(basename \"\$PWD\")"
alias gt="go test"

alias gitlines="git ls-files | xargs wc -l"
alias rustlines="git ls-files | xargs wc -l | grep '\.rs$' | awk '{sum += \$1} END {print sum}'"
alias golines="git ls-files | xargs wc -l | grep '\.go$' | awk '{sum += \$1} END {print sum}'"
alias vm="virt-viewer -c qemu+ssh://kawiggles@whydah-gally/system windows"

nvif() {
    local file
    file=$(fzf --query="$1") && [ -n "$file" ] && nvim "$file"
}

# Startup commands
cd ~
fastfetch
eval $(keychain --eval yamato-key)
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
eval "$(starship init zsh)"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh

# Keybinds
bindkey '^[[Z' autosuggest-accept
