------------------------
---- START ON LAUNCH ----
-------------------------

hl.on("hyprland.start", function() 
    hl.exec_cmd("waybar & hyprpaper")
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("ssh-agent -D -a /tmp/ssh-agent.sock")
    hl.exec_cmd("$HOME/.dotfiles/scripts/waybar_auto_hide")
end)

---------------------------------
---- ENVIRONMENTAL VARIABLES ----
---------------------------------

--- Cursor Size ---
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

--- Ensures Programs Work ---
hl.env("SSH_AUTH_SOCK", "$XDG_RUNTIME_DIR/ssh-agent.socket")
hl.env("HYPRSHOT_DIR", "/home/kawiggles/Pictures/Screenshots")

--- IMPORTANT! Makes sure Nvidia GPUs work ---
hl.env("STEAM_FORCE_DESKTOPUI_SCALING", "1.2");
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("GDK_SCALE", "1")

--- For making yazi the filechooser
hl.env("GTK_USE_PORTAL", "1")
hl.env("GDK_DEBUG", "portals")

---------------------
---- PERMISSIONS ----
---------------------

hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
