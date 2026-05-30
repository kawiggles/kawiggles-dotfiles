#!/bin/bash
set -e

PACMAN_PACKAGES=(
    atuin
    btop
    clang
    cliphist
    cmake
    cronie
    discord
    fastfetch
    firefox
    fuse3
    fzf
    gdb
    go
    gopls
    hyprland
    hyprlauncher
    hyprpaper
    hyprpicker
    hyprshot
    hyprsunset
    i2c-tools
    imagemagick
    keychain
    kitty
    less
    libvirt
    lua-language-server
    mako
    man-db
    mpv
    neovim
    openrgb
    openssh
    papirus-icon-theme
    polkit-kde-agent
    prismlauncher
    pyright
    python-lsp-server
    qt5-wayland
    qt6-wayland
    reaper
    ripgrep
    rsync
    rust
    rust-analyzer
    screen
    steam
    stow
    syncthing
    tailscale
    thunderbird
    ttf-envycoder-nerd
    ttf-nerd-fonts-symbols
    ttf-nerd-fonts-symbols-mono
    unzip
    virt-viewer
    waybar
    wl-clipboard
    xdg-desktop-portal-hyprland
    yazi
    zoxide
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
    ufw
)

AUR_PACKAGES=(
    spotify
    tree-sitter-cli-git
    triliumnext-bin
    ttf-unifont
    xdg-desktop-portal-termfilechooser-hunkyburrito-git
)

sudo pacman -S --needed --noconfirm "${PACMAN_PACKAGES[@]}"
yay -S --needed --noconfirm --answerdiff N --answerclean N "${AUR_PACKAGES[@]}"

stow -t ~ hyprland
stow -t ~ neovim
stow -t ~ waybar
stow -t ~ shell
