------------------
---- MONITORS ----
------------------

--- Main Monitor ---
hl.monitor({
    output = "DP-6",
    mode = "3840x2160@143.99",
    position = "0x0",
    scale = 1,
})

--- Side Monitor ---
hl.monitor({
    output = "DP-7",
    mode = "1920x1080@60",
    position = "3840x165",
    scale = 1,
    transform = 1,
})
