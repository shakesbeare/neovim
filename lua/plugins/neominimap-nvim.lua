return {
    "Isrothy/neominimap.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim",
    },
    init = function()
        vim.g.neominimap = {
            layout = "split",
            split = {
                minimap_width = 20,
                fix_width = true,
                close_if_last_window = true,
            },
        }
    end,
}
