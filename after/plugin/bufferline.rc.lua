local ok, bufferline = pcall(require, 'bufferline')

if not ok then
	return
end

bufferline.setup{}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Tabbing move
map('n', '<TAB>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', opts)
map('n', '<leader>bcl', ':BufferLineCloseLeft<CR>', opts)
map('n', '<leader>bcr', ':BufferLineCloseRight<CR>', opts)
map('n', '<leader>bcp', ':BufferLinePickClose<CR>', opts)
map('n', '<leader>bp', ':BufferLinePick<CR>', opts)
