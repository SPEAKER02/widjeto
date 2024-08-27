return {
    -- Інші плагіни

    -- Додавання плагіну vim-godot
    {
        "habamax/vim-godot",
        config = function()
            -- Можна додати додаткову конфігурацію для плагіну тут
            vim.g.godot_executable = "godot"
            vim.g.godot_executable_path = "/usr/bin/godot"
        end,
        event = "BufReadPost",
    }
}
