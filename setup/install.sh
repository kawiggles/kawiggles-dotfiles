#!/bin/bash
set -e

TRUE_USER=${SUDO_USER:-${USER}}

PACKAGES=(
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
    zoxide
    atuin
    vim
    stow
    fzf
    openssh-server
    ufw
    nginx
    fail2ban
    mdadm
    smartmontools
    btop
    fastfetch
    tailscale
    rsync
    curl
    not
    less
    unzip
    chrony
    screen
    docker-ce
    docker-ce-cli
    containerd.io
    docker-buildx-plugin
    docker-compose-plugin
)

export DEBIAN_FRONTEND=noninteractive

echo "Installing packages.."
apt-get install -y "${PACKAGES[@]}"
echo "Updating full system and packages.."
apt-get update -y 
apt-get dist-upgrade -y
echo "Removing unnecesary packages..."
apt purge tiny-vim
apt purge nano
apt purge telnet
apt purge nfs-common
apt purge at
apt purge info
apt purge exim4*

apt autoremove -y
apt autoclean

stow -t ~ docker
stow -t / fail2ban
stow -t / mdamdm
stow -t / nginx
stow -t / ssh
stow -t ~ zsh

chsh -s $(which zsh) $TRUE_USER
