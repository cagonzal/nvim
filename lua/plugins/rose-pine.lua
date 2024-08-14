return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        return {
            styles = {
                transparency = true,
            },
            vim.cmd.colorscheme "rose-pine"
        }
    end,
}
