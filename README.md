# USS-MONITOR dotfiles
These are the dotfiles for my laptop running Arch Linux. They are pretty much identical to my desktop dotfiles, except much simpler. For instance, there is only one wallpaper and only one theme. The laptop typically only has one monitor. This means that overall the stow packages, hyprland keybinds, and other things are much simpler.
## Tree and Organization

.dotfiles
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
│   ├── ufw.sh
│   ├── waybar_auto_hide
│   └── yazi-wrapper.sh
├── setup
│   ├── install.sh
│   └── pacman.conf
├── shell
│   ├── .config
│   │   ├── kitty
│   │   │   ├── current-theme.conf
│   │   │   └── kitty.conf
│   │   └── .zshrc
│   └── .zshrc
├── wallpaper
│   └── Flooded-Strand-MtG-Art.jpg
├── waybar
│   └── .config
│       └── waybar
│           ├── config.jsonc
│           └── style.css
└── xdg-desktop
    └── .config
        ├── xdg-desktop-portal
        │   └── portals.conf
        └── xdg-desktop-portal-termfilechooser
            └── config

## Installation and Setup
