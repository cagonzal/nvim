return {

    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
        'nvim-lua/plenary.nvim',
        {"nvim-telescope/telescope-fzf-native.nvim", build="make"},
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
        },
        config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-u>"] = actions.move_selection_previous,
                        ["<C-i>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            },
        })

        telescope.load_extension("fzf")

        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
        keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>")
            --local builtin = require("telescope.builtin")
            --vim.keymap.set('n', '<C-p>', builtin.find_files, {})
            --vim.keymap.set('n','<leader>fg', builtin.live_grep, {})
        end,
    },
    {
       "nvim-telescope/telescope-ui-select.nvim",
       config = function()
           require("telescope").setup({
               extensions = {
                   ["ui-select"] = {
                       require("telescope.themes").get_dropdown {
                       }
                   }
               }
           })
           require("telescope").load_extension("ui-select")
       end
    },
}
