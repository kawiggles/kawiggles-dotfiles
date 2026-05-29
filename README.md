# YAMATO dotfiles
YAMATO is my desktop computer running arch linux. I went kinda crazy with the customization, and now need a way of ensuring that I can do a proper system restore in case I screw things up in the future, which I probably will. This README is a guide to all the packages I use, their configurations, and the organization of the dotfile repository.

## Tree and Oranization
```
.dotfiles
├── .config -> themes/space/.config
├── hyprland
│   └── .config
│       └── hypr
│           ├── environment.lua
│           ├── hyprland.lua
│           ├── hyprpaper.conf
│           ├── input.lua
│           ├── keybinds.lua
│           ├── monitors.lua
│           ├── visuals.lua
│           └── windows.lua
├── neovim
│   └── .config
│       └── nvim
│           ├── init.lua
│           └── lua
│               ├── keymaps.lua
│               ├── lsp.lua
│               └── plugins.lua
├── README.md
├── scripts
│   ├── change-theme.sh
│   ├── waybar_scripts
│   │   ├── cpu.sh
│   │   ├── gpu.sh
│   │   ├── spotify_script.sh
│   │   └── waybar_auto_hide
│   └── yazi-wrapper.sh
├── setup
│   ├── install-packages.sh
│   └── pacman.conf
├── shell
│   ├── .config
│   │   ├── fastfetch
│   │   │   └── config.jsonc
│   │   └── kitty
│   │       └── kitty.conf
│   └── .zshrc
├── themes
│   ├── bierstadt
│   │   ├── current-theme.conf
│   │   ├── style.css
│   │   └── theme.lua
│   ├── space
│   │   ├── current-theme.conf
│   │   ├── style.css
│   │   └── theme.lua
│   └── wallpapers
│       ├── Albert_Bierstadt_-_A_Storm_in_the_Rocky_Mountains_Mt._Rosalie.jpg
│       ├── Albert_Bierstadt_-_Yellowstone_Falls.jpg
│       ├── Apollo_Soyuz_Handshake.jpg
│       └── The_Space_Mural.jpg
├── waybar
│   └── .config
│       └── waybar
│           └── config.jsonc
└── xdg-desktop
    └── .config
        ├── xdg-desktop-portal
        │   └── portals.conf
        └── xdg-desktop-portal-termfilechooser
            └── config
```

There are four main configured applications:
1. Hyprland
2. Neovim
3. Kitty/zsh (shell)
4. Waybar
Functional configurations for an application are included in the stow packages with the associated application's name. They are to be deployed with `stow`, though the install script performs this function as well. The themes directory is designed to be modular, with only one theme ever symlinked at a time. Each subdirectory for the config of each theme contains only the theme configuration for the major applications. The wallpapers directory is also there as a point of reference. The scripts directory contains all the scripts used by various configuration files. Finally setup contains a modified pacman.conf and a package installer.

## Install and Manual Setup
To start off, you need to install arch. Standard process, follow the wiki. The following packages need to be installed with pacstrap before the first boot:
1. amd-ucode
2. base
3. base-devel
4. linux
5. linux-headers
6. linux-firmware
7. lib32-nvidia-580xx-utils
8. nvidia-580xx-dkms
9. nvidia-580xx-utils
10. grub
11. efibootmgr
12. dosfstools
13. git
14. networkmanager
15. sudo
16. pipewire
17. pipewire-pulse
18. wireplumber
19. yay
20. yay-debug
21. reflector
These will give the basic operational capacity required to actually boot into the system and run the install scripts and get things like hyprland to work.

Before running `install-packages.sh`, it is optimal to first edit the pacman configuration, specifically for the purposes of using CachyOS optimized packages. This involves the following:
1. Copy `setup/pacman.conf` to `/etc/pacman.conf` in place of the default config
2. Ensure that the cachyos-keyring and cachyos-v4-mirrorlist packages are installed
Be aware that this is not a complete desktop environment, it's just the applications I tend to use on a daily basis. There will be no nano or vim, only neovim.

In order for everything to work properly, this repo must be installed as `~/.dotfiles`. This is because things like hyprpaper and waybar call files in this repository directly. **DO NOT MOVE STUFF AROUND!!!** (I'll make this better later)

## Application Setup
You need to log into the following applications in order for them to work:
+ Discord
+ Steam
+ Spotify
+ Firefox
+ Heroic Games Launcher
+ Thunderbird

### zsh
zsh will require you to run `chsh -S $(which zsh)` and `source ~/.zshrc` in order to work

### OpenRGB
OpenRGB will require you to identify and configure all of your RGB devices. 

### Tailscale
Make sure to enable the tailscaled service and join the tailscale network. This will allow access to the trilium notes sync and syncthing

### SSH
Generate new ssh keys in `.ssh` and share them with the servers on the network. Also update github keys. Create a config in .ssh for server access through ssh-key only. Make sure to add new keys to the keychain.

### Trilium Notes
Make sure you place the copy of your notes database or the backup.db backup as document.db in `~/.local/share/trilium-data`. Set up the sync with the server as well. Then edit crontab to use rsync to backup the notes database to `.backups`.

### Neovim
Make Neovim successfully installs all the plugins, and then run TSInstall on all the languages (go, c, cpp, rust, markdown, python, lua, haskell).

## Additional Notes
In order to get my Corsair Vengence RGB RAM to work with OpenRGB, I had to add the following line to `/etc/
```sh
GRUB_CMDLINE_LINUX="acpi_enforce_resources=lax pci=assign-busses"
```
