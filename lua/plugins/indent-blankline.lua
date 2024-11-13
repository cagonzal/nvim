return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        -- your options here
    },
    config = function()
        require("ibl").setup()
    end,
}
