local ok, _  = require('move')
if not ok then return end

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true } -- leader vim.g.mapleader = ' '

-- Move blocks and indent
map("v", "L", ":MoveHBlock(1)<CR>", opts)
map("v", "H", ":MoveHBlock(-1)<CR>", opts)
map("v", "J", ":MoveBlock(1)<CR>", opts)
map("v", "K", ":MoveBlock(-1)<CR>", opts)
