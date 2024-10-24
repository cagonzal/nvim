vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set cursorline")
vim.cmd("set breakindent")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.keymap.set('i', 'kj', '<ESC>')
vim.wo.relativenumber = true
vim.g.mapleader = " "

-- Insert new line without enetering insert mode 
vim.keymap.set('n', '<CR>', 'o<Esc>k')
-- Window management 
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically 
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- sequalize windows
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>") -- close window 

vim.keymap.set("n", "<leader>j", ":resize +2<cr>")
vim.keymap.set("n", "<leader>k", ":resize -2<cr>")
vim.keymap.set("n", "<leader>h", ":vertical resize +2<cr>")
vim.keymap.set("n", "<leader>l", ":vertical resize -2<cr>")

vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>")
vim.keymap.set("n", "<leader>bp", "<cmd>bprev<CR>")
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>")
--vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>") -- create a new tab
--vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") -- close current tab
--vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>") -- go to next tab
--vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>") -- go to prev tab
--vim.keymap.set("n", "<leader>tf", "<cmd>tab new %<CR>") -- open current buffer in a new tab
-- Navigation
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set("n", "<leader>sr", ":%s/<C-r><C-w>//gc<Left><Left><Left>")

vim.opt.mouse = ""

vim.g.nightflyCursorColor = true


function SpellToggle()
    if vim.opt.spell:get() then
        vim.opt_local.spell = false
        vim.opt_local.spelllang = "en"
    else
        vim.opt_local.spell = true
        vim.opt_local.spelllang = {"en_us"}
    end
end
vim.keymap.set("n", "<leader>5", ":lua SpellToggle()<cr>")
vim.keymap.set("n", "<leader>z", "[s1z=``")
