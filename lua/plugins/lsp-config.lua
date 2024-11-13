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
            local lspconfig = require("lspconfig")

            -- Define on_attach function with capability checks
            local on_attach = function(client, bufnr)
                -- Only set keymaps if we have an active LSP client
                if client.server_capabilities then
                    -- Create a local function to make mapping easier
                    local opts = { buffer = bufnr }
                    local function map(mode, lhs, rhs)
                        vim.keymap.set(mode, lhs, rhs, opts)
                    end

                    -- Set up your keymaps
                    map('n', 'K', vim.lsp.buf.hover)
                    map('n', 'gd', vim.lsp.buf.definition)
                    map('n', '<leader>ca', vim.lsp.buf.code_action)
                end
            end

            -- Set up each LSP server with the on_attach function
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })

            lspconfig.jedi_language_server.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })

            lspconfig.ltex.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "text", "markdown", "tex", "latex" },
                settings = {
                    ltex = {
                        language = "en-US",
                        enabled = { "latex", "tex", "bib", "markdown", "text" }
                    }
                }
            })
        end
    }
}
