local okMason, mason = pcall(require, 'mason')
local okMasonLspConfig, masonLspconfig = pcall(require, 'mason-lspconfig')

if not okMason and not okMasonLspConfig then
	return
end

mason.setup()
masonLspconfig.setup({
	automatic_installation = true
})
