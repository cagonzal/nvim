return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        -- First set up the colorscheme config (optional)
        require("gruvbox").setup({
            -- You can set configuration options here, for example:
            -- contrast = "hard", -- can be "hard", "soft" or empty string
            -- transparent_mode = false,
        })
        -- Then set the colorscheme
        vim.cmd.colorscheme("gruvbox")
    end
}
