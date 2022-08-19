local ok, _ = pcall(require, "harpoon");

if not ok then
	return
end

vim.keymap.set('n', '<leader>hm', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>')
vim.keymap.set('n', '<leader>ha', '<cmd>lua require("harpoon.mark").add_file()<CR>')

vim.keymap.set('n', '<TAB>', '<cmd>lua require("harpoon.ui").nav_next()<CR>')
vim.keymap.set('n', '<S-TAB>', '<cmd>lua require("harpoon.ui").nav_prev()<CR>')

vim.keymap.set('n', '<leader>h1', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>')
vim.keymap.set('n', '<leader>h2', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>')
vim.keymap.set('n', '<leader>h3', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>')
vim.keymap.set('n', '<leader>h4', '<cmd>lua require("harpoon.ui").nav_file(4)<CR>')
vim.keymap.set('n', '<leader>h5', '<cmd>lua require("harpoon.ui").nav_file(5)<CR>')
