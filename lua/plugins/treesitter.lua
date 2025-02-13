return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {"lua", "javascript", "python", "cpp", "cuda"},
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<C-space>',
                    node_incremental = '<C-space>',
                    scope_incremental = false,
                    node_incremental = '<bs>',
                },
            },
        })
    end,
}
