-- Config based on https://rdrn.me/neovim-2025/
-- currently missing vim-surround 
vim.opt.hlsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.cmd("set mouse=")
vim.opt.showmode = false
vim.opt.spelllang = "en_gb"

-- Leader (this is here so plugins etc pick it up)
vim.g.mapleader = " "  -- anywhere you see <leader> means hit ,

-- use nvim-tree instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Use system clipboard
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

-- Display settings
vim.opt.termguicolors = true
vim.o.background = "light" -- set to "dark" for dark theme

-- Scrolling and UI settings
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.signcolumn = 'yes'
vim.opt.wrap = true
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 8

-- Title
vim.opt.title = true
vim.opt.titlestring = "nvim"

-- Persist undo (persists your undo history between sessions)
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.undofile = true

-- Tab stuff
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Search configuration
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true

-- open new split panes to right and below (as you probably expect)
vim.opt.splitright = true
vim.opt.splitbelow = true

-- keymaps 
vim.keymap.set('i', 'kj', '<ESC>')
 -- insert new line without interering inset mode 
vim.keymap.set('n', '<CR>', 'o<Esc>k')

-- Window management
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically 
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally 
vim.keymap.set("n", "<leader>se", "<C-w>=") -- sequalize windows 
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>") -- close window

vim.keymap.set("n", "<leader>j", ":resize +2<cr>")
vim.keymap.set("n", "<leader>k", ":resize -2<cr>")
vim.keymap.set("n", "<leader>j", ":vertical resize +2<cr>")
vim.keymap.set("n", "<leader>l", ":vertical resize -2<cr>")

vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>")
vim.keymap.set("n", "<leader>bp", "<cmd>bprev<CR>")
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>")

-- Cycle through relative numbers, numbers, and nonumbers 
vim.keymap.set("n", "<leader>n", function()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
    vim.wo.number = true
  elseif vim.wo.number then
    vim.wo.number = false
  else
    vim.wo.relativenumber = true
    vim.wo.number = true -- this makes is so relative line number shows absolute number of highlighted line 
  end
end, { desc = "Cycle number display" })

vim.keymap.set("n", "<leader>w", ":set wrap! wrap?<CR>")

-- Navigation 
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- LSP
-- vim.lsp.inlay_hint.enable(true)
vim.keymap.set("n", "<leader>ih", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
  vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
end, { desc = "Toggle LSP inlay hints" })

local plugins = {
  { "nvim-lua/plenary.nvim" },       -- used by other plugins
  { "nvim-tree/nvim-web-devicons" }, -- used by other plugins

  -- Gruvbox theme (feel free to choose another!)
  { 
      "ellisonleao/gruvbox.nvim",
      priority = 1000,
      config = function()
          vim.cmd("colorscheme gruvbox")
      end,
  },


  -- Splash art 
  { "goolord/alpha-nvim" },

  { "nvim-lualine/lualine.nvim" },  -- status line

  {
      "akinsho/bufferline.nvim",
      version = "*",
      dependencies = "nvim-tree/nvim-web-devicons",
      config = function()
          require("bufferline").setup({
              options = {
                  mode = "buffers",
                  separator_style = "slant",
              },
          })
      end,
  },

  { "nvim-tree/nvim-tree.lua" },    -- file browser

  { "christoomey/vim-tmux-navigator" }, -- tmux navigator 

  -- Telescope command menu
  { "nvim-telescope/telescope.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- TreeSitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- LSP stuff
  { 'mason-org/mason.nvim' },          -- installs LSP servers
  { 'neovim/nvim-lspconfig' },         -- configures LSPs
  { 'mason-org/mason-lspconfig.nvim' },-- links the two above

  -- Some LSPs don't support formatting, this fills the gaps
  { 'stevearc/conform.nvim' },

  -- Autocomplete engine (LSP, snippets etc)
  -- see keymap:
  -- https://cmp.saghen.dev/configuration/keymap.html#default
  {
    'saghen/blink.cmp',
    version = '1.*',
    opts = {
        keymap = { preset = 'default' },
        sources = {
            default = { 'lsp', 'path', 'buffer' },
        },
    },
  },
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(plugins)

vim.cmd.colorscheme("gruvbox")  -- activate the theme
require("lualine").setup()      -- the status line
require("nvim-tree").setup()    -- the tree file browser panel
require("telescope").setup()    -- command menu

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "cpp",
    "python",
    "cuda",
    "fortran",
    -- "latex",
    -- etc!
  },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true, },
})
-- some stuff so code folding uses treesitter instead of older methods
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "pylsp",
    "clangd",
    -- etc!
  },
})

local lspconfig = require("lspconfig")

local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Nvim-Tree 
vim.keymap.set("n", "<C-t>", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<leader>ee", ":NvimTreeFindFile<CR>")
vim.keymap.set("n", "<leader>ef", ":NvimTreeClose<CR>")

-- Tmux Navigator 
vim.keymap.set("n", "C-h", ":TmuxNavigateLeft<CR>")
vim.keymap.set("n", "C-j", ":TmuxNavigateDown<CR>")
vim.keymap.set("n", "C-k", ":TmuxNavigateUp<CR>")
vim.keymap.set("n", "C-l", ":TmuxNavigateRight<CR>")

-- Telescope
local tele_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", tele_builtin.git_files, {})
vim.keymap.set("n", "<leader>fa", tele_builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", tele_builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", tele_builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", tele_builtin.help_tags, {})

-- format option flags are 
-- c -> auto wrap comments 
-- r -> continue comments on enter
-- o -> continue comments with o or O
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    vim.opt_local.comments = ""
  end,
})
