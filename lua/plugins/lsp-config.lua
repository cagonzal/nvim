return {
    {
        'williamboman/mason.nvim',
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "jedi_language_server", "ltex"}
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- import lspconfig plugin
            local lspconfig = require("lspconfig")

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.jedi_language_server.setup({
                capabilities = capabilities
            })
            lspconfig.ltex.setup({
                capabilities = capabilities
            })
        end
    }
}
