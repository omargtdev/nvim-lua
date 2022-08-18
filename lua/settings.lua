local o = vim.o -- vim options

o.number = true
o.relativenumber = true

o.tabstop = 2
o.shiftwidth = 2
o.autoindent = true
o.scrolloff = 5
o.wrap = false

o.mouse = 'a'
o.cursorline = true

o.textwidth = 120
o.encoding = 'utf-8'
o.clipboard = 'unnamed'


o.hlsearch = false
o.incsearch = true
o.ignorecase = true

o.splitbelow = true
o.splitright = true
o.termguicolors = true

o.hidden = true
o.showmode = false
o.signcolumn = "yes"

o.whichwrap = 'h,l'

-- Windows
if vim.fn.has("win32") == 1 then
	-- Support powershell
	vim.cmd("let &shell = 'powershell'")
	vim.cmd("let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'")
	vim.cmd("let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'")
	vim.cmd("let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'")
	vim.cmd("set shellquote= shellxquote=")
end
