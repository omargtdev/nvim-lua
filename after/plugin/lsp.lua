local ok, lspconfig = pcall(require, 'lspconfig')

if not ok then
	return
end

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
	-- disable virtual text
	virtual_text = false,
	-- show signs
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	}
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
	width = 60,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
	width = 60,
})

------------------- Config for every server ----------------------------------

local lsp_flags = {
	debounce_text_changes = 150,
}

local on_attach = function(client, bufnr)

	local opts = { noremap = true, silent = true }

	-- Keymaps
	--vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gk", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gK", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gnd", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gpd", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gsd", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "grn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"gl",
		'<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>',
		opts
	)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format{async=true}' ]])

	-- Set highlight to common words and blocks with illuminate
	local illuminate_ok, illuminate = pcall(require, "illuminate")
	if illuminate_ok then
		illuminate.on_attach(client)
	end

	-- Help with complete arguments or types in variables
	local signature_ok, signature = pcall(require, "lsp_signature")
	if signature_ok then
		signature.on_attach({
			toggle_key = "<C-k>",
			floating_window = false,
			hint_prefix = "-> "
		})
	end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-----------------------------------------------------------------------------------------------

-- Servers 
local servers = { "tsserver", "jsonls", "sumneko_lua", "pyright" }

-- Set options to servers
for _, server in pairs(servers) do
	local opts = { on_attach = on_attach, flags = lsp_flags, capabilities = capabilities }

	-- Set specific options for specific servers if exists
	local has_custom_opts, server_custom_opts = pcall(require, "lsp-settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end

	-- Set the configuration
	lspconfig[server].setup(opts)
end
