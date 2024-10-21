return {
    "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_log_ignore = ({
        "Underfull",
        "Overfull",
        "specifier changed to",
        "Token not allowed in a PDF string",
    })
    vim.g.vimtex_delim_toggle_mod_list = ({
        {'\\left', '\\right'},
        {'\\bigl', '\\bigr'},
        {'\\biggl', '\\biggr'}
    })

  end
}
