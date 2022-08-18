local ok, telescope = pcall(require, "telescope")

if not ok then return end

local actions = require("telescope.actions")

local open_file_explorer = function(prompt_bufnr)
	-- Modifying original function from telescope-file-browser
	local action_state  = require("telescope.actions.state")
	local fb_utils = require("telescope._extensions.file_browser.utils")

  local quiet = action_state.get_current_picker(prompt_bufnr).finder.quiet
  local selections = fb_utils.get_selected_files(prompt_bufnr, true)
  if vim.tbl_isempty(selections) then
    fb_utils.notify("actions.open", { msg = "No selection to be opened!", level = "INFO", quiet = quiet })
    return
  end

	-- Support to wsl
	local hasWsl = vim.fn.has "wsl" == 1
	local pathWsl = "\\\\wsl$\\Arch"

	-- Change start to explorer, because of error that Idk how to explain for now xD
  local cmd = (vim.fn.has "win32" == 1 or hasWsl) and "explorer.exe" or vim.fn.has "mac" == 1 and "open" or "xdg-open"
  for _, selection in ipairs(selections) do
    require("plenary.job")
      :new({
        command = cmd,
        args = { hasWsl and pathWsl .. selection:absolute():gsub("/", "\\") or selection:absolute() },
      })
      :start()
	end
  actions.close(prompt_bufnr)
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup{
  defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
    mappings = {
			n = {
				["q"] = actions.close, -- Close telescope window with q in normal mode
				["<C-x>"] = actions.select_horizontal, -- split below
        ["<C-v>"] = actions.select_vertical, -- split next to
			},
    }
  },
  extensions = {
		file_browser = {
			theme = "dropdown",
    	hijack_netrw = true,
			previewer = false,
			path = '%:p:h',
			cwd = vim.fn.expand('%:p:h'),
			respect_gitignore = false,  -- Not respect .gitignore files to show
			hidden = true, -- Show hidden files (e.g. .gitignore)
			grouped = true,
			initial_mode = 'normal',
			layout_config = { height = 40 },
			mappings = {
				["n"] = {
					-- C-<key> is for insert mode
					["o"] = open_file_explorer,
					["c"] = fb_actions.create,
					["r"] = fb_actions.rename,
					["m"] = fb_actions.move,
					["y"] = fb_actions.copy,
					["d"] = fb_actions.remove,
					["p"] = fb_actions.goto_parent_dir,
					["e"] = fb_actions.goto_home_dir,
					["w"] = fb_actions.goto_cwd, -- Go to current dir
					["h"] = fb_actions.toggle_hidden
				},
				["i"] = {
					["<C-o>"] = open_file_explorer
				}
			}
		}
  }
}

-- Extensions
telescope.load_extension "file_browser" -- Tree

local builtin = require("telescope.builtin")

-- Maps
vim.keymap.set('n', '<leader>n', ':Telescope file_browser<CR>')
vim.keymap.set('n', 'tf', function ()
	builtin.find_files({
		no_ignore = false, -- Not respect .gitignore files to show
		--hidden = true -- Show hidden files (e.g. .gitignore)
	})
end)
vim.keymap.set('n', 'tg', ':Telescope live_grep<CR>')
vim.keymap.set('n', 'tb', ':Telescope buffers<CR>')
vim.keymap.set('n', 'td', ':Telescope diagnostics<CR>')
vim.keymap.set('n', 'tr', ':Telescope resume<CR>')
