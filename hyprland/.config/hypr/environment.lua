-------------------------
---- START ON LAUNCH ----
-------------------------

hl.on("hyprland.start", function() 
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("ssh-agent -D -a /tmp/ssh-agent.sock")
    hl.exec_cmd("$HOME/.dotfiles/scripts/change-theme.sh")
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
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")

--- And these make GTK stuff work ---
hl.env("GTK_USE_PORTAL", "1")
hl.env("GDK_DEBUG", "portals")

---------------------
---- PERMISSIONS ----
---------------------

hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
