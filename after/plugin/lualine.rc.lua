local ok, lualine = pcall(require, 'lualine')

if not ok then
	return
end

lualine.setup{
	extensions = { "nvim-tree" },
	options = { section_separators = '', component_separators = '' }
}
