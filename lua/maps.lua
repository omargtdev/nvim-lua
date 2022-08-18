local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- Basic commands
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('i', 'jk', '<Esc>', opts)

-- Move between windows
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)

-- Better identation
map('v', '>', '>gv', opts)
map('v', '<', '<gv', opts)

-- Resize windows
map("n", "J", ":resize -1<CR>", opts)
map("n", "K", ":resize +1<CR>", opts)
map("n", "H", ":vertical resize -1<CR>", opts)
map("n", "L", ":vertical resize +1<CR>", opts)
