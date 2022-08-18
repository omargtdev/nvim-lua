local ok, nvimTree = pcall(require, 'nvim-tree')

if not ok then
	return
end

nvimTree.setup({
	system_open = {
		cmd = vim.fn.has("win32") and "explorer.exe" or "",
	},
	view = {
		adaptive_size = true,
		mappings = {
			custom_only = true,
			list = {
				{ key = "o", action = "o"  },
				{ key = "i", action = "toggle_file_info"  },
				{ key = "<C-d>", action = "cd"  },
				{ key = "s", action = "split"  },
				{ key = "v", action = "vsplit"  },
				{ key = "a", action = "create"  },
				{ key = "d", action = "remove"  },
				{ key = "r", action = "rename"  },
				{ key = "y", action = "copy_name"  },
				{ key = "Y", action = "copy_absolute_path"  },
				{ key = "R", action = "refresh"  },
				{ key = "n", action = "next_sibling"  },
				{ key = "p", action = "prev_sibling"  },
				{ key = "P", action = "parent_node"  },
				{ key = "f", action = "live_filter"  },
				{ key = "F", action = "clear_live_filter"  },
				{ key = ".", action = "run_file_command"  },
				{ key = "S", action = "search_node" },
				{ key = "<C-s>", action = "system_open" },
			}
		}
	},
})
