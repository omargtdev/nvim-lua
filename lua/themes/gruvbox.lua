local ok, gruvbox = pcall(require, 'gruvbox')

if not ok then
	return
end

vim.o.background = "dark"

gruvbox.setup({
	italic = false,
})

vim.cmd("colorscheme gruvbox")
