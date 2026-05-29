#!/bin/bash

STATE_FILE="$HOME/.config/theme-state"
CURRENT=$(cat "$STATE_FILE" 2>/dev/null || echo bierstadt)

if [ "$CURRENT" == "space" ]; then
    # hyprctl dispatch 'hl.dsp.window.set_prop({ prop = "active_border_color", value = "rgba(44d9bf5ff) rgba(1a3a5cff) 45", window = "class:.*"})'
    hyprctl hyprpaper wallpaper "DP-6, $HOME/.dotfiles/themes/wallpapers/Albert_Bierstadt_-_A_Storm_in_the_Rocky_Mountains_Mt._Rosalie.jpg"
    hyprctl hyprpaper wallpaper "DP-7, $HOME/.dotfiles/themes/wallpapers/Albert_Bierstadt_-_Yellowstone_Falls.jpg"

    ln -sf ~/.dotfiles/themes/bierstadt/theme.lua ~/.config/nvim/lua/theme.lua
    ln -sf ~/.dotfiles/themes/bierstadt/current-theme.conf ~/.config/kitty/current-theme.conf
    ln -sf ~/.dotfiles/themes/bierstadt/style.css ~/.config/waybar/style.css

    pkill -SIGUSR1 kitty
    pkill waybar; waybar > /dev/null 2>&1 &
    $HOME/.dotfiles/scripts/waybar_scripts/waybar_auto_hide &
    echo bierstadt > $STATE_FILE
elif [ "$CURRENT" == "bierstadt" ]; then
    # hyprctl dispatch 'hl.dsp.window.set_prop({ prop = "active_border_color", value = "rgba(4d9bf5ff) rgba(1a3a5cff) 45", window = "class:.*"})'
    # This is the syntax for switching border colors, but it's not universal, so I'm leaving it out for now
    hyprctl hyprpaper wallpaper "DP-6, $HOME/.dotfiles/themes/wallpapers/Apollo_Soyuz_Handshake.jpg, fill"
    hyprctl hyprpaper wallpaper "DP-7, $HOME/.dotfiles/themes/wallpapers/The_Space_Mural.jpg"

    ln -sf ~/.dotfiles/themes/space/theme.lua ~/.config/nvim/lua/theme.lua
    ln -sf ~/.dotfiles/themes/space/current-theme.conf ~/.config/kitty/current-theme.conf
    ln -sf ~/.dotfiles/themes/space/style.css ~/.config/waybar/style.css

    pkill -SIGUSR1 kitty
    pkill waybar; waybar > /dev/null 2>&1 &
    $HOME/.dotfiles/scripts/waybar_scripts/waybar_auto_hide &
    echo space > $STATE_FILE
fi


