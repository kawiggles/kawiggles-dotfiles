----------------------
---- WINDOW RULES ----
----------------------

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name = "yazi-filepicker",
    match = { class = "^(file_chooser)$" },
    float = true,
    size = { 1000, 650 },
    center = false,
})

--- hl.workspace_rule({ workspace = "1", layout = "lua:columns" })

-----------------
---- LAYOUTS ----
-----------------

hl.layout.register("columns", {
    recalculate = function(ctx)
        --- Array of arrays, where each array is a column of windows
        local col_list = {}

        local n = #ctx.targets
        if n == 0 then return end

        local n_cols = (n < 3) and n or 3
        for i = 1, n_cols do col_list[i] = {} end

        for i, target in ipairs(ctx.targets) do
            if i < 4 then
                target:place(ctx:column(i, n))
                table.insert(col_list[i], target)
            else
            end
        end
    end,
})
