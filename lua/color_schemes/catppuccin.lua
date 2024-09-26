return {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        opts = { transparent_background = true, },
        config = function()
            vim.cmd.colorscheme "catppuccin"
        end
}
