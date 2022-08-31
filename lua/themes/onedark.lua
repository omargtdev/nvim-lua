local ok, onedark = pcall(require, 'onedark')

if not ok then
	return
end

-- Config
onedark.setup {
	style = 'deep',
	transparent = false
}

-- Enable theme
onedark.load()
